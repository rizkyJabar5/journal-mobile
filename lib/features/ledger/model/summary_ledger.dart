// To parse this JSON data, do
//
//     final summaryLedger = summaryLedgerFromJson(jsonString);

import 'dart:convert';

SummaryLedger summaryLedgerFromJson(String str) =>
    SummaryLedger.fromJson(json.decode(str));

String summaryLedgerToJson(SummaryLedger data) => json.encode(data.toJson());

class SummaryLedger {
  SummaryLedger({
    this.debtStore,
    this.totalRevenue,
    this.accountReceivable,
    this.totalExpense,
    this.totalGrossSales,
    this.totalNetSales,
  });

  dynamic debtStore;
  dynamic totalRevenue;
  dynamic accountReceivable;
  dynamic totalExpense;
  dynamic totalGrossSales;
  dynamic totalNetSales;

  factory SummaryLedger.fromJson(Map<String, dynamic> json) => SummaryLedger(
        debtStore: json["debtStore"],
        totalRevenue: json["totalRevenue"],
        accountReceivable: json["accountReceivable"],
        totalExpense: json["totalExpense"],
        totalGrossSales: json["totalGrossSales"],
        totalNetSales: json["totalNetSales"],
      );

  Map<String, dynamic> toJson() => {
        "debtStore": debtStore,
        "totalRevenue": totalRevenue,
        "accountReceivable": accountReceivable,
        "totalExpense": totalExpense,
        "totalGrossSales": totalGrossSales,
        "totalNetSales": totalNetSales,
      };
}
