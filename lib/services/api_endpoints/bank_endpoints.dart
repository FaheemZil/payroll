class BankAccountApiEndpoints {
  static const String rootUrl = 'https://your.api.url';

  static const String createBankAccount = '$rootUrl/bank-accounts';
  static String uploadBankStatement(String id) =>
      '$rootUrl/bank-accounts/payroll-bank/$id/upload-statement';
  static const String updateWireRoutingNumber =
      '$rootUrl/bank-accounts/update-bank';

  static String deleteBankAccount(String id) => '$rootUrl/bank-accounts/$id';
  static String verifyRoutingNumber(String routNo) =>
      '$rootUrl/routing-number/$routNo';
  static String getBankList({int page = 1, String term = ''}) {
    return '$rootUrl/bank-accounts?page=$page&term=$term';
  }

  static String deleteBankAccountMeta(String id) =>
      '$rootUrl/bank-accounts/$id';
}
