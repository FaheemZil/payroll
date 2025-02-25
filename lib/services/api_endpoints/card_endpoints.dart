class CardApiEndpoints {
  static const String rootUrl = 'https://your.api.url'; // Replace with actual API URL

  static const String addCard = '$rootUrl/payment-methods/card/add-card';
  static  String deleteCard(String id)=>  '$rootUrl/payment-methods/card/$id/delete';
  static const String fetchCards = '$rootUrl/payment-methods/card/exisitng';
  static const String addSignature = '$rootUrl/signature';
    static const String requiredDocument = '$rootUrl/payment-methods/required-documents';
  static const String authDocData = '$rootUrl/payment-methods/auth-document-data';
  static const String submitDocs = '$rootUrl/payment-methods/submit-required-documents';
}
