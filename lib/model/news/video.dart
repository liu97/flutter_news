import 'package:json_annotation/json_annotation.dart';

part 'video.g.dart';

@JsonSerializable()
class Video{
  double duration;
  @JsonKey(name: "hd_id")
  int hdId;
  String rate;
  int height;
  int width;
  int type;
  String url;
  int size;

  Video(this.duration, this.hdId, this.rate, this.height, this.width, this.type, this.url, this.size);

  //不同的类使用不同的mixin即可
  factory Video.fromJson(Map<String, dynamic> json) => _$VideoFromJson(json);
  Map<String, dynamic> toJson() => _$VideoToJson(this);
}