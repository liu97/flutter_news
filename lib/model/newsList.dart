import 'package:json_annotation/json_annotation.dart';
import './picture.dart';
import './video.dart';

part 'newsList.g.dart';

@JsonSerializable()
class NewsList{
  String title;
  String newsId;
  String mediaId;
  String mediaName;
  String articleUrl;
  String commentNum;
  DateTime createTime;
  String filterWords;
  List<Picture> pics;
  List<Video> videos;


  NewsList(this.title, this.newsId, this.mediaId, this.mediaName, this.articleUrl, 
  this.commentNum, this.createTime, this.filterWords);

  //不同的类使用不同的mixin即可
  factory NewsList.fromJson(Map<String, dynamic> json) => _$NewsListFromJson(json);
  Map<String, dynamic> toJson() => _$NewsListToJson(this);
}

