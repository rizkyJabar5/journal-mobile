import 'dart:convert';

import 'package:collection/collection.dart';

import 'order_details.dart';

class Orders {
  String? orderId;
  String? customerName;
  String? phoneNumber;
  List<DetailOfOrderProduct>? detailOfOrderProducts;
  int? totalOrderAmount;
  String? paymentStatus;
  int? paymentAmount;
  int? underPayment;
  String? orderStatus;
  String? recipientName;
  String? deliveryAddress;
  String? deliveryDate;
  String? deliveryTime;
  String? addedBy;
  String? createdAt;
  dynamic updatedBy;
  dynamic updatedAt;

  Orders({
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
  });

  Orders copyWith({
    String? orderId,
    String? customerName,
    String? phoneNumber,
    List<DetailOfOrderProduct>? detailOfOrderProducts,
    int? totalOrderAmount,
    String? paymentStatus,
    int? paymentAmount,
    int? underPayment,
    String? orderStatus,
    String? recipientName,
    String? deliveryAddress,
    String? deliveryDate,
    String? deliveryTime,
    String? addedBy,
    String? createdAt,
    dynamic updatedBy,
    dynamic updatedAt,
  }) {
    return Orders(
      orderId: orderId ?? this.orderId,
      customerName: customerName ?? this.customerName,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      detailOfOrderProducts:
          detailOfOrderProducts ?? this.detailOfOrderProducts,
      totalOrderAmount: totalOrderAmount ?? this.totalOrderAmount,
      paymentStatus: paymentStatus ?? this.paymentStatus,
      paymentAmount: paymentAmount ?? this.paymentAmount,
      underPayment: underPayment ?? this.underPayment,
      orderStatus: orderStatus ?? this.orderStatus,
      recipientName: recipientName ?? this.recipientName,
      deliveryAddress: deliveryAddress ?? this.deliveryAddress,
      deliveryDate: deliveryDate ?? this.deliveryDate,
      deliveryTime: deliveryTime ?? this.deliveryTime,
      addedBy: addedBy ?? this.addedBy,
      createdAt: createdAt ?? this.createdAt,
      updatedBy: updatedBy ?? this.updatedBy,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'orderId': orderId,
      'customerName': customerName,
      'phoneNumber': phoneNumber,
      'detailOfOrderProducts':
          detailOfOrderProducts?.map((x) => x.toMap()).toList(),
      'totalOrderAmount': totalOrderAmount,
      'paymentStatus': paymentStatus,
      'paymentAmount': paymentAmount,
      'underPayment': underPayment,
      'orderStatus': orderStatus,
      'recipientName': recipientName,
      'deliveryAddress': deliveryAddress,
      'deliveryDate': deliveryDate,
      'deliveryTime': deliveryTime,
      'addedBy': addedBy,
      'createdAt': createdAt,
      'updatedBy': updatedBy,
      'updatedAt': updatedAt,
    };
  }

  factory Orders.fromMap(Map<String, dynamic> map) {
    return Orders(
      orderId: map['orderId'],
      customerName: map['customerName'],
      phoneNumber: map['phoneNumber'],
      detailOfOrderProducts: map['detailOfOrderProducts'] != null
          ? List<DetailOfOrderProduct>.from(map['detailOfOrderProducts']
              ?.map((x) => DetailOfOrderProduct.fromMap(x)))
          : null,
      totalOrderAmount: map['totalOrderAmount']?.toInt(),
      paymentStatus: map['paymentStatus'],
      paymentAmount: map['paymentAmount']?.toInt(),
      underPayment: map['underPayment']?.toInt(),
      orderStatus: map['orderStatus'],
      recipientName: map['recipientName'],
      deliveryAddress: map['deliveryAddress'],
      deliveryDate: map['deliveryDate'],
      deliveryTime: map['deliveryTime'],
      addedBy: map['addedBy'],
      createdAt: map['createdAt'],
      updatedBy: map['updatedBy'] ?? null,
      updatedAt: map['updatedAt'] ?? null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Orders.fromJson(String source) => Orders.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Orders(orderId: $orderId, customerName: $customerName, phoneNumber: $phoneNumber, detailOfOrderProducts: $detailOfOrderProducts, totalOrderAmount: $totalOrderAmount, paymentStatus: $paymentStatus, paymentAmount: $paymentAmount, underPayment: $underPayment, orderStatus: $orderStatus, recipientName: $recipientName, deliveryAddress: $deliveryAddress, deliveryDate: $deliveryDate, deliveryTime: $deliveryTime, addedBy: $addedBy, createdAt: $createdAt, updatedBy: $updatedBy, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    final listEquals = const DeepCollectionEquality().equals;

    return other is Orders &&
        other.orderId == orderId &&
        other.customerName == customerName &&
        other.phoneNumber == phoneNumber &&
        listEquals(other.detailOfOrderProducts, detailOfOrderProducts) &&
        other.totalOrderAmount == totalOrderAmount &&
        other.paymentStatus == paymentStatus &&
        other.paymentAmount == paymentAmount &&
        other.underPayment == underPayment &&
        other.orderStatus == orderStatus &&
        other.recipientName == recipientName &&
        other.deliveryAddress == deliveryAddress &&
        other.deliveryDate == deliveryDate &&
        other.deliveryTime == deliveryTime &&
        other.addedBy == addedBy &&
        other.createdAt == createdAt &&
        other.updatedBy == updatedBy &&
        other.updatedAt == updatedAt;
  }

  @override
  int get hashCode {
    return orderId.hashCode ^
        customerName.hashCode ^
        phoneNumber.hashCode ^
        detailOfOrderProducts.hashCode ^
        totalOrderAmount.hashCode ^
        paymentStatus.hashCode ^
        paymentAmount.hashCode ^
        underPayment.hashCode ^
        orderStatus.hashCode ^
        recipientName.hashCode ^
        deliveryAddress.hashCode ^
        deliveryDate.hashCode ^
        deliveryTime.hashCode ^
        addedBy.hashCode ^
        createdAt.hashCode ^
        updatedBy.hashCode ^
        updatedAt.hashCode;
  }
}
