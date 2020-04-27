import 'package:dio/dio.dart';
import 'package:flutter_news/util/httpUtil.dart';
export 'package:flutter_news/util/httpUtil.dart';
import 'package:flutter_news/db/dao/newsDao.dart';
import 'package:flutter_news/model/recommend.dart';

/// 需要用到httpDb的情况有：
/// 1、提前缓存用户可能需要的数据
/// 2、需要可以离线查看的数据
/// 缓存的数据将存入数据库
/// 其他的情况可以直接使用httpUtil

class NewsHttpDb {
  HttpUtil httpUtil;
  CancelToken cancelToken;
  NewsDao db = NewsDao();

  NewsHttpDb() {
    httpUtil = new HttpUtil();
    cancelToken = httpUtil.cancelToken;
  }

  get(String url,
      {Map<String, dynamic> data,
      Options options,
      CancelToken cancelToken}) async {
    var response = await httpUtil.get(url,
        data: data, options: options, cancelToken: cancelToken);
    if (response is HttpError) {
      return response;
    } else {
      Recommend recommend = Recommend.fromJson(response);

      // 将请求来的数据存储到数据库
      for (int i = 0; i < recommend?.articles?.length; i++) {
        recommend.articles[i].channelId = recommend.channelId;
        db.insert(recommend.articles[i]);
      }
      return recommend;
    }
  }

  getLocal(int channelId, int page, int rows) async {
    List<News> newsList =
        await db.getLimitNews(channelId, offset: (page-1)*rows, limit: rows);
    Recommend recommend =
        Recommend(channelId, newsList.length, 'sql success', 0, newsList);
    return recommend;
  }
}
