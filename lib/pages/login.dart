import 'package:cashier/utils/navigation_util.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'package:cashier/utils/color_util.dart';
import 'package:cashier/utils/dimension_util.dart';

class Login extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _LoginState();
  }
}

class _LoginState extends State<Login> {
  late TextEditingController _merchantController;
  late TextEditingController _accountController;
  late TextEditingController _passwordController;
  late bool _rememberPassword;
  late bool _isSubmitEnabled;

  @override
  void initState() {
    super.initState();
    this._merchantController = TextEditingController();
    this._accountController = TextEditingController();
    this._passwordController = TextEditingController();
    this._rememberPassword = false;
    this._isSubmitEnabled = true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          this.buildLeft(),
          this.buildRight()
        ]
      )
    );
  }

  Widget buildLeft() {
    return Image.asset('assets/images/home.jpg');
  }

  Widget buildRight() {
    Widget merchantTextField = this.buildMerchantTextField();
    Widget accountTextField = this.buildAccountTextField();
    Widget passwordTextField = this.buildPasswordTextField();
    Widget btnLogin = this.buildBtnLogin();
    Widget checkboxRememberPassword = this.buildCheckboxRememberPassword();
    Widget separator = this.buildSeparator();
    Widget btnWechat = this.buildBtnWechat();
    return Expanded(
      child: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(padding: EdgeInsets.only(top: DimensionUtil.px2dp(100))),
            merchantTextField,
            accountTextField,
            passwordTextField,
            btnLogin,
            checkboxRememberPassword,
            separator,
            btnWechat
          ]
        )
      )
    );
  }

  Widget buildMerchantTextField() {
    return Padding(
      padding: EdgeInsets.only(bottom: DimensionUtil.px2dp(15)),
      child: Container(
        width: DimensionUtil.px2dp(302),
        height: DimensionUtil.px2dp(40),
        decoration: BoxDecoration(
          border: Border.all(color: ColorUtil.grayBackground),
          borderRadius: BorderRadius.all(Radius.circular(DimensionUtil.px2dp(2)))
        ),
        child: Container(
          padding: EdgeInsets.only(left: DimensionUtil.px2dp(8), right: DimensionUtil.px2dp(8)),
          child: TextField(
            controller: this._merchantController,
            style: TextStyle(
              fontSize: DimensionUtil.px2dp(14, isText: true),
              color: ColorUtil.black
            ),
            decoration: InputDecoration(
              border: InputBorder.none,
              icon: Image.asset('assets/images/merchant.png'),
              hintText: '商户编号',
              hintStyle: TextStyle(
                fontSize: DimensionUtil.px2dp(14, isText: true),
                color: ColorUtil.grayText
              )
            ),
            inputFormatters: [
              LengthLimitingTextInputFormatter(20)
            ]
          )
        )
      )
    );
  }

  Widget buildAccountTextField() {
    return Padding(
      padding: EdgeInsets.only(bottom: DimensionUtil.px2dp(15)),
      child: Container(
        width: DimensionUtil.px2dp(302),
        height: DimensionUtil.px2dp(40),
        decoration: BoxDecoration(
          border: Border.all(color: ColorUtil.grayBackground),
          borderRadius: BorderRadius.all(Radius.circular(DimensionUtil.px2dp(2)))
        ),
        child: Container(
          padding: EdgeInsets.only(left: DimensionUtil.px2dp(8), right: DimensionUtil.px2dp(8)),
          child: TextField(
            controller: this._accountController,
            style: TextStyle(
              fontSize: DimensionUtil.px2dp(14, isText: true),
              color: ColorUtil.black
            ),
            decoration: InputDecoration(
              border: InputBorder.none,
              icon: Image.asset('assets/images/account.png'),
              hintText: '账号',
              hintStyle: TextStyle(
                fontSize: DimensionUtil.px2dp(14, isText: true),
                color: ColorUtil.grayText
              )
            ),
            inputFormatters: [
              LengthLimitingTextInputFormatter(20)
            ]
          )
        )
      )
    );
  }

  Widget buildPasswordTextField() {
    return Padding(
      padding: EdgeInsets.only(bottom: DimensionUtil.px2dp(15)),
      child: Container(
        width: DimensionUtil.px2dp(302),
        height: DimensionUtil.px2dp(40),
        decoration: BoxDecoration(
          border: Border.all(color: ColorUtil.grayBackground),
          borderRadius: BorderRadius.all(Radius.circular(DimensionUtil.px2dp(2)))
        ),
        child: Container(
          padding: EdgeInsets.only(left: DimensionUtil.px2dp(8), right: DimensionUtil.px2dp(8)),
          child: TextField(
            controller: this._passwordController,
            obscureText: true,
            style: TextStyle(
              fontSize: DimensionUtil.px2dp(14, isText: true),
              color: ColorUtil.black
            ),
            decoration: InputDecoration(
              border: InputBorder.none,
              icon: Image.asset('assets/images/password.png'),
              hintText: '密码',
              hintStyle: TextStyle(
                fontSize: DimensionUtil.px2dp(14, isText: true),
                color: ColorUtil.grayText
              )
            ),
            inputFormatters: [
              LengthLimitingTextInputFormatter(20)
            ]
          )
        )
      )
    );
  }

  Widget buildBtnLogin() {
    Widget child;
    if (this._isSubmitEnabled) {
      child = Text(
        '登录',
        style: TextStyle(
          fontSize: DimensionUtil.px2dp(14, isText: true),
          fontWeight: FontWeight.bold,
          color: ColorUtil.white
        )
      );
    } else {
      child = Container(
        width: DimensionUtil.px2dp(20),
        height: DimensionUtil.px2dp(20),
        child: CircularProgressIndicator(color: ColorUtil.white, strokeWidth: 3)
      );
    }
    return MaterialButton(
      minWidth: DimensionUtil.px2dp(302),
      height: DimensionUtil.px2dp(40),
      color: ColorUtil.blue,
      disabledColor: ColorUtil.grayBackground,
      child: child,
      onPressed: this._isSubmitEnabled ? this._onBtnLoginPressed : null
    );
  }

  Widget buildCheckboxRememberPassword() {
    String asset = this._rememberPassword ? 'assets/images/checkbox_active.png' : 'assets/images/checkbox.png';
    return Padding(
      padding: EdgeInsets.only(top: DimensionUtil.px2dp(15)),
      child: Container(
        width: DimensionUtil.px2dp(302),
        child: MaterialButton(
          padding: EdgeInsets.zero,
          child: Row(
            children: [
              Image.asset(asset, width: DimensionUtil.px2dp(16), height: DimensionUtil.px2dp(16), fit: BoxFit.fill),
              Padding(padding: EdgeInsets.only(right: DimensionUtil.px2dp(5))),
              Text(
                '记住密码',
                style: TextStyle(
                  fontSize: DimensionUtil.px2dp(14, isText: true),
                  color: ColorUtil.grayText
                )
              )
            ]
          ),
          onPressed: this._onRememberPasswordPressed
        )
      )
    );
  }

  Widget buildSeparator() {
    return Padding(
      padding: EdgeInsets.only(top: DimensionUtil.px2dp(80)),
      child: Container(
        width: DimensionUtil.px2dp(302),
        child: Row(
          children: [
            Expanded(
              child: Container(
                height: 1,
                color: ColorUtil.grayBackground
              )
            ),
            Padding(
              padding: EdgeInsets.only(
                left: DimensionUtil.px2dp(7),
                right: DimensionUtil.px2dp(7)
              ),
              child: Text(
                '或者',
                style: TextStyle(
                  fontSize: DimensionUtil.px2dp(14),
                  color: ColorUtil.grayText
                )
              )
            ),
            Expanded(
              child: Container(
                height: 1,
                color: ColorUtil.grayBackground
              )
            )
          ]
        )
      )
    );
  }

  Widget buildBtnWechat() {
    return Padding(
      padding: EdgeInsets.only(top: DimensionUtil.px2dp(15)),
      child: MaterialButton(
        padding: EdgeInsets.zero,
        child: Image.asset('assets/images/wechat.png'),
        onPressed: this._onBtnWechatPressed
      )
    );
  }

  void _onBtnLoginPressed() {
    NavigationUtil.redirect('/pages/home/home');
  }

  void _onRememberPasswordPressed() {
    this.setState(() => this._rememberPassword = !this._rememberPassword);
  }

  void _onBtnWechatPressed() {

  }
}