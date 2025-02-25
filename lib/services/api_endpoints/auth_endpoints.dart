class AuthApiEndpoints {
  static const String rootUrl = 'https://staging.api.ocw.sebipay.com/api/v4';

  static const String registerAsGuest = '$rootUrl/guest-user-register';
  static const String registerWithEmail = '$rootUrl/register-with-email';
  static const String login = '$rootUrl/login';
  static const String getLoginDetailsUsingToken = '$rootUrl/me';
  static const String sendEmailOtp = '$rootUrl/user-verification/email';
  static const String verifyEmail = '$rootUrl/user-verification/email/verify';
  static const String sendPhoneOtp = '$rootUrl/user-verification/phone';
  static const String verifyPhoneOtp =
      '$rootUrl/user-verification/phone/verify';
  static const String userStatus = '$rootUrl/user-name-suggestion';
}
