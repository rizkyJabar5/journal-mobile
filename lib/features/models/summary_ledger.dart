import 'package:json_annotation/json_annotation.dart';
part 'summary_ledger.g.dart';

@JsonSerializable()
class SummaryLedger {
  final String debtStore;
  final String totalRevenue;
  final String accountReceivable;
  final String totalExpense;
  final String totalGrossSales;
  final String totalNetSales;

  SummaryLedger(
    this.debtStore,
    this.totalRevenue,
    this.accountReceivable,
    this.totalExpense,
    this.totalGrossSales,
    this.totalNetSales,
  );

  factory SummaryLedger.fromJson(Map<String, dynamic> json) =>
      _$SummaryLedgerFromJson(json);
}
