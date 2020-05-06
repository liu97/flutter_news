import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:oktoast/oktoast.dart';

import 'package:flutter_news/widget/input/clickInput.dart';
import 'package:flutter_news/page/home/bloc/newsBloc.dart';
import 'package:flutter_news/model/recommend.dart';
import 'package:flutter_news/widget/video/videoIcon.dart';
import 'package:flutter_news/util/timeUtil.dart';
import 'package:flutter_news/util/httpUtil.dart';
import 'package:flutter_news/widget/skeleton/newsSkeleton.dart';

class IndexPage extends StatefulWidget {
  IndexPage({Key key}) : super(key: key);

  @override
  _IndexPageState createState() => _IndexPageState();
}

class _IndexPageState extends State<IndexPage>
    with SingleTickerProviderStateMixin {
  TabController _tabController; //需要定义一个Controller
  List tabs = ["推荐", "抗肺炎", "要闻", "视频", "健康", "娱乐", "体育", "情感"];

  @override
  void initState() {
    super.initState();
    // 创建Controller
    _tabController = TabController(length: tabs.length, vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }

  void _goToSearch() {
    // 点击查询回调
    print("点击查询回调");
  }

  void _goToUserCenter() {
    // 点击头像进入用户中心
    print("点击头像进入用户中心");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          child: GestureDetector(
            //圆形头像
            child: CircleAvatar(
              backgroundImage: NetworkImage(
                'https://qlogo2.store.qq.com/qzone/1139472029/1139472029/100?1534941460',
              ),
            ),
            onTap: _goToUserCenter,
          ),
          padding: EdgeInsets.all(12.0),
        ),
        title: ClickInput(
          hintText: '惊雷原唱回复杨坤',
          onTap: _goToSearch,
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.directions_walk),
            tooltip: '走路',
            color: Theme.of(context).primaryColor,
            onPressed: () {
              // Navigator.push(
              //   context,
              //   MaterialPageRoute(builder: (context) => SearchPage()),
              // );
            },
          ),
        ],
        backgroundColor: Color(0xffffffff),
        elevation: 0.5,
        bottom: TabBar(
            //控制器
            controller: _tabController,
            //选中的颜色
            labelColor: Colors.black,
            //选中的样式
            labelStyle: TextStyle(
                fontSize: 14.0,
                fontWeight: FontWeight.w500,
                color: Colors.black),
            //未选中的颜色
            unselectedLabelColor: Colors.black87,
            //未选中的样式
            unselectedLabelStyle: TextStyle(fontSize: 14),
            //下划线颜色
            indicatorColor: Theme.of(context).primaryColor,
            indicatorSize: TabBarIndicatorSize.label,
            //是否可滑动
            isScrollable: true,
            //tab标签
            tabs: tabs.map((e) => Tab(text: e)).toList()),
      ),
      body: TabBarView(
        controller: _tabController,
        children: tabs.map((e) {
          //创建3个Tab页
          return BlocProvider(
            create: (context) => NewsBloc(channelId: 1),
            child: PageListWidget(),
          );
        }).toList(),
      ),
    );
  }
}

class PageListWidget extends StatefulWidget {
  @override
  _PageListWidgetState createState() => _PageListWidgetState();
}

class _PageListWidgetState extends State<PageListWidget> with AutomaticKeepAliveClientMixin {
  RefreshController _refreshController = RefreshController();
  final _scrollController = ScrollController();
  final _scrollThreshold = 1200.0;
  NewsBloc _newsBloc;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
    _newsBloc = BlocProvider.of<NewsBloc>(context);
    fetchList();
  }

  @override
  bool get wantKeepAlive => true;

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  // 刷新列表调用函数
  void fetchList({bool isRefresh = true}) {
    _newsBloc.add(Fetch(
        isRefresh: isRefresh,
        successCallback: (result) => _refreshController.refreshCompleted(),
        failCallback: (HttpError result) {
          showToast(
            result.message,
            position: ToastPosition.center,
            backgroundColor: Color.fromARGB(255, 255, 61, 0),
            radius: 13.0,
            textStyle: TextStyle(fontSize: 13.0),
            animationBuilder: Miui10AnimBuilder(),
          );
          _refreshController.refreshFailed();
        }));
  }

  // 滚动调用函数
  void _onScroll() {
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.position.pixels;
    if (maxScroll - currentScroll <= _scrollThreshold) {
      fetchList(isRefresh: false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color.fromARGB(255, 255, 255, 255),
      child: BlocBuilder<NewsBloc, NewsState>(
        builder: (context, state) {
          if (state is NewsError) {
            return NewsSkeleton();
          }
          if (state is NewsLoaded) {
            return SmartRefresher(
              controller: _refreshController,
              enablePullUp: true,
              onRefresh: fetchList,
              onLoading: fetchList,
              child: ListView.builder(
                itemBuilder: (BuildContext context, int index) {
                  return NewsCardWidget(news: state.newsList[index]);
                },
                itemCount: state.newsList.length,
                controller: _scrollController,
              ),
            );
          }
          return Center(
            child: NewsSkeleton(),
          );
        },
      ),
    );
  }
}

class NewsCardWidget extends StatelessWidget {
  final News news;

  const NewsCardWidget({Key key, @required this.news}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      // borderRadius: new BorderRadius.circular(30.0), // 点击时水波纹阴影背景的形状
      customBorder: RoundedRectangleBorder(
          side: BorderSide(
              color: Colors.black,
              width: 5,
              style: BorderStyle.solid)), // 没发现什么作用

      focusColor: Colors.blue[200], //水波纹的颜色
      // highlightColor: Colors.orange[200], //点击后背景高亮颜色

      onTap: () {
        // print("sssssss");
      }, // 单击
      onDoubleTap: () {}, //双击,
      onLongPress: () {}, // 长按,

      radius: 50, //水波纹的扩展半径，不是水波纹的背景
      child: Ink(
        decoration: const BoxDecoration(
          color: Colors.white,
        ),
        padding: EdgeInsets.fromLTRB(15.0, 10.0, 15.0, 0.0),
        child: Ink(
          decoration: const BoxDecoration(
            border: Border(
              bottom: BorderSide(
                width: 0.5,
                color: Color.fromARGB(100, 187, 187, 187),
              ),
            ),
          ),
          padding: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 10.0),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.fromLTRB(0, 0, 0, 7.0),
                  child: Text(
                    news.title,
                    style: TextStyle(
                        fontSize: 14.0,
                        fontWeight: FontWeight.w500,
                        color: Colors.black),
                  ),
                ),
                news.videos != null && news.videos.length > 0
                    ? NewsVideoWidget(
                        video: news?.videos?.first,
                        picture: news?.pics?.first,
                      )
                    : NewsImageWidget(imageList: news.pics),
                NewsBottom(news: news),
              ]),
        ),
      ),
    );
  }
}

class NewsImageWidget extends StatelessWidget {
  final List<Picture> imageList;
  const NewsImageWidget({Key key, this.imageList = const <Picture>[]})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = 50.0;
    switch (imageList.length) {
      case 1:
        height = 175.0;
        break;
      case 2:
        height = 100.0;
        break;
      case 3:
        height = 75.0;
    }

    List<Widget> imageWidget = [];
    for (int i = 0; i < imageList.length; i++) {
      Picture item = imageList[i];
      EdgeInsets padding;
      BorderRadius borderRadius;
      if (imageList.length == 1) {
        // 只有一张图片的时候
        borderRadius = BorderRadius.circular(3.0);
        padding = EdgeInsets.zero;
      } else {
        if (i == 0) {
          // 第一张图片
          padding = EdgeInsets.fromLTRB(0, 0, 2.0, 0);
          borderRadius = BorderRadius.horizontal(
            left: Radius.circular(3.0),
          );
        } else if (i == imageList.length - 1) {
          // 最后一张图片
          padding = EdgeInsets.fromLTRB(2.0, 0, 0, 0);
          borderRadius = BorderRadius.horizontal(
            right: new Radius.circular(3.0),
          );
        } else {
          // 中间的图片
          padding = EdgeInsets.fromLTRB(2.0, 0, 2.0, 0);
          borderRadius = BorderRadius.zero;
        }
      }

      imageWidget.add(Expanded(
        child: Padding(
          padding: padding,
          child: ClipRRect(
            //剪裁为圆角矩形
            borderRadius: borderRadius,
            child: Image.network(
              item.url,
              height: height,
              fit: BoxFit.cover,
            ),
          ),
        ),
      ));
    }
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: imageWidget,
    );
  }
}

class NewsVideoWidget extends StatelessWidget {
  final Video video;
  final Picture picture;
  const NewsVideoWidget({Key key, @required this.video, @required this.picture})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: <Widget>[
        Row(
          children: <Widget>[
            Expanded(
              child: Padding(
                padding: EdgeInsets.fromLTRB(0, 5.0, 0, 5.0),
                child: ClipRRect(
                  //剪裁为圆角矩形
                  borderRadius: BorderRadius.circular(3.0),
                  child: Image.network(
                    picture.url,
                    height: 175,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            )
          ],
        ),
        Positioned(
          child: VideoIconWidget(
            icon: VideoIconWidget.play,
          ),
        ),
        Positioned(
          right: 10.0,
          bottom: 10.0,
          child: VideoDurationWidget(
            duration: video.duration,
          ),
        )
      ],
    );
  }
}

class NewsBottom extends StatelessWidget {
  final News news;
  const NewsBottom({Key key, @required this.news}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(0, 7.0, 0, 0),
      child: Row(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.fromLTRB(0, 0, 5.0, 0),
            child: Text(
              news.mediaName,
              style: TextStyle(
                color: Color.fromARGB(255, 186, 186, 186),
                fontSize: 12.0,
              ),
            ),
          ),
          news.commentNum > 0
              ? Row(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.fromLTRB(0, 1.0, 1.0, 0),
                      child: Icon(
                        Icons.comment,
                        color: Color.fromARGB(255, 186, 186, 186),
                        size: 12.0,
                      ),
                    ),
                    Text(
                      news.commentNum.toString(),
                      style: TextStyle(
                        color: Color.fromARGB(255, 186, 186, 186),
                        fontSize: 12.0,
                      ),
                    )
                  ],
                )
              : Text(''),
          Padding(
            padding: EdgeInsets.fromLTRB(5.0, 0, 0, 0),
            child: Text(
              TimeUtil.historyDate(news.createTime),
              style: TextStyle(
                color: Color.fromARGB(255, 186, 186, 186),
                fontSize: 12.0,
              ),
            ),
          )
        ],
      ),
    );
  }
}
