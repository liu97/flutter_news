// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'newsListBean.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NewsListBean _$NewsListBeanFromJson(Map<String, dynamic> json) {
  return NewsListBean(
      json['channelId'] as int,
      json['totalNum'] as int,
      json['message'] as String,
      json['errorCode'] as int,
      (json['articles'] as List)
          ?.map((e) =>
              e == null ? null : NewsList.fromJson(e as Map<String, dynamic>))
          ?.toList());
}

Map<String, dynamic> _$NewsListBeanToJson(NewsListBean instance) =>
    <String, dynamic>{
      'channelId': instance.channelId,
      'totalNum': instance.totalNum,
      'message': instance.message,
      'errorCode': instance.errorCode,
      'articles': instance.articles
    };
