import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_news/models/goodsListProvider.dart';

import 'package:flutter_news/page/home/bodys/index.dart';
import 'package:flutter_news/page/home/bodys/video.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentBarIndex = 0;

  List<Widget> _barBodyList = [IndexPage(), VideoPage()];

  void _onBarItemTapped(int index) {
    // 底部bar切换
    setState(() {
      _currentBarIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => GoodsListProvider(),
      child: Scaffold(
        // appBar: appBarRender(context),
        body: IndexedStack(
          index: _currentBarIndex,
          children: _barBodyList,
        ),
        // floatingActionButton: Consumer<GoodsListProvider>(
        //   builder: (context, GoodsListProvider model, child) {
        //     print('rebuild button');
        //     return FloatingActionButton(
        //       child: Icon(Icons.add),
        //       onPressed: () {
        //         model.addAll();
        //       },
        //     );
        //   },
        // ),
        bottomNavigationBar: BottomNavigationBar(
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              title: Text("首页"),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.play_circle_outline),
              title: Text("视频"),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.track_changes),
              title: Text("追踪"),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.apps),
              title: Text("任务"),
            ),
          ],
          //当前选中下标
          currentIndex: _currentBarIndex,
          //显示模式
          type: BottomNavigationBarType.fixed,
          //选中颜色
          fixedColor: Theme.of(context).primaryColor,
          //点击事件
          onTap: _onBarItemTapped,
        ),
      ),
    );
  }
}
