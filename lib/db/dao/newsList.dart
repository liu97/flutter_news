import 'package:sqflite/sqflite.dart';
import './baseDao.dart';
import 'package:flutter_news/model/newsList.dart';

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
  final String filterWordsColumn = "filterWords"; // 屏蔽单词数组
  final String picsColumn = "pics"; // 图片数组
  final String videosColumn = "videos"; // 视频数组

  @override
  tableSqlString() {
    return tableBaseString(name, idColumn) +
        '''
        $titleColumn text not null,
        $newsIdColumn text not null,
        $mediaIdColumn text not null,
        $mediaNameColumn text not null,
        $articleUrlColumn text not null,
        $commentNumColumn text not null,
        $createTimeColumn text not null),
        $filterWordsColumn text not null),
        $picsColumn text not null,
        $videosColumn text not null)
      ''';
  }

  ///插入到数据库
  Future insert(NewsList newList) async {
    Database db = await getDataBase();
    return await db.insert(name, newList.toJson());
  }

  // 删除表中所有数据
  Future<int> deleteAll() async {
    Database db = await getDataBase();
    return await db.delete(name, where: '1=1');
  }

  Future<List<NewsList>> getNewsList({limit = 11}) async {
    Database db = await getDataBase();
    List<Map> results = await db.query(
      name,
      orderBy: idColumn,
      limit: limit,
    );
    if (results.length > 0) {
      List<NewsList> newsLists;
      newsLists = results.map((item) {
        return NewsList.fromJson(item);
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
