import 'package:dio/dio.dart';
import 'package:myapp/services/api_endpoints/bank_endpoints.dart';

class BankService {
  final Dio dio;
  BankService(this.dio);

  Future<Response> createBankAccount(Map<String, dynamic> payload) async {
    final response = await dio.post(
      BankAccountApiEndpoints.createBankAccount,
      data: payload,
    );
    return response;
  }

  Future<Response> uploadBankStatement(String bankId, FormData payload) async {
    final response = await dio.post(
      BankAccountApiEndpoints.uploadBankStatement(bankId),
      data: payload,
    );
    return response;
  }

  Future<Response> updateWireRoutingNumber(Map<String, dynamic> payload) async {
    final response = await dio.post(
      BankAccountApiEndpoints.updateWireRoutingNumber,
      data: payload,
    );
    return response;
  }

  Future<Response> deleteBankAccount(String id) async {
    final response = await dio.delete(
      BankAccountApiEndpoints.deleteBankAccount(id),
    );
    return response;
  }

  Future<Response> verifyRoutingNumber(String routNo) async {
    final response = await dio.get(
      BankAccountApiEndpoints.verifyRoutingNumber(routNo),
    );
    return response;
  }

  Future<Response> getBankList({int page = 1, String term = ''}) async {
    final response = await dio.get(
      BankAccountApiEndpoints.getBankList(page: page, term: term),
    );
    return response;
  }

  Future<Response> deleteBankAccountMeta(String id) async {
    final response = await dio.delete(
      BankAccountApiEndpoints.deleteBankAccountMeta(id),
    );
    return response;
  }
}
