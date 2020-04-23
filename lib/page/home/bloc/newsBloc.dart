import 'dart:async';

import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter_news/model/recommend.dart';
import '../httpDb/newsHttpDb.dart';
import './newsEvent.dart';
import './newsState.dart';

class NewsBloc extends Bloc<NewsEvent, NewsState> {
  int rows = 11;
  int channelId;
  NewsBloc({@required this.channelId, this.rows});

  @override
  get initialState => NewsUninitialized();

  @override
  Stream<Transition<NewsEvent, NewsState>> transformEvents(
    Stream<NewsEvent> events,
    TransitionFunction<NewsEvent, NewsState> transitionFn,
  ) {
    return super.transformEvents(
      events.debounceTime(const Duration(milliseconds: 500)),
      transitionFn,
    );
  }

  @override
  Stream<NewsState> mapEventToState(NewsEvent event) async* {
    final currentState = state;
    final NewsHttpDb newsHttpDb = new NewsHttpDb();
    if (event is Fetch) {
      try {
        if (currentState is NewsUninitialized) {
          // 初始状态
          final Recommend recommend = await newsHttpDb.get('/recommend',
              data: {'page': 1, 'rows': rows, 'channelId': channelId});
          final List<News> newsList = recommend.articles;

          yield NewsLoaded(recommend: recommend, newsList: newsList);
          return;
        }
        if (currentState is NewsLoaded) {
          // 已有数据加载状态
          final Recommend recommend = await newsHttpDb.get('/recommend', data: {
            'page': currentState.newsList.length / rows,
            'rows': rows,
            'channelId': channelId,
          });
          final List<News> newsList = recommend.articles;

          yield NewsLoaded(
            recommend: recommend,
            newsList: currentState.newsList + newsList,
          );
        }
      } catch (_) {
        yield NewsError();
      }
    }
  }
}
