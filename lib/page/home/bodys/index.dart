import 'package:flutter/material.dart';
import 'package:flutter_news/widget/input/clickInput.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_news/page/home/bloc/newsBloc.dart';
import 'package:flutter_news/page/home/bloc/newsEvent.dart';
import 'package:flutter_news/page/home/bloc/newsState.dart';
import 'package:flutter_news/model/recommend.dart';

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
            labelStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
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
            child: PageList(),
          );
        }).toList(),
      ),
    );
  }
}

class PageList extends StatefulWidget {
  @override
  _PageListState createState() => _PageListState();
}

class _PageListState extends State<PageList> {
  final _scrollController = ScrollController();
  final _scrollThreshold = 200.0;
  NewsBloc _newsBloc;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
    _newsBloc = BlocProvider.of<NewsBloc>(context);
    _newsBloc.add(Fetch());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewsBloc, NewsState>(
      builder: (context, state) {
        if (state is NewsError) {
          return Center(
            child: Text('failed to fetch news'),
          );
        }
        if (state is NewsLoaded) {
          if (state.newsList.isEmpty) {
            return Center(
              child: Text('no newsList'),
            );
          }
          return ListView.builder(
            itemBuilder: (BuildContext context, int index) {
              return index >= state.newsList.length
                  ? BottomLoader()
                  : NewsWidget(news: state.newsList[index]);
            },
            itemCount: state.newsList.length + 1,
            controller: _scrollController,
          );
        }
        return Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.position.pixels;
    if (maxScroll - currentScroll <= _scrollThreshold) {
      _newsBloc.add(Fetch());
    }
  }
}

class BottomLoader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Center(
        child: SizedBox(
          width: 33,
          height: 33,
          child: CircularProgressIndicator(
            strokeWidth: 1.5,
          ),
        ),
      ),
    );
  }
}

class NewsWidget extends StatelessWidget {
  final News news;

  const NewsWidget({Key key, @required this.news}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // return ListTile(
    //   leading: Text(
    //     '${news.id}',
    //     style: TextStyle(fontSize: 10.0),
    //   ),
    //   title: Text(news.title),
    //   isThreeLine: true,
    //   subtitle: Text(news.body),
    //   dense: true,
    // );
    return Text(news.title);
  }
}
