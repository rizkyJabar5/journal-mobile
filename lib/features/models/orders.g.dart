// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'orders.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Orders _$OrdersFromJson(Map<String, dynamic> json) => Orders(
      json['orderId'] as String,
      json['customerName'] as String,
      json['phoneNumber'] as String,
      (json['detailOfOrderProducts'] as List<dynamic>)
          .map((e) => OrderDetails.fromJson(e as Map<String, dynamic>))
          .toList(),
      BigInt.parse(json['totalOrderAmount'] as String),
      json['paymentStatus'] as String,
      BigInt.parse(json['paymentAmount'] as String),
      BigInt.parse(json['underPayment'] as String),
      json['orderStatus'] as String,
      json['recipientName'] as String,
      json['deliveryAddress'] as String,
      json['deliveryDate'] as String,
      json['deliveryTime'] as String,
      json['addedBy'] as String,
      json['createdAt'] as String,
      json['updatedBy'] as String,
      json['updatedAt'] as String,
    );

Map<String, dynamic> _$OrdersToJson(Orders instance) => <String, dynamic>{
      'orderId': instance.orderId,
      'customerName': instance.customerName,
      'phoneNumber': instance.phoneNumber,
      'detailOfOrderProducts': instance.detailOfOrderProducts,
      'totalOrderAmount': instance.totalOrderAmount.toString(),
      'paymentStatus': instance.paymentStatus,
      'paymentAmount': instance.paymentAmount.toString(),
      'underPayment': instance.underPayment.toString(),
      'orderStatus': instance.orderStatus,
      'recipientName': instance.recipientName,
      'deliveryAddress': instance.deliveryAddress,
      'deliveryDate': instance.deliveryDate,
      'deliveryTime': instance.deliveryTime,
      'addedBy': instance.addedBy,
      'createdAt': instance.createdAt,
      'updatedBy': instance.updatedBy,
      'updatedAt': instance.updatedAt,
    };
