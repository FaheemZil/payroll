import 'package:flutter/material.dart';

class _SocialLoginModel {
  _SocialLoginModel({required this.icon, required this.url});
  final Widget icon;
  final String url;
}

class SocialLoginHelper {
  static final socialLogin = [
    _SocialLoginModel(
      icon: Text('data'),
      url: 'loginwith/google',
    ),
    _SocialLoginModel(
      icon: Text('data'),
      url: 'loginwith/linkedin',
    ),
    _SocialLoginModel(
        icon: Text('data'),
      url: 'loginwith/microsoft',
    ),
    _SocialLoginModel(
      icon: Text('data'),
      url: 'api/v4/loginwith/xero',
    ),
    _SocialLoginModel(
        icon: Text('data'),
      url: 'loginwith/amazon',
    ),
    _SocialLoginModel(      icon: Text('data'), url: 'loginwith/azure'),
    _SocialLoginModel(
           icon: Text('data'),
      url: 'api/v4/loginwith/freshbooks',
    ),
    _SocialLoginModel(
          icon: Text('data'),
      url: 'loginwith/twitter',
    ),
    _SocialLoginModel(
          icon: Text('data'),
      url: 'socialauth/quickbook',
    ),
  ];
}
