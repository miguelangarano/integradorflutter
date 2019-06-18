import 'package:flutter/material.dart';

class RowWidget extends StatelessWidget {

  RowWidget(this.index);
  int index;

  MediaQueryData _queryData;

  double widthToPercent(double value) {
    double ret = (value * _queryData.size.width) / 100;
    return ret;
  }

  double heightToPercent(double value) {
    double ret = (value * _queryData.size.height) / 100;
    return ret;
  }

  @override
  Widget build(BuildContext context) {
    _queryData = MediaQuery.of(context);
    return Container(
      width: widthToPercent(100),
      height: heightToPercent(10),
      child: Row(
        children: <Widget>[
          Text("Index: "+index.toString()),
          Container(
            height: heightToPercent(10),
            child: Image.asset(
              'assets/images/loader.gif',
            ),
          )
        ],
      ),
    );
  }
}
