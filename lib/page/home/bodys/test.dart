import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_news/provider/goodsListProvider.dart';

class IndexPage extends StatefulWidget {
  IndexPage({Key key}) : super(key: key);

  @override
  _IndexPageState createState() => _IndexPageState();
}

class _IndexPageState extends State<IndexPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
       child: Selector<GoodsListProvider, GoodsListProvider>(
          shouldRebuild: (pre, next) => pre.shouldRebuild,
          selector: (context, provider) => provider,
          builder: (context, provider, child) {
            provider.rebuild();
            return ListView.builder(
              itemCount: provider.total,
              itemBuilder: (context, index) {
                return Selector<GoodsListProvider, Goods>(
                  selector: (context, provider) => provider.goodsList[index],
                  builder: (context, data, child) {
                    print(('No.$index rebuild'));

                    return ListTile(
                      title: Text(data.goodsName),
                      trailing: GestureDetector(
                        onTap: () => provider.collect(index),
                        child: Icon(
                            data.isCollection ? Icons.star : Icons.star_border),
                      ),
                    );
                  },
                );
              },
            );
          },
        ),
    );
  }
}