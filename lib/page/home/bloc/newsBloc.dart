import 'dart:async';

import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter_news/model/recommend.dart';
import 'package:flutter_news/page/home/httpDb/newsHttpDb.dart';
import './newsEvent.dart';
export './newsEvent.dart';
import './newsState.dart';
export './newsState.dart';

class NewsBloc extends Bloc<NewsEvent, NewsState> {
  int rows = 11;
  int channelId;
  NewsBloc({@required this.channelId});

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
          // 先查询数据库
          Recommend localRecommend =
              await newsHttpDb.getLocal(channelId, 1, rows);
          yield NewsLoaded(
              recommend: localRecommend,
              newsList: localRecommend.articles,
              isLocal: true);

          // 再发起请求
          var result = await newsHttpDb.get('/recommend',
              data: {'page': 1, 'rows': rows, 'channelId': channelId});
          if (result is HttpError) {
            event.failCallback(result);
          } else {
            final Recommend recommend = result;
            final List<News> newsList = recommend.articles;

            final NewsLoaded news = NewsLoaded(
                recommend: recommend, newsList: newsList, isLocal: false);
            event.successCallback(news);
            yield news;
          }
          return;
        }
        if (currentState is NewsLoaded) {
          // 已有数据加载状态
          var result = await newsHttpDb.get('/recommend', data: {
            'page': (currentState.newsList.length / rows) + 1,
            'rows': rows,
            'channelId': channelId,
          });
          if (result is HttpError) {
            event.failCallback(result);
          } else {
            final Recommend recommend = result;
            final List<News> newsList = recommend.articles;
            NewsLoaded news;
            if (event.isRefresh) { // 需要刷新列表
              news = NewsLoaded(
                recommend: recommend,
                newsList: newsList,
              );
            } else {
              news = NewsLoaded(
                recommend: recommend,
                newsList: currentState.newsList + newsList,
              );
            }
            event.successCallback(news);
            yield news;
          }
          return;
        }
      } catch (_) {
        event.failCallback(_);
        yield NewsError();
      }
    }
  }
}
