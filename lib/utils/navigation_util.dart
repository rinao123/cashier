import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';
import 'package:cashier/pages/login.dart';
import 'package:cashier/pages/home.dart';
import 'package:cashier/common/global.dart';

class NavigationUtil {
  static getPage(String path, {Map<String, dynamic> params = const {}}) {
    switch (path) {
      case "/pages/login/login":
        return Login();
      case "/pages/home/home":
        return Home();
      default:
        print("NavigationUtil invalid path");
    }
  }

  static void navigateTo(String url) {
    String path = getPath(url);
    Map<String, String> params = getParams(url);
    var page = getPage(path, params: params);
    if (page == null) {
      print("navigateTo page is null");
      return;
    }
    BuildContext context = navigatorKey.currentState!.overlay!.context;
    Navigator.push(context, CupertinoPageRoute(
        builder: (BuildContext context){
          return page;
        }
    ));
  }

  static void redirect(String url) {
    String path = getPath(url);
    Map<String, String> params = getParams(url);
    var page = getPage(path, params: params);
    if (page == null) {
      print("navigateTo page is null");
      return;
    }
    BuildContext context = navigatorKey.currentState!.overlay!.context;
    Navigator.pushReplacement(context, PageRouteBuilder(
        opaque: false,
        pageBuilder: (BuildContext context, _, __) {
          return page;
        }
    ));
  }

  static String getPath(String url) {
    List<String> strs = url.split("?");
    return strs[0];
  }

  static Map<String, String> getParams(String url) {
    List<String> strs = url.split("?");
    Map<String, String> params = {};
    if (strs.length > 1) {
      String queryString = strs[1];
      List<String> paramStrs = queryString.split("&");
      for (String paramStr in paramStrs) {
        List<String> values = paramStr.split("=");
        String key = values[0];
        String value = values[1];
        params[key] = value;
      }
    }
    return params;
  }
}