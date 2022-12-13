// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_details.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OrderDetails _$OrderDetailsFromJson(Map<String, dynamic> json) => OrderDetails(
      json['productId'],
      json['productName'],
      json['quantity'] as int,
      json['notes'] as String,
      BigInt.parse(json['totalPricePerProduct'] as String),
    );

Map<String, dynamic> _$OrderDetailsToJson(OrderDetails instance) =>
    <String, dynamic>{
      'productId': instance.productId,
      'productName': instance.productName,
      'quantity': instance.quantity,
      'notes': instance.notes,
      'totalPricePerProduct': instance.totalPricePerProduct.toString(),
    };
