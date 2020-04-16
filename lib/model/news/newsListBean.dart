import 'package:json_annotation/json_annotation.dart';
import './newsList.dart';

part 'newsListBean.g.dart';

@JsonSerializable()
class NewsListBean{
  int channelId;
  int totalNum;
  String message;
  int errorCode;
  List<NewsList> articles;

  NewsListBean(this.channelId, this.totalNum, this.message, this.errorCode, this.articles);

  //不同的类使用不同的mixin即可
  factory NewsListBean.fromJson(Map<String, dynamic> json) => _$NewsListBeanFromJson(json);
  Map<String, dynamic> toJson() => _$NewsListBeanToJson(this);
}