// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'video.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

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
