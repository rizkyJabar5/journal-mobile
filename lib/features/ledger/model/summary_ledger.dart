import 'package:json_annotation/json_annotation.dart';

class SummaryLedger {
  final double debtStore;
  final double totalRevenue;
  final double accountReceivable;
  final double totalExpense;
  final double totalGrossSales;
  final double totalNetSales;

  SummaryLedger(
    this.debtStore,
    this.totalRevenue,
    this.accountReceivable,
    this.totalExpense,
    this.totalGrossSales,
    this.totalNetSales,
  );
}
