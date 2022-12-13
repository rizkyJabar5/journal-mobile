import 'package:json_annotation/json_annotation.dart';
part 'order_details.g.dart';

@JsonSerializable()
class OrderDetails {
  final productId;
  final productName;
  final int quantity;
  final String notes;
  final BigInt totalPricePerProduct;

  OrderDetails(
    this.productId,
    this.productName,
    this.quantity,
    this.notes,
    this.totalPricePerProduct,
  );
  factory OrderDetails.fromJson(Map<String, dynamic> json) =>
      _$OrderDetailsFromJson(json);
}
