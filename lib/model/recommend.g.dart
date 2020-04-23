// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recommend.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Recommend _$RecommendFromJson(Map<String, dynamic> json) {
  return Recommend(
      json['channelId'] as int,
      json['totalNum'] as int,
      json['message'] as String,
      json['errorCode'] as int,
      (json['articles'] as List)
          ?.map((e) =>
              e == null ? null : News.fromJson(e as Map<String, dynamic>))
          ?.toList());
}

Map<String, dynamic> _$RecommendToJson(Recommend instance) => <String, dynamic>{
      'channelId': instance.channelId,
      'totalNum': instance.totalNum,
      'message': instance.message,
      'errorCode': instance.errorCode,
      'articles': instance.articles
    };

News _$NewsFromJson(Map<String, dynamic> json) {
  return News(
      json['id'] as String,
      json['title'] as String,
      json['newsId'] as String,
      json['mediaId'] as String,
      json['mediaName'] as String,
      json['articleUrl'] as String,
      json['commentNum'] as int,
      json['createTime'] as int,
      (json['pics'] as List)
          ?.map((e) =>
              e == null ? null : Picture.fromJson(e as Map<String, dynamic>))
          ?.toList(),
      (json['videos'] as List)
          ?.map((e) =>
              e == null ? null : Video.fromJson(e as Map<String, dynamic>))
          ?.toList(),
      json['channelId'] as int);
}

Map<String, dynamic> _$NewsToJson(News instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'newsId': instance.newsId,
      'mediaId': instance.mediaId,
      'mediaName': instance.mediaName,
      'articleUrl': instance.articleUrl,
      'commentNum': instance.commentNum,
      'createTime': instance.createTime,
      'pics': instance.pics,
      'videos': instance.videos,
      'channelId': instance.channelId
    };

Picture _$PictureFromJson(Map<String, dynamic> json) {
  return Picture(
      json['height'] as int, json['width'] as int, json['url'] as String);
}

Map<String, dynamic> _$PictureToJson(Picture instance) => <String, dynamic>{
      'height': instance.height,
      'width': instance.width,
      'url': instance.url
    };

Video _$VideoFromJson(Map<String, dynamic> json) {
  return Video(
      (json['duration'] as num)?.toDouble(),
      json['hd_id'] as int,
      json['rate'] as String,
      json['height'] as int,
      json['width'] as int,
      json['type'] as int,
      json['url'] as String,
      json['size'] as int);
}

Map<String, dynamic> _$VideoToJson(Video instance) => <String, dynamic>{
      'duration': instance.duration,
      'hd_id': instance.hdId,
      'rate': instance.rate,
      'height': instance.height,
      'width': instance.width,
      'type': instance.type,
      'url': instance.url,
      'size': instance.size
    };
