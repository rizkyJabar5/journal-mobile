// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'summary_store.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SummaryStore _$SummaryStoreFromJson(Map<String, dynamic> json) => SummaryStore(
      json['totalProducts'] as int,
      json['totalCustomers'] as int,
      BigInt.parse(json['grossSalesToday'] as String),
      BigInt.parse(json['netProfitSalesToday'] as String),
      (json['recentOrders'] as List<dynamic>)
          .map((e) => Orders.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$SummaryStoreToJson(SummaryStore instance) =>
    <String, dynamic>{
      'totalProducts': instance.totalProducts,
      'totalCustomers': instance.totalCustomers,
      'grossSalesToday': instance.grossSalesToday.toString(),
      'netProfitSalesToday': instance.netProfitSalesToday.toString(),
      'recentOrders': instance.recentOrders,
    };
