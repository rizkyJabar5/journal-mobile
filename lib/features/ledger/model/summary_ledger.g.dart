// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'summary_ledger.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SummaryLedger _$SummaryLedgerFromJson(Map<String, dynamic> json) =>
    SummaryLedger(
      json['debtStore'] as double,
      json['totalRevenue'] as double,
      json['accountReceivable'] as double,
      json['totalExpense'] as double,
      json['totalGrossSales'] as double,
      json['totalNetSales'] as double,
    );

Map<String, dynamic> _$SummaryLedgerToJson(SummaryLedger instance) =>
    <String, dynamic>{
      'debtStore': instance.debtStore,
      'totalRevenue': instance.totalRevenue,
      'accountReceivable': instance.accountReceivable,
      'totalExpense': instance.totalExpense,
      'totalGrossSales': instance.totalGrossSales,
      'totalNetSales': instance.totalNetSales,
    };
