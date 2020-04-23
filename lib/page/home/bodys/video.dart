import 'package:flutter/material.dart';
import 'package:flutter_news/widget/input/searchBarInput.dart';
import 'package:flutter_news/model/recommend.dart';
import 'package:flutter_news/db/dao/newsDao.dart';

class VideoPage extends StatefulWidget {
  VideoPage({Key key}) : super(key: key);

  @override
  _VideoPageState createState() => _VideoPageState();
}

class _VideoPageState extends State<VideoPage> {
  String hintText;
  @override
  void initState() {
    super.initState();
    //初始化状态
    hintText = "hintText";

    _init();
  }

  _init() async {
    NewsDao db = NewsDao();
    // Recommend recommend = Recommend.fromJson(map);

    // for (int i = 0; i < recommend?.articles?.length; i++) {
    //   recommend.articles[i].channelId = recommend.channelId;
    //   await db.insert(recommend.articles[i]);
    // }
    // await db.dropTable();
    List<News> newss = await db.getLimitNews(limit:20);
    print(newss.length);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          SearchBarInput(
            onSubmitted: _onSearchSubmitted,
            hintText: hintText,
          ),
          SearchBarInput(
            onSubmitted: _onSearchSubmitted,
            hintText: hintText,
          ),
          SearchBarInput(
            onSubmitted: _onSearchSubmitted,
            hintText: hintText,
          ),
          SearchBarInput(
            onSubmitted: _onSearchSubmitted,
            hintText: hintText,
          ),
        ],
      ),
    );
  }

  _onSearchSubmitted(String value) {
    setState(() {
      hintText += value;
    });
    // print(value);
  }
}

Map<String, dynamic> map = {
	"adsType": 0,
	"displayInfo": "",
	"loadtime": 1586939956049,
	"channelName": "",
	"articles": [{
		"recreason": 0,
		"createTime": 1586923213000,
		"mediaFlagIcon": "",
		"virtualTime": 1586939955452,
		"score": 1.0,
		"state": 0,
		"contentType": 1,
		"no_cache": "0",
		"picNum": 2,
		"articleUrl": "http://c.cdn.sohu.com/article/6656038381727778817",
		"filterWords": [{
			"name": "屏蔽来源:新华社",
			"type": "media"
		}, {
			"name": "不感兴趣",
			"type": "unlike"
		}],
		"share": 0,
		"pics": [],
		"title": "携手抗疫，3国领导人向习主席表达谢意",
		"webviewHeight": 0,
		"recpool": 1,
		"isTop": 0,
		"mediaId": "6183527926458220562",
		"template": 4,
		"recommendEvent": 6,
		"keyword": "",
		"mediaName": "新华社",
		"isRec": 1,
		"commentNum": 0,
		"category": {
			"id": 100,
			"name": "其他"
		},
		"playCount": 0,
		"newsId": "6656038381727778817",
		"debuginfo": "{\"recallTag\":\"topnews\",\"recallTagFather\":\"default\",\"fromRelated\":false,\"newsFatherTags\":[\"111\",\"131\",\"134\"],\"tagConstraint\":true,\"tagScore\":1.0}",
		"subtype": 0
	}, {
		"recreason": 0,
		"createTime": 1586939262000,
		"mediaFlagIcon": "",
		"virtualTime": 1586939944189,
		"score": 0.49587499999999995,
		"state": 0,
		"contentType": 1,
		"no_cache": "0",
		"picNum": 0,
		"articleUrl": "http://c.cdn.sohu.com/article/6656105951013109766",
		"filterWords": [{
			"name": "屏蔽来源:新京报",
			"type": "media"
		}, {
			"name": "不想看:情感",
			"type": "keyword"
		}, {
			"name": "不想看:国际",
			"type": "keyword"
		}, {
			"name": "不感兴趣",
			"type": "unlike"
		}],
		"share": 0,
		"pics": [],
		"title": "暂停资助世卫：“美国第一”的新借口与老花样",
		"webviewHeight": 0,
		"recpool": 0,
		"isTop": 0,
		"mediaId": "6183527930396672073",
		"template": 4,
		"recommendEvent": 8,
		"keyword": "情感 国际",
		"mediaName": "新京报",
		"isRec": 0,
		"commentNum": 0,
		"category": {
			"id": 100,
			"name": "其他"
		},
		"playCount": 0,
		"newsId": "6656105951013109766",
		"debuginfo": "{\"recallTag\":\"storyDoc\",\"recallTagFather\":\"storyDoc\",\"fromRelated\":false,\"newsFatherTags\":[\"134\"],\"newsTags\":[\"v1.1_text_216\",\"v1.1_text_456\",\"keywords1.0_美国_国际\",\"keywords1.0_特朗普_国际\"],\"tagConstraint\":false,\"tagScore\":1.0}",
		"subtype": 0
	}, {
		"recreason": -1,
		"createTime": 1586850514000,
		"mediaFlagIcon": "",
		"virtualTime": 1586939932926,
		"score": 0.5471,
		"state": 0,
		"contentType": 1,
		"no_cache": "0",
		"picNum": 10,
		"articleUrl": "http://c.cdn.sohu.com/article/6655739445578303489",
		"filterWords": [{
			"name": "屏蔽来源:美食杰官方",
			"type": "media"
		}, {
			"name": "不想看:睡眠",
			"type": "keyword"
		}, {
			"name": "不想看:营养学",
			"type": "keyword"
		}, {
			"name": "不想看:海鲜",
			"type": "keyword"
		}, {
			"name": "不感兴趣",
			"type": "unlike"
		}],
		"share": 0,
		"pics": [{
			"height": 640,
			"width": 640,
			"url": "http://p.cdn.sohu.com/089a1b13/466f9ad391b2a2d423c8def6f5847004.jpeg"
		}, {
			"height": 640,
			"width": 640,
			"url": "http://p.cdn.sohu.com/089a1b13/8ee57b753f57bb68a5627de7a0e6ec3e.jpeg"
		}, {
			"height": 453,
			"width": 640,
			"url": "http://p.cdn.sohu.com/covers/089a1b13/d15ce3e6b6e667b0cb3b98f58493bfbe.jpeg"
		}],
		"title": "大脑最爱的食物，核桃只排第4名，第1名竟是它，要给孩子多吃！",
		"webviewHeight": 0,
		"recpool": 0,
		"isTop": 0,
		"mediaId": "6183527962353074228",
		"template": 3,
		"recommendEvent": 0,
		"keyword": "睡眠 营养学 海鲜",
		"mediaName": "美食杰官方",
		"isRec": 0,
		"commentNum": 17,
		"category": {
			"id": 100,
			"name": "其他"
		},
		"playCount": 0,
		"newsId": "6655739445578303489",
		"debuginfo": "{\"recallTag\":\"UCFTT2\",\"recallTagFather\":\"default\",\"fromRelated\":false,\"newsFatherTags\":[\"118\"],\"newsTags\":[\"v1.1_text_131\",\"v1.1_text_169\",\"keywords1.0_三文鱼_美食\",\"keywords1.0_香煎三文鱼_美食\",\"keywords1.0_鱼肉_美食\",\"keywords1.0_圣女果_美食\"],\"tagConstraint\":true,\"tagScore\":1.0}",
		"subtype": 0
	}, {
		"recreason": 0,
		"createTime": 1586870941000,
		"mediaFlagIcon": "",
		"virtualTime": 1586939921663,
		"score": 0.35399,
		"state": 0,
		"contentType": 1,
		"no_cache": "0",
		"picNum": 5,
		"articleUrl": "http://c.cdn.sohu.com/article/6655820879542355969",
		"filterWords": [{
			"name": "屏蔽来源:军武新观察",
			"type": "media"
		}, {
			"name": "不想看:美国",
			"type": "keyword"
		}, {
			"name": "不想看:经济",
			"type": "keyword"
		}, {
			"name": "不想看:国际",
			"type": "keyword"
		}, {
			"name": "不感兴趣",
			"type": "unlike"
		}],
		"share": 0,
		"pics": [{
			"height": 405,
			"width": 602,
			"url": "http://p.cdn.sohu.com/723cf2ea/00e614bf85e24627c1a388db0dd369ca.png"
		}],
		"title": "大批不明目标现身俄港口，S400果断开火摧毁，白宫彻底沉默了",
		"webviewHeight": 0,
		"recpool": 0,
		"isTop": 0,
		"mediaId": "6488369862321111041",
		"template": 1,
		"recommendEvent": 0,
		"keyword": "美国 经济 国际",
		"mediaName": "军武新观察",
		"isRec": 0,
		"commentNum": 0,
		"category": {
			"id": 100,
			"name": "其他"
		},
		"playCount": 0,
		"newsId": "6655820879542355969",
		"debuginfo": "{\"recallTag\":\"hq_cb_i_keywords1.0_:6654391746484502567\",\"recallTagFather\":\"112\",\"fromRelated\":false,\"newsFatherTags\":[\"112\",\"134\"],\"newsTags\":[\"v1.1_text_280\",\"v1.1_text_500\",\"v1.1_text_592\",\"keywords1.0_美国_军事\",\"keywords1.0_俄罗斯_军事\",\"keywords1.0_海军_军事\",\"keywords1.0_导弹_军事\",\"keywords1.0_特朗普_军事\"],\"tagConstraint\":true,\"tagScore\":1.0,\"mark\":\"hq_cb_i\"}",
		"subtype": 0
	}, {
		"recreason": 0,
		"createTime": 1586693647000,
		"mediaFlagIcon": "",
		"virtualTime": 1586939910400,
		"score": 0.34219,
		"state": 0,
		"contentType": 1,
		"no_cache": "0",
		"picNum": 4,
		"articleUrl": "http://c.cdn.sohu.com/article/6655076078719074305",
		"filterWords": [{
			"name": "屏蔽来源:紫龙防务观察",
			"type": "media"
		}, {
			"name": "不想看:特朗普",
			"type": "keyword"
		}, {
			"name": "不想看:奥巴马",
			"type": "keyword"
		}, {
			"name": "不想看:海军",
			"type": "keyword"
		}, {
			"name": "不感兴趣",
			"type": "unlike"
		}],
		"share": 0,
		"pics": [{
			"height": 360,
			"width": 640,
			"url": "http://p.cdn.sohu.com/images/20200412/e4f08415829840e995b15a5d270c6ff0.png"
		}, {
			"height": 347,
			"width": 629,
			"url": "http://p.cdn.sohu.com/images/20200412/743ac031ba824ba99c9414c0805a3bd7.png"
		}, {
			"height": 447,
			"width": 626,
			"url": "http://p.cdn.sohu.com/images/20200412/51b95356fb2c4329862ebcc8ca22744b.png"
		}],
		"title": "一场较量正在白宫酝酿，特朗普也被卷入其中，大人物被解除职权",
		"webviewHeight": 0,
		"recpool": 0,
		"isTop": 0,
		"mediaId": "6186229401005326346",
		"template": 3,
		"recommendEvent": 0,
		"keyword": "特朗普 奥巴马 海军",
		"mediaName": "紫龙防务观察",
		"isRec": 0,
		"commentNum": 3,
		"category": {
			"id": 100,
			"name": "其他"
		},
		"playCount": 0,
		"newsId": "6655076078719074305",
		"debuginfo": "{\"recallTag\":\"v1.1_text_591\",\"recallTagFather\":\"112\",\"fromRelated\":false,\"newsFatherTags\":[\"112\"],\"newsTags\":[\"v1.1_text_280\",\"v1.1_text_390\",\"v1.1_text_542\",\"v1.1_text_554\",\"v1.1_text_591\",\"keywords1.0_航母_军事\",\"keywords1.0_美国_军事\",\"keywords1.0_特朗普_军事\",\"keywords1.0_美国海军_军事\"],\"tagConstraint\":true,\"tagScore\":1.0,\"mark\":\"hq_cb_s\"}",
		"subtype": 0
	}, {
		"recreason": 0,
		"createTime": 1586934167000,
		"mediaFlagIcon": "",
		"virtualTime": 1586939887874,
		"score": 0.41705000000000003,
		"state": 0,
		"contentType": 3,
		"no_cache": "0",
		"picNum": 0,
		"articleUrl": "http://c.cdn.sohu.com/article/6656092542334928897",
		"filterWords": [{
			"name": "屏蔽来源:青海生活百姓1时间",
			"type": "media"
		}, {
			"name": "不想看:环境保护",
			"type": "keyword"
		}, {
			"name": "不想看:环境污染",
			"type": "keyword"
		}, {
			"name": "不想看:社会",
			"type": "keyword"
		}, {
			"name": "不感兴趣",
			"type": "unlike"
		}],
		"share": 1,
		"pics": [{
			"height": 486,
			"width": 864,
			"url": "http://p.cdn.sohu.com/img/tos-cn-p-0026/5b5f0082135af1852b595abee7fa4d49~c5_q75_864x486.jpg"
		}],
		"title": "北京一老外拒绝戴口罩，强闯小区并殴打保安，被保安大哥擒拿在地",
		"webviewHeight": 0,
		"recpool": 0,
		"isTop": 0,
		"mediaId": "6425070274219081728",
		"template": 2,
		"recommendEvent": 0,
		"keyword": "环境保护 环境污染 社会",
		"videos": [{
			"duration": 58.0,
			"hd_id": 0,
			"rate": "0",
			"height": 480,
			"definitionInfos": [{
				"url": "http://v.cdn.sohu.com/1/aa471b80b0b94db9310c6dbd86f5d2c7/0",
				"size": 3826696
			}],
			"width": 854,
			"type": 0,
			"url": "http://v.cdn.sohu.com/1/aa471b80b0b94db9310c6dbd86f5d2c7/0",
			"size": 3826696
		}],
		"mediaName": "青海生活百姓1时间",
		"isRec": 0,
		"commentNum": 0,
		"category": {
			"id": 100,
			"name": "其他"
		},
		"playCount": 6,
		"newsId": "6656092542334928897",
		"debuginfo": "{\"recallTag\":\"110000\",\"recallTagFather\":\"default\",\"fromRelated\":false,\"newsFatherTags\":[\"102\"],\"newsTags\":[\"v1.1_video_527\"],\"tagConstraint\":true,\"tagScore\":1.0,\"mark\":\"LocalTag_X_ALL\"}",
		"subtype": 0
	}, {
		"recreason": 0,
		"createTime": 1586875027000,
		"mediaFlagIcon": "",
		"virtualTime": 1586939876611,
		"score": 0.31091,
		"state": 0,
		"contentType": 1,
		"no_cache": "0",
		"picNum": 7,
		"articleUrl": "http://c.cdn.sohu.com/article/6656075056612902912",
		"filterWords": [{
			"name": "屏蔽来源:豆果美食",
			"type": "media"
		}, {
			"name": "不想看:豆腐",
			"type": "keyword"
		}, {
			"name": "不想看:烹饪技巧",
			"type": "keyword"
		}, {
			"name": "不想看:菜单",
			"type": "keyword"
		}, {
			"name": "不感兴趣",
			"type": "unlike"
		}],
		"share": 0,
		"pics": [{
			"height": 425,
			"width": 600,
			"url": "http://p.cdn.sohu.com/covers/e84d209e/ea810feefa326a4ad69dddec65b0c16c.jpeg"
		}, {
			"height": 400,
			"width": 400,
			"url": "http://p.cdn.sohu.com/e84d209e/7d001b008b189b0c61c84f10d94a24b6.jpeg"
		}, {
			"height": 400,
			"width": 400,
			"url": "http://p.cdn.sohu.com/e84d209e/48af606c54037c8b4a9c6cf357f9f0c1.jpeg"
		}],
		"title": "常吃嘎鱼炖豆腐的人普遍比同龄人身体好！",
		"webviewHeight": 0,
		"recpool": 0,
		"isTop": 0,
		"mediaId": "6183528486670434306",
		"template": 3,
		"recommendEvent": 0,
		"keyword": "豆腐 烹饪技巧 菜单",
		"mediaName": "豆果美食",
		"isRec": 0,
		"commentNum": 0,
		"category": {
			"id": 100,
			"name": "其他"
		},
		"playCount": 0,
		"newsId": "6656075056612902912",
		"debuginfo": "{\"recallTag\":\"hq_cb_i_keywords1.0_:6655739369963390976\",\"recallTagFather\":\"118\",\"fromRelated\":false,\"newsFatherTags\":[\"118\"],\"newsTags\":[\"v1.1_text_273\",\"keywords1.0_豆腐_美食\",\"keywords1.0_蚝油_美食\",\"keywords1.0_蒸鱼豉油_美食\"],\"tagConstraint\":true,\"tagScore\":1.0,\"mark\":\"hq_cb_i\"}",
		"subtype": 0
	}, {
		"recreason": 1,
		"createTime": 1586933434000,
		"mediaFlagIcon": "",
		"virtualTime": 1586939865348,
		"score": 0.33362,
		"state": 0,
		"contentType": 1,
		"no_cache": "0",
		"picNum": 8,
		"articleUrl": "http://c.cdn.sohu.com/article/6656081502347984939",
		"filterWords": [{
			"name": "屏蔽来源:谈资",
			"type": "media"
		}, {
			"name": "不想看:汪峰",
			"type": "keyword"
		}, {
			"name": "不想看:章子怡",
			"type": "keyword"
		}, {
			"name": "不想看:八卦",
			"type": "keyword"
		}, {
			"name": "不感兴趣",
			"type": "unlike"
		}],
		"share": 0,
		"pics": [{
			"height": 342,
			"width": 620,
			"url": "http://p.cdn.sohu.com/images/20200415/435aa3c513724bca98a890cbc6f9d803.jpeg"
		}, {
			"height": 961,
			"width": 1242,
			"url": "http://p.cdn.sohu.com/images/20200415/f9de2ec475b145b0b6b7d9b286f3b15a.jpeg"
		}, {
			"height": 545,
			"width": 904,
			"url": "http://p.cdn.sohu.com/images/20200415/e082e7bf8faf412b9b4811eabad41b20.jpeg"
		}],
		"title": "章子怡产后外出身材优越，心急做美容，与汪峰尽享甜蜜小时光",
		"webviewHeight": 0,
		"recpool": 0,
		"isTop": 0,
		"mediaId": "6183527926445637654",
		"template": 3,
		"recommendEvent": 0,
		"keyword": "汪峰 章子怡 八卦",
		"mediaName": "谈资",
		"isRec": 0,
		"commentNum": 1,
		"category": {
			"id": 100,
			"name": "其他"
		},
		"playCount": 0,
		"newsId": "6656081502347984939",
		"debuginfo": "{\"recallTag\":\"v1.1_text_514\",\"recallTagFather\":\"default\",\"fromRelated\":false,\"newsFatherTags\":[\"119\"],\"newsTags\":[\"v1.1_text_178\",\"v1.1_text_514\",\"keywords1.0_章子怡_娱乐\",\"keywords1.0_汪峰_娱乐\"],\"tagConstraint\":true,\"tagScore\":1.0}",
		"subtype": 0
	}, {
		"recreason": -1,
		"createTime": 1586922890000,
		"mediaFlagIcon": "",
		"virtualTime": 1586939854085,
		"score": 0.27289,
		"state": 0,
		"contentType": 1,
		"no_cache": "0",
		"picNum": 5,
		"articleUrl": "http://c.cdn.sohu.com/article/6656038114991015937",
		"filterWords": [{
			"name": "屏蔽来源:全球体育赛事",
			"type": "media"
		}, {
			"name": "不想看:新星",
			"type": "keyword"
		}, {
			"name": "不想看:排球",
			"type": "keyword"
		}, {
			"name": "不想看:体育",
			"type": "keyword"
		}, {
			"name": "不感兴趣",
			"type": "unlike"
		}],
		"share": 0,
		"pics": [{
			"height": 565,
			"width": 775,
			"url": "http://p.cdn.sohu.com/723cf2ea/98bff17d53a58785907e7fd78a73967f.jpeg"
		}, {
			"height": 772,
			"width": 987,
			"url": "http://p.cdn.sohu.com/723cf2ea/0ce6cc936e02be013220ab7b1cac86a3.jpeg"
		}, {
			"height": 750,
			"width": 1000,
			"url": "http://p.cdn.sohu.com/723cf2ea/be98f0ae475b78aff78a0fea7c57abef.jpeg"
		}],
		"title": "唏嘘！女排4大新星无缘集训名单后逐渐淡出视线，她们还有机会吗",
		"webviewHeight": 0,
		"recpool": 0,
		"isTop": 0,
		"mediaId": "6201651389488168961",
		"template": 3,
		"recommendEvent": 0,
		"keyword": "新星 排球 体育",
		"mediaName": "全球体育赛事",
		"isRec": 0,
		"commentNum": 1,
		"category": {
			"id": 100,
			"name": "其他"
		},
		"playCount": 0,
		"newsId": "6656038114991015937",
		"debuginfo": "{\"recallTag\":\"ItemCF_GnnV2_F_6655424697070520322\",\"recallTagFather\":\"default\",\"fromRelated\":false,\"newsFatherTags\":[\"122\"],\"newsTags\":[\"v1.1_text_266\",\"v1.1_text_418\",\"keywords1.0_高意_体育\",\"keywords1.0_郎平_体育\"],\"tagConstraint\":true,\"tagScore\":1.0}",
		"subtype": 0
	}, {
		"recreason": 1,
		"createTime": 1586909717000,
		"mediaFlagIcon": "",
		"virtualTime": 1586939842822,
		"score": 0.41796500000000003,
		"state": 0,
		"contentType": 1,
		"no_cache": "0",
		"picNum": 0,
		"articleUrl": "http://c.cdn.sohu.com/article/6655982577158979597",
		"filterWords": [{
			"name": "屏蔽来源:金融界",
			"type": "media"
		}, {
			"name": "不想看:特朗普",
			"type": "keyword"
		}, {
			"name": "不想看:外交",
			"type": "keyword"
		}, {
			"name": "不感兴趣",
			"type": "unlike"
		}],
		"share": 0,
		"pics": [],
		"title": "特朗普：美国部分州可能在5月1日前重启经济",
		"webviewHeight": 0,
		"recpool": 0,
		"isTop": 0,
		"mediaId": "6183528666522189828",
		"template": 4,
		"recommendEvent": 0,
		"keyword": "特朗普 外交",
		"mediaName": "金融界",
		"isRec": 0,
		"commentNum": 0,
		"category": {
			"id": 100,
			"name": "其他"
		},
		"playCount": 0,
		"newsId": "6655982577158979597",
		"flag": {
			"bgColor": "",
			"icon": "",
			"text": "热点",
			"fontColor": "#FF6530",
			"fillBgColor": "#FA5332",
			"borderColor": "#FF6530",
			"type": 1
		},
		"debuginfo": "{\"recallTag\":\"weibo\",\"recallTagFather\":\"default\",\"fromRelated\":false,\"newsFatherTags\":[\"134\"],\"newsTags\":[\"v1.1_text_456\",\"v1.1_text_511\",\"keywords1.0_特朗普_国际\",\"keywords1.0_美国_国际\"],\"tagConstraint\":true,\"tagScore\":1.0,\"mark\":\"weibo_NH\"}",
		"subtype": 0
	}],
	"channelId": 1,
	"city": "北京市",
	"ip": "123.126.70.235",
	"redirectChannelId": 0,
	"message": "success",
	"totalNum": 11,
	"operatorAB": {
		"g1": 1
	},
	"exts": "loadId:10cfb0029ce540,base:other",
	"reqtype": 0,
	"supplement": 1,
	"errorCode": 0,
	"adx": [],
	"adcode": "110000",
	"adLoadIdList": [{
		"position": 4,
		"adLoadId": "10cfb0029ce5400",
		"positionId": "1000001"
	}, {
		"position": 11,
		"adLoadId": "10cfb0029ce5401",
		"positionId": "1000001"
	}],
	"loadid": "10cfb0029ce540"
};