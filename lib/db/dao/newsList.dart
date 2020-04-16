import 'package:sqflite/sqflite.dart';
import './baseDao.dart';
import 'package:flutter_news/model/news/newsList.dart';
import 'dart:convert';

// 新闻列表dao实现类

class NewsListDao extends BaseDao {
  final String name = 'newList';

  final String idColumn = "_id"; // id
  final String titleColumn = "title"; // 新闻标题
  final String newsIdColumn = "newsId"; // 新闻id
  final String mediaIdColumn = "mediaId"; // 媒体id
  final String mediaNameColumn = "mediaName"; // 媒体名称
  final String articleUrlColumn = "articleUrl"; // 文章请求路径
  final String commentNumColumn = "commentNum"; // 评论数
  final String createTimeColumn = "createTime"; // 文章创建时间
  final String picsColumn = "pics"; // 图片数组
  final String videosColumn = "videos"; // 视频数组
  final String channelIdColumn = "channelId"; // 视频数组

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
  Map<String, dynamic> toTabelJson(Map<String, dynamic> newListJson) {
    Map<String, dynamic> tableJson = {
      titleColumn: newListJson[titleColumn],
      newsIdColumn: newListJson[newsIdColumn],
      mediaIdColumn: newListJson[mediaIdColumn],
      mediaNameColumn: newListJson[mediaNameColumn],
      articleUrlColumn: newListJson[articleUrlColumn],
      commentNumColumn: newListJson[commentNumColumn],
      createTimeColumn: newListJson[createTimeColumn],
      picsColumn: newListJson[picsColumn] != null ? json.encode(newListJson[picsColumn]) : null,
      videosColumn: newListJson[videosColumn] != null ? json.encode(newListJson[videosColumn]) : null,
      channelIdColumn: newListJson[channelIdColumn],
    };
    return tableJson;
  }

  Map<String, dynamic> fromTabelJson(Map<String, dynamic> tableJson) {
    Map<String, dynamic> newListJson = {
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
    return newListJson;
  }

  ///插入到数据库
  Future<int> insert(NewsList newList) async {
    Database db = await getDataBase();
    return await db.insert(name, toTabelJson(newList.toJson()));
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

  Future<List<NewsList>> getLimitNewsList({limit = 11}) async {
    Database db = await getDataBase();
    List<Map> results = await db.query(
      name,
      orderBy: idColumn,
      limit: limit,
    );
    if (results.length > 0) {
      List<NewsList> newsLists;
      newsLists = results.map((item) {
        return NewsList.fromJson(fromTabelJson(item));
      }).toList();
      return newsLists;
    }
    return null;
  }

  @override
  tableName() {
    return name;
  }
}
