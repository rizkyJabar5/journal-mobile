import 'package:json_annotation/json_annotation.dart';

import '../../orders/model/orders.dart';
part 'summary_store.g.dart';

@JsonSerializable()
class SummaryStore {
  final int totalProducts;
  final int totalCustomers;
  final BigInt grossSalesToday;
  final BigInt netProfitSalesToday;
  final List<Orders> recentOrders;

  SummaryStore(
    this.totalProducts,
    this.totalCustomers,
    this.grossSalesToday,
    this.netProfitSalesToday,
    this.recentOrders,
  );

  factory SummaryStore.fromJson(Map<String, dynamic> json) =>
      _$SummaryStoreFromJson(json);
}
