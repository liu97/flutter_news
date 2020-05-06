import 'package:flutter/material.dart';

class NewsSkeleton extends StatelessWidget {
  const NewsSkeleton({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.vertical,
      physics: BouncingScrollPhysics(),
      itemCount: 10,
      itemBuilder: (BuildContext context, int index) {
        return Container(
          decoration: const BoxDecoration(
            border: Border(
              bottom: BorderSide(
                width: 0.5,
                color: Color.fromARGB(100, 187, 187, 187),
              ),
            ),
          ),
          padding: EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                width: MediaQuery.of(context).size.width * 0.9,
                height: 10.0,
                margin: EdgeInsets.fromLTRB(0, 10.0, 0, 10.0),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5.0),
                    color: Colors.grey[300]),
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.2,
                height: 10.0,
                margin: EdgeInsets.fromLTRB(0, 0, 0, 10.0),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5.0),
                    color: Colors.grey[300]),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                    child: Container(
                      // width: MediaQuery.of(context).size.width * 0.8,
                      height: 175.0,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5.0),
                          color: Colors.grey[300]),
                    ),
                  ),
                ],
              ),
              Container(
                margin: EdgeInsets.fromLTRB(0, 10.0, 0, 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      width: 40.0,
                      height: 10.0,
                      margin: EdgeInsets.fromLTRB(0, 0, 10.0, 0),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5.0),
                          color: Colors.grey[300]),
                    ),
                    Container(
                      width: 30.0,
                      height: 10.0,
                      margin: EdgeInsets.fromLTRB(0, 0, 10.0, 0),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5.0),
                          color: Colors.grey[300]),
                    ),
                    Container(
                      width: 50.0,
                      height: 10.0,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5.0),
                          color: Colors.grey[300]),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
