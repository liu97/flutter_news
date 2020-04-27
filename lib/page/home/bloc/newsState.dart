import 'package:equatable/equatable.dart';

import 'package:flutter_news/model/recommend.dart';

abstract class NewsState extends Equatable {
  const NewsState();

  @override
  List<Object> get props => [];
}

class NewsUninitialized extends NewsState {}

class NewsError extends NewsState {}

class NewsLoaded extends NewsState {
  final Recommend recommend;
  final List<News> newsList;
  final bool isLocal;

  const NewsLoaded({
    this.recommend,
    this.newsList,
    this.isLocal,
  });

  NewsLoaded copyWith({
    recommend,
    newsList,
  }) {
    return NewsLoaded(
      recommend: recommend ?? this.recommend,
      newsList: newsList ?? this.newsList,
    );
  }

  @override
  List<Object> get props => [recommend];

  @override
  bool get stringify => true;
}
