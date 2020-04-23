import 'package:json_annotation/json_annotation.dart';
import 'package:equatable/equatable.dart';

part 'recommend.g.dart';

// 新闻列表类
@JsonSerializable()
class Recommend extends Equatable {
  final int channelId;
  final int totalNum;
  final String message;
  final int errorCode;
  final List<News> articles;

  Recommend(this.channelId, this.totalNum, this.message, this.errorCode,
      this.articles);

  @override
  List<Object> get props => [channelId, totalNum, message, errorCode, articles];

  @override
  bool get stringify => true;

  //不同的类使用不同的mixin即可
  factory Recommend.fromJson(Map<String, dynamic> json) =>
      _$RecommendFromJson(json);
  Map<String, dynamic> toJson() => _$RecommendToJson(this);
}

// 新闻类
@JsonSerializable()
class News extends Equatable {
  final String id;
  final String title;
  final String newsId;
  final String mediaId;
  final String mediaName;
  final String articleUrl;
  final int commentNum;
  final int createTime;
  final List<Picture> pics;
  final List<Video> videos;
  int channelId;

  News(
      this.id,
      this.title,
      this.newsId,
      this.mediaId,
      this.mediaName,
      this.articleUrl,
      this.commentNum,
      this.createTime,
      this.pics,
      this.videos,
      this.channelId);

  @override
  List<Object> get props => [
        id,
        title,
        newsId,
        mediaId,
        mediaName,
        articleUrl,
        commentNum,
        createTime,
        channelId
      ];

  @override
  bool get stringify => true;

  //不同的类使用不同的mixin即可
  factory News.fromJson(Map<String, dynamic> json) => _$NewsFromJson(json);
  Map<String, dynamic> toJson() => _$NewsToJson(this);
}

@JsonSerializable()
class Picture extends Equatable {
  final int height;
  final int width;
  final String url;

  Picture(this.height, this.width, this.url);

  @override
  List<Object> get props => [height, width, url];

  @override
  bool get stringify => true;

  //不同的类使用不同的mixin即可
  factory Picture.fromJson(Map<String, dynamic> json) =>
      _$PictureFromJson(json);
  Map<String, dynamic> toJson() => _$PictureToJson(this);
}

@JsonSerializable()
class Video extends Equatable {
  final double duration;
  @JsonKey(name: "hd_id")
  final int hdId;
  final String rate;
  final int height;
  final int width;
  final int type;
  final String url;
  final int size;

  Video(this.duration, this.hdId, this.rate, this.height, this.width, this.type,
      this.url, this.size);

  @override
  List<Object> get props =>
      [duration, hdId, rate, height, width, type, url, size];

  @override
  bool get stringify => true;

  //不同的类使用不同的mixin即可
  factory Video.fromJson(Map<String, dynamic> json) => _$VideoFromJson(json);
  Map<String, dynamic> toJson() => _$VideoToJson(this);
}
