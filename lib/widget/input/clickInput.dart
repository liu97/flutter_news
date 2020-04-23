import 'package:flutter/material.dart';

// 仅仅是看起来像输入框，供用户点击
class ClickInput extends StatelessWidget {
  final String hintText;
  final GestureTapCallback onTap;
  ClickInput({
    Key key,
    this.hintText = '',
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: this.onTap,
      child: Row(
        children: <Widget>[
          Expanded(
            child: Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Icon(
                    Icons.search,
                    color: Color(0xffb4b7bc),
                  ),
                  Text(
                    hintText,
                    style: TextStyle(
                      color: Color(0xffb4b7bc),
                      fontSize: 15.0,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
              height: 30.0,
              decoration: BoxDecoration(
                color: Color(0xfff5f5f5),
                borderRadius: BorderRadius.circular(15.0),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
