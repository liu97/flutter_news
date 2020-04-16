import 'package:json_annotation/json_annotation.dart';

part 'picture.g.dart';

@JsonSerializable()
class Picture{
  int height;
  int width;
  String url;

  Picture(this.height, this.width, this.url);

  //不同的类使用不同的mixin即可
  factory Picture.fromJson(Map<String, dynamic> json) => _$PictureFromJson(json);
  Map<String, dynamic> toJson() => _$PictureToJson(this);
}