import 'package:sqflite/sqflite.dart';
import './baseDao.dart';
import 'package:flutter_news/model/recommend.dart';
import 'dart:convert';

// 新闻列表dao实现类
class NewsDao extends BaseDao {
  final String name = 'news';

  final String idColumn = "id"; // id
  final String titleColumn = "title"; // 新闻标题
  final String newsIdColumn = "newsId"; // 新闻id
  final String mediaIdColumn = "mediaId"; // 媒体id
  final String mediaNameColumn = "mediaName"; // 媒体名称
  final String articleUrlColumn = "articleUrl"; // 文章请求路径
  final String commentNumColumn = "commentNum"; // 评论数
  final String createTimeColumn = "createTime"; // 文章创建时间
  final String picsColumn = "pics"; // 图片数组
  final String videosColumn = "videos"; // 视频数组
  final String channelIdColumn = "channelId"; // 频道id

  @override
  tableSqlString() {
    return tableBaseString(name, idColumn) +
        '''
        $titleColumn text not null,
        $newsIdColumn text not null,
        $mediaIdColumn text not null,
        $mediaNameColumn text not null,
        $articleUrlColumn text not null,
        $commentNumColumn integer not null,
        $createTimeColumn integer not null,
        $picsColumn text,
        $videosColumn text,
        $channelIdColumn integer not null)
      ''';
  }

  // pics和videos需要特殊处理
  Map<String, dynamic> toTabelJson(Map<String, dynamic> newsJson) {
    Map<String, dynamic> tableJson = {
      titleColumn: newsJson[titleColumn],
      newsIdColumn: newsJson[newsIdColumn],
      mediaIdColumn: newsJson[mediaIdColumn],
      mediaNameColumn: newsJson[mediaNameColumn],
      articleUrlColumn: newsJson[articleUrlColumn],
      commentNumColumn: newsJson[commentNumColumn],
      createTimeColumn: newsJson[createTimeColumn],
      picsColumn: newsJson[picsColumn] != null ? json.encode(newsJson[picsColumn]) : null,
      videosColumn: newsJson[videosColumn] != null ? json.encode(newsJson[videosColumn]) : null,
      channelIdColumn: newsJson[channelIdColumn],
    };
    return tableJson;
  }

  Map<String, dynamic> fromTabelJson(Map<String, dynamic> tableJson) {
    Map<String, dynamic> newsJson = {
      titleColumn: tableJson[titleColumn],
      newsIdColumn: tableJson[newsIdColumn],
      mediaIdColumn: tableJson[mediaIdColumn],
      mediaNameColumn: tableJson[mediaNameColumn],
      articleUrlColumn: tableJson[articleUrlColumn],
      commentNumColumn: tableJson[commentNumColumn],
      createTimeColumn: tableJson[createTimeColumn],
      picsColumn: tableJson[picsColumn] != null
          ? json.decode(tableJson[picsColumn])
          : null,
      videosColumn: tableJson[videosColumn] != null
          ? json.decode(tableJson[videosColumn])
          : null,
      channelIdColumn: tableJson[channelIdColumn],
    };
    return newsJson;
  }

  ///插入到数据库
  Future<int> insert(News news) async {
    Database db = await getDataBase();
    return await db.insert(name, toTabelJson(news.toJson()));
  }

  // 删除表中所有数据
  Future<int> deleteAll([int channelId]) async {
    Database db = await getDataBase();
    if (channelId != null) {
      return await db.delete(name, where: '$channelIdColumn=$channelId');
    } else {
      return await db.delete(name);
    }
  }

  // 根据limit获取新闻列表
  Future<List<News>> getLimitNews({limit = 11}) async {
    Database db = await getDataBase();
    List<Map> results = await db.query(
      name,
      orderBy: idColumn,
      limit: limit,
    );
    if (results.length > 0) {
      List<News> newss;
      newss = results.map((item) {
        return News.fromJson(fromTabelJson(item));
      }).toList();
      return newss;
    }
    return [];
  }

  @override
  tableName() {
    return name;
  }
}
