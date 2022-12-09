import 'package:journal_florist/features/models/order_details.dart';
import 'package:json_annotation/json_annotation.dart';
part 'orders.g.dart';

@JsonSerializable()
class Orders {
  final String orderId;
  final String customerName;
  final String phoneNumber;
  final List<OrderDetails> detailOfOrderProducts;
  final BigInt totalOrderAmount;
  final String paymentStatus;
  final BigInt paymentAmount;
  final BigInt underPayment;
  final String orderStatus;
  final String recipientName;
  final String deliveryAddress;
  final String deliveryDate;
  final String deliveryTime;
  final String addedBy;
  final String createdAt;
  final String updatedBy;
  final String updatedAt;

  Orders(
    this.orderId,
    this.customerName,
    this.phoneNumber,
    this.detailOfOrderProducts,
    this.totalOrderAmount,
    this.paymentStatus,
    this.paymentAmount,
    this.underPayment,
    this.orderStatus,
    this.recipientName,
    this.deliveryAddress,
    this.deliveryDate,
    this.deliveryTime,
    this.addedBy,
    this.createdAt,
    this.updatedBy,
    this.updatedAt,
  );

  factory Orders.fromJson(Map<String, dynamic> json) => _$OrdersFromJson(json);
}
