import 'package:journal_florist/features/journal_base_helper.dart';
import 'package:journal_florist/features/models/summary_ledger.dart';
import 'package:journal_florist/features/models/summary_store.dart';
import 'package:journal_florist/utilities/endpoints.dart';

class Summaries {
  late JournalBaseHelper api = JournalBaseHelper();

  Future<SummaryStore> getStore() async {
    final response = await api.getRequest(Endpoints.store);
    return SummaryStore.fromJson(response.data.data);
  }

  Future<SummaryLedger> getLedger() async {
    final response = await api.getRequest(Endpoints.ledger);
    return SummaryLedger.fromJson(response.data.data);
  }
}
