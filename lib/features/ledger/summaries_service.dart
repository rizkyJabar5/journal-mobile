import 'package:journal_florist/features/networking/api_interceptor.dart';
import 'package:journal_florist/features/ledger/model/summary_ledger.dart';
import 'package:journal_florist/features/networking/endpoints.dart';

import 'model/summary_store.dart';

class SummaryService {
  late APIInterceptors api = APIInterceptors();

  Future<SummaryStore> getStore() async {
    final response = await api.getRequest(Endpoints.store);
    return SummaryStore.fromJson(response.data.data);
  }

  Future<SummaryLedger> getLedger() async {
    final response = await api.getRequest(Endpoints.ledger);
    return SummaryLedger.fromJson(response.data['data']);
  }
}
