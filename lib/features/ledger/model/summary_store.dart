// To parse this JSON data, do
//
//     final summaryStore = summaryStoreFromJson(jsonString);

import 'dart:convert';

SummaryStore summaryStoreFromJson(Map<String, dynamic> data) =>
    SummaryStore.fromJson(data);

String summaryStoreToJson(SummaryStore data) => json.encode(data.toJson());

class SummaryStore {
  SummaryStore({
    this.totalProducts,
    this.totalCustomers,
    this.grossSalesToday,
    this.netProfitSalesToday,
    this.recentOrders,
  });

  int? totalProducts;
  int? totalCustomers;
  double? grossSalesToday;
  double? netProfitSalesToday;
  List<RecentOrder>? recentOrders;

  factory SummaryStore.fromJson(Map<String, dynamic> json) => SummaryStore(
        totalProducts: json["totalProducts"],
        totalCustomers: json["totalCustomers"],
        grossSalesToday: json["grossSalesToday"],
        netProfitSalesToday: json["netProfitSalesToday"],
        recentOrders: List<RecentOrder>.from(
            json["recentOrders"].map((x) => RecentOrder.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "totalProducts": totalProducts,
        "totalCustomers": totalCustomers,
        "grossSalesToday": grossSalesToday,
        "netProfitSalesToday": netProfitSalesToday,
        "recentOrders":
            List<dynamic>.from(recentOrders!.map((x) => x.toJson())),
      };
}

class RecentOrder {
  RecentOrder({
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

  String? orderId;
  String? customerName;
  String? phoneNumber;
  List<DetailOfOrderProduct>? detailOfOrderProducts;
  double? totalOrderAmount;
  String? paymentStatus;
  double? paymentAmount;
  double? underPayment;
  String? orderStatus;
  String? recipientName;
  String? deliveryAddress;
  String? deliveryDate;
  String? deliveryTime;
  String? addedBy;
  String? createdAt;
  String? updatedBy;
  String? updatedAt;

  factory RecentOrder.fromJson(Map<String, dynamic> json) => RecentOrder(
        orderId: json["orderId"] ?? "",
        customerName: json["customerName"] ?? "",
        phoneNumber: json["phoneNumber"] ?? "",
        detailOfOrderProducts: List<DetailOfOrderProduct>.from(
            json["detailOfOrderProducts"]
                .map((x) => DetailOfOrderProduct.fromJson(x))),
        totalOrderAmount: json["totalOrderAmount"],
        paymentStatus: json["paymentStatus"] ?? "",
        paymentAmount: json["paymentAmount"],
        underPayment: json["underPayment"],
        orderStatus: json["orderStatus"] ?? "",
        recipientName: json["recipientName"] ?? "",
        deliveryAddress: json["deliveryAddress"] ?? "",
        deliveryDate: json["deliveryDate"] ?? "",
        deliveryTime: json["deliveryTime"] ?? "",
        addedBy: json["addedBy"] ?? "",
        createdAt: json["createdAt"] ?? "",
        updatedBy: json["updatedBy"] ?? "",
        updatedAt: json["updatedAt"] ?? "",
      );

  Map<String, dynamic> toJson() => {
        "orderId": orderId,
        "customerName": customerName,
        "phoneNumber": phoneNumber,
        "detailOfOrderProducts":
            List<dynamic>.from(detailOfOrderProducts!.map((x) => x.toJson())),
        "totalOrderAmount": totalOrderAmount,
        "paymentStatus": paymentStatus,
        "paymentAmount": paymentAmount,
        "underPayment": underPayment,
        "orderStatus": orderStatus,
        "recipientName": recipientName,
        "deliveryAddress": deliveryAddress,
        "deliveryDate": deliveryDate,
        "deliveryTime": deliveryTime,
        "addedBy": addedBy,
        "createdAt": createdAt,
        "updatedBy": updatedBy,
        "updatedAt": updatedAt,
      };
}

class DetailOfOrderProduct {
  DetailOfOrderProduct({
    this.productId,
    this.productName,
    this.quantity,
    this.notes,
    this.totalPricePerProduct,
  });

  String? productId;
  String? productName;
  int? quantity;
  String? notes;
  double? totalPricePerProduct;

  factory DetailOfOrderProduct.fromJson(Map<String, dynamic> json) =>
      DetailOfOrderProduct(
        productId: json["productId"] ?? "",
        productName: json["productName"] ?? "",
        quantity: json["quantity"],
        notes: json["notes"] ?? "",
        totalPricePerProduct: json["totalPricePerProduct"],
      );

  Map<String, dynamic> toJson() => {
        "productId": productId,
        "productName": productName,
        "quantity": quantity,
        "notes": notes,
        "totalPricePerProduct": totalPricePerProduct,
      };
}
