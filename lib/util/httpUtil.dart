import 'dart:io';
import 'dart:convert';
import 'package:cookie_jar/cookie_jar.dart';
import 'package:dio/dio.dart';
import 'package:dio_cookie_manager/dio_cookie_manager.dart';
import 'package:flutter_news/api/api.dart';
import 'package:path_provider/path_provider.dart';
import 'package:equatable/equatable.dart';

// http请求封装，包含get、post、downloadFile
class HttpUtil {
  Dio dio;
  BaseOptions options;

  CancelToken cancelToken = CancelToken();

  HttpUtil() {
    //BaseOptions、Options、RequestOptions 都可以配置参数，优先级别依次递增，且可以根据优先级别覆盖参数
    options = BaseOptions(
      //请求基地址,可以包含子路径
      baseUrl: Api.BASE_URL,
      //连接服务器超时时间，单位是毫秒.
      connectTimeout: 10000,
      //响应流上前后两次接受到数据的间隔，单位为毫秒。
      receiveTimeout: 5000,
      //Http请求头.
      headers: {},
      //请求的Content-Type，默认值是"application/json; charset=utf-8",Headers.formUrlEncodedContentType会自动编码请求体.
      // contentType: Headers.formUrlEncodedContentType,
      //表示期望以那种格式(方式)接受响应数据。接受四种类型 `json`, `stream`, `plain`, `bytes`. 默认值是 `json`,
      // responseType: ResponseType.plain,
    );

    dio = Dio(options);

    _manageInterceptors();
  }

  _manageInterceptors() async {
    //Cookie管理
    Directory documentsDir = await getApplicationDocumentsDirectory();
    String documentsPath = documentsDir.path;
    var dir = new Directory("$documentsPath/cookies");
    await dir.create();
    dio.interceptors.add(CookieManager(PersistCookieJar(dir: dir.path)));

    //添加拦截器
    dio.interceptors
        .add(InterceptorsWrapper(onRequest: (RequestOptions options) {
      print("请求之前");
      // Do something before request is sent
      return options; //continue
    }, onResponse: (Response response) {
      print("响应之前");
      // Do something with response data
      return response; // continue
    }, onError: (DioError e) {
      print("错误之前");
      // Do something with response error
      return e; //continue
    }));
  }

  // get请求
  get(String url,
      {Map<String, dynamic> data,
      Options options,
      CancelToken cancelToken}) async {
    var result;
    try {
      Response response = await dio.get(url,
          queryParameters: data, options: options, cancelToken: cancelToken);
      print('get success---------${response.statusCode}');
      print('get success---------${response.data}');
      result = formatError(data: json.decode(response.toString()));
    } catch (e) {
      print('get error---------$e');
      result = formatError(error: e);
    }

    return result;
  }

  // post请求
  post(String url,
      {Map<String, dynamic> data,
      Options options,
      CancelToken cancelToken}) async {
    var result;
    try {
      Response response = await dio.post(url,
          queryParameters: data, options: options, cancelToken: cancelToken);
      print('post success---------${response.data}');
      result = formatError(data: json.decode(response.toString()));
    } catch (e) {
      print('post error---------$e');
      result = formatError(error: e);
    }
    return result;
  }

  // 下载文件
  downloadFile(String urlPath, dynamic savePath) async {
    var result;
    try {
      Response response = await dio.download(urlPath, savePath,
          onReceiveProgress: (int count, int total) {
        //进度
        print("$count $total");
      });
      print('downloadFile success---------${response.data}');
      result = formatError(data: response.data);
    } catch (e) {
      print('downloadFile error---------$e');
      result = formatError(error: e);
    }
    return result;
  }

  // error统一处理
  formatError({dynamic error, Map<String, dynamic> data}) {
    if (error != null) {
      return ExceptionHandle.handleException(error);
    } else if (data != null) {
      // 与后端约定errorCode不为0时也为报错
      if (data['errorCode'] == 0) {
        return data;
      } else {
        return HttpError(data['errorCode'], data['message']);
      }
    } else {
      return ExceptionHandle.handleException(null);
    }
  }

  //  取消请求
  //  同一个cancel token 可以用于多个请求，当一个cancel token取消时，所有使用该cancel token的请求都会被取消。
  //  所以参数可选
  void cancelRequests(CancelToken token) {
    token.cancel("cancelled");
  }
}

class ExceptionHandle {
  static const int success = 200;
  static const int success_not_content = 204;
  static const int unauthorized = 401;
  static const int forbidden = 403;
  static const int not_found = 404;

  static const int net_error = 1000;
  static const int parse_error = 1001;
  static const int socket_error = 1002;
  static const int http_error = 1003;
  static const int timeout_error = 1004;
  static const int cancel_error = 1005;
  static const int unknown_error = 9999;

  static HttpError handleException(dynamic error) {
    if (error is DioError) {
      if (error.type == DioErrorType.DEFAULT ||
          error.type == DioErrorType.RESPONSE) {
        dynamic e = error.error;
        if (e is SocketException) {
          return HttpError(socket_error, '网络异常，请检查你的网络！');
        }
        if (e is HttpException) {
          return HttpError(http_error, '服务器异常！');
        }
        return HttpError(net_error, '网络异常，请检查你的网络！');
      } else if (error.type == DioErrorType.CONNECT_TIMEOUT ||
          error.type == DioErrorType.SEND_TIMEOUT ||
          error.type == DioErrorType.RECEIVE_TIMEOUT) {
        return HttpError(timeout_error, '连接超时！');
      } else if (error.type == DioErrorType.CANCEL) {
        return HttpError(cancel_error, '取消请求');
      } else {
        return HttpError(unknown_error, '未知异常');
      }
    } else {
      return HttpError(unknown_error, '未知异常');
    }
  }
}

class HttpError extends Equatable {
  final int errorCode;
  final String message;

  HttpError(this.errorCode, this.message);

  @override
  List<Object> get props => [errorCode, message];

  @override
  bool get stringify => true;
}
