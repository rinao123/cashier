import 'dart:async';

import 'package:cashier/utils/navigation_util.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';

class Splash extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Timer.periodic(Duration(seconds: 3), (timer) {
      NavigationUtil.redirect('/pages/login/login');
      timer.cancel();
    });
    return Scaffold(
      body: Container(
        child: Image.asset('assets/images/splash.jpg', width: double.infinity, fit: BoxFit.cover)
      )
    );
  }
}