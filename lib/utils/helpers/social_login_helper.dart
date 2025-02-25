
import 'package:flutter/material.dart';
import 'package:myapp/utils/helpers/asset_helper.dart';

class _SocialLoginModel {
  _SocialLoginModel({required this.icon, required this.url});
  final Widget icon;
  final String url;
}

class SocialLoginHelper {
  static final socialLogin = [
    _SocialLoginModel(
      icon: Assets.images.google.svg(),
      url: 'loginwith/google',
    ),
    _SocialLoginModel(
      icon: Assets.images.linkedIn.svg(),
      url: 'loginwith/linkedin',
    ),
    _SocialLoginModel(
      icon: Assets.images.microsoft.svg(),
      url: 'loginwith/microsoft',
    ),
    _SocialLoginModel(
      icon: Assets.images.xero.svg(),
      url: 'api/v4/loginwith/xero',
    ),
    _SocialLoginModel(
      icon: Assets.images.amazon.svg(),
      url: 'loginwith/amazon',
    ),
    _SocialLoginModel(icon: Assets.images.office.svg(), url: 'loginwith/azure'),
    _SocialLoginModel(
      icon: Assets.images.freshbooks.svg(),
      url: 'api/v4/loginwith/freshbooks',
    ),
    _SocialLoginModel(
      icon: Assets.images.twitter.svg(),
      url: 'loginwith/twitter',
    ),
    _SocialLoginModel(
      icon: Assets.images.intuit.svg(),
      url: 'socialauth/quickbook',
    ),
  ];
}
