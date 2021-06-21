import 'package:cashier/utils/color_util.dart';
import 'package:cashier/utils/dimension_util.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Container(
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            stops: [0.0, 1.0],
            colors: [ColorUtil.getColorFromString('#686868'), ColorUtil.getColorFromString('#1B1B1B')]
          )
        ),
        child: Align(
          alignment: Alignment.topLeft,
          child: Padding(
            padding: EdgeInsets.only(top: DimensionUtil.px2dp(100), left: DimensionUtil.px2dp(60)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '582991/小翁',
                  style: TextStyle(
                    fontSize: DimensionUtil.px2dp(24, isText: true),
                    fontWeight: FontWeight.bold,
                    color: ColorUtil.white
                  )
                ),
                Padding(padding: EdgeInsets.only(top: DimensionUtil.px2dp(10))),
                Text(
                  '13265399506',
                  style: TextStyle(
                    fontSize: DimensionUtil.px2dp(18, isText: true),
                    color: ColorUtil.white
                  )
                )
              ]
            )
          )
        )
      )
    );
  }
}