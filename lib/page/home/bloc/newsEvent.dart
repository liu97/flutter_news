import 'package:equatable/equatable.dart';

abstract class NewsEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class Fetch extends NewsEvent {
  final Function successCallback; // 告诉切面请求成功回调
  final Function failCallback; // 告诉切面请求失败回调
  final bool isRefresh; // 用来判断是否需要刷新列表
  Fetch(
      {this.isRefresh: true,
      this.successCallback: initCallback,
      this.failCallback: initCallback});

  static initCallback(result) {}

  @override
  List<Object> get props => [successCallback, failCallback];
}
