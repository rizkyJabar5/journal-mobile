// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'summary_ledger.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SummaryLedger _$SummaryLedgerFromJson(Map<String, dynamic> json) =>
    SummaryLedger(
      json['debtStore'] as String,
      json['totalRevenue'] as String,
      json['accountReceivable'] as String,
      json['totalExpense'] as String,
      json['totalGrossSales'] as String,
      json['totalNetSales'] as String,
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
