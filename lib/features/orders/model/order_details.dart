import 'dart:convert';

class DetailOfOrderProduct {
  String? productId;
  String? productName;
  int? quantity;
  dynamic notes;
  int? totalPricePerProduct;

  DetailOfOrderProduct({
    this.productId,
    this.productName,
    this.quantity,
    this.notes,
    this.totalPricePerProduct,
  });

  DetailOfOrderProduct copyWith({
    String? productId,
    String? productName,
    int? quantity,
    dynamic notes,
    int? totalPricePerProduct,
  }) {
    return DetailOfOrderProduct(
      productId: productId ?? this.productId,
      productName: productName ?? this.productName,
      quantity: quantity ?? this.quantity,
      notes: notes ?? this.notes,
      totalPricePerProduct: totalPricePerProduct ?? this.totalPricePerProduct,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'productId': productId,
      'productName': productName,
      'quantity': quantity,
      'notes': notes,
      'totalPricePerProduct': totalPricePerProduct,
    };
  }

  factory DetailOfOrderProduct.fromMap(Map<String, dynamic> map) {
    return DetailOfOrderProduct(
      productId: map['productId'],
      productName: map['productName'],
      quantity: map['quantity']?.toInt(),
      notes: map['notes'] ?? null,
      totalPricePerProduct: map['totalPricePerProduct']?.toInt(),
    );
  }

  String toJson() => json.encode(toMap());

  factory DetailOfOrderProduct.fromJson(String source) =>
      DetailOfOrderProduct.fromMap(json.decode(source));

  @override
  String toString() {
    return 'DetailOfOrderProduct(productId: $productId, productName: $productName, quantity: $quantity, notes: $notes, totalPricePerProduct: $totalPricePerProduct)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is DetailOfOrderProduct &&
        other.productId == productId &&
        other.productName == productName &&
        other.quantity == quantity &&
        other.notes == notes &&
        other.totalPricePerProduct == totalPricePerProduct;
  }

  @override
  int get hashCode {
    return productId.hashCode ^
        productName.hashCode ^
        quantity.hashCode ^
        notes.hashCode ^
        totalPricePerProduct.hashCode;
  }
}
