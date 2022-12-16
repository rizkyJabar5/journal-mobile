import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:journal_florist/features/networking/api_interceptor.dart';
import 'package:journal_florist/features/ledger/model/summary_ledger.dart';
import 'package:journal_florist/features/networking/endpoints.dart';

import 'model/summary_store.dart';

class SummaryService {
  late APIInterceptors api = APIInterceptors();

  Future<SummaryStore> getStore() async {
    final data;

    try {
      final response = await api.getRequest(Endpoints.store);
      print("Data => ${response.data['data']}");
      data = summaryStoreFromJson(response.data['data']);
      print("Data => ${data.recentOrders}");
    } on DioError catch (e) {
      throw e.error.toString();
    }

    return data;
  }

  // Future<SummaryLedger> getLedger() async {
  //   final response = await api.getRequest(Endpoints.ledger);
  //   // return SummaryLedger.fromJson(response.data['data']);
  // }
}
