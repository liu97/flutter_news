import 'package:flutter/widgets.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:flutter_gifimage/flutter_gifimage.dart';
import 'package:flutter/material.dart'
    hide RefreshIndicator, RefreshIndicatorState;
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
    // NewsDao db = NewsDao();
    // Recommend recommend = Recommend.fromJson(map);

    // for (int i = 0; i < recommend?.articles?.length; i++) {
    //   recommend.articles[i].channelId = recommend.channelId;
    //   await db.insert(recommend.articles[i]);
    // }
    // await db.dropTable();
    // List<News> newss = await db.getLimitNews(rows: 20);
    // print(newss.length);
  }

  @override
  Widget build(BuildContext context) {
    return GifIndicatorExample1();
  }

}

class GifHeader1 extends RefreshIndicator {
  GifHeader1() : super(height: 80.0, refreshStyle: RefreshStyle.Follow);
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return GifHeader1State();
  }
}

class GifHeader1State extends RefreshIndicatorState<GifHeader1>
    with SingleTickerProviderStateMixin {
  GifController _gifController;

  @override
  void initState() {
    // init frame is 2
    _gifController = GifController(
      vsync: this,
      value: 1,
    );
    super.initState();
  }

  @override
  void onModeChange(RefreshStatus mode) {
    if (mode == RefreshStatus.refreshing) {
      _gifController.repeat(
          min: 0, max: 29, period: Duration(milliseconds: 500));
    }
    super.onModeChange(mode);
  }

  @override
  Future<void> endRefresh() {
    _gifController.value = 30;
    return _gifController.animateTo(59, duration: Duration(milliseconds: 500));
  }

  @override
  void resetValue() {
    // reset not ok , the plugin need to update lowwer
    _gifController.value = 0;
    super.resetValue();
  }

  @override
  Widget buildContent(BuildContext context, RefreshStatus mode) {
    return GifImage(
      image: AssetImage("images/gifindicator1.gif"),
      controller: _gifController,
      height: 80.0,
      width: 537.0,
    );
  }

  @override
  void dispose() {
    _gifController.dispose();
    super.dispose();
  }
}

class GifFooter1 extends StatefulWidget {
  GifFooter1() : super();

  @override
  State<StatefulWidget> createState() {
    return _GifFooter1State();
  }
}

class _GifFooter1State extends State<GifFooter1>
    with SingleTickerProviderStateMixin {
  GifController _gifController;

  @override
  void initState() {
    // init frame is 2
    _gifController = GifController(
      vsync: this,
      value: 1,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return CustomFooter(
      height: 80,
      builder: (context, mode) {
        return GifImage(
          image: AssetImage("images/gifindicator1.gif"),
          controller: _gifController,
          height: 80.0,
          width: 537.0,
        );
      },
      loadStyle: LoadStyle.ShowWhenLoading,
      onModeChange: (mode) {
        if (mode == LoadStatus.loading) {
          _gifController.repeat(
              min: 0, max: 29, period: Duration(milliseconds: 500));
        }
      },
      endLoading: () async {
        _gifController.value = 30;
        return _gifController.animateTo(59,
            duration: Duration(milliseconds: 500));
      },
    );
  }

  @override
  void dispose() {
    _gifController.dispose();
    super.dispose();
  }
}

class GifIndicatorExample1 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return GifIndicatorExample1State();
  }
}

class GifIndicatorExample1State extends State<GifIndicatorExample1> {
  RefreshController _controller = RefreshController();
  @override
  Widget build(BuildContext context) {
    return SmartRefresher(
        controller: _controller,
        enablePullUp: true,
        // header: GifHeader1(),
        footer: GifFooter1(),
        onRefresh: () async {
          await Future.delayed(Duration(milliseconds: 2000));
          _controller.refreshCompleted();
        },
        onLoading: () async {
          await Future.delayed(Duration(milliseconds: 2000));
          _controller.loadFailed();
        },
        child: ListView.builder(
          itemBuilder: (c, q) => Card(),
          itemCount: 10,
          itemExtent: 100.0,
        ),
      );
  }
}