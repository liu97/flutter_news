import 'package:flutter/material.dart';
import 'package:flutter_news/widget/input/clickInput.dart';


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
                'https://tvax2.sinaimg.cn/crop.0.0.896.896.180/006d1iXrly8gd0qgfhan2j30ow0owaby.jpg',
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
            labelStyle: TextStyle(fontSize: 14,fontWeight: FontWeight.w500),
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
          return Container(
            alignment: Alignment.center,
            child: Text(e, textScaleFactor: 5),
          );
        }).toList(),
      ),
    );
  }
}
