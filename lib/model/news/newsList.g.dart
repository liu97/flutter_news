// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'newsList.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NewsList _$NewsListFromJson(Map<String, dynamic> json) {
  return NewsList(
      json['title'] as String,
      json['newsId'] as String,
      json['mediaId'] as String,
      json['mediaName'] as String,
      json['articleUrl'] as String,
      json['commentNum'] as int,
      json['createTime'] as int,
      json['channelId'] as int)
    ..pics = (json['pics'] as List)
        ?.map((e) =>
            e == null ? null : Picture.fromJson(e as Map<String, dynamic>))
        ?.toList()
    ..videos = (json['videos'] as List)
        ?.map(
            (e) => e == null ? null : Video.fromJson(e as Map<String, dynamic>))
        ?.toList();
}

Map<String, dynamic> _$NewsListToJson(NewsList instance) => <String, dynamic>{
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
