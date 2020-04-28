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
    isLocal,
  }) {
    return NewsLoaded(
      recommend: recommend ?? this.recommend,
      newsList: newsList ?? this.newsList,
      isLocal: isLocal ?? this.isLocal,
    );
  }

  @override
  List<Object> get props => [recommend, newsList, isLocal];

  @override
  bool get stringify => true;
}
