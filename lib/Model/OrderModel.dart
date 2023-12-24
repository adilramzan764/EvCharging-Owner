// models/order_model.dart
// models/order_model.dart
class OrderModel {
  final String id;
  final String station;
  final String status;
  final String buyerid;
  final String startedAt;
  final String chargingPrice;
  final String parkingPrice;
  final String duration;
  final String units;
  final String createdAt;
  final String updatedAt;
  final int v;
  final String carName; // Added field for carName
  final String buyerPhone; // Added field for buyerPhone
  final String buyerName; // Added field for buyerName
  final String chargerType;

  OrderModel({
    required this.id,
    required this.station,
    required this.status,
    required this.buyerid,
    required this.startedAt,
    required this.chargingPrice,
    required this.parkingPrice,
    required this.duration,
    required this.units,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
    required this.carName,
    required this.buyerPhone,
    required this.buyerName,
    required this.chargerType,

  });

  factory OrderModel.fromJson(Map<String, dynamic> json) {
    return OrderModel(
      id: json['_id'] ?? '',
      station: json['station'] ?? '',
      status: json['status'] ?? '',
      buyerid: json['buyerId'] ?? '',
      startedAt: json['startedAt'] ?? '',
      chargingPrice: json['chargingPrice'] ?? '',
      parkingPrice: json['parkingPrice'] ?? '',
      duration: json['duration'] ?? '',
      units: json['units'] ?? '',
      createdAt: json['createdAt'] ?? '',
      updatedAt: json['updatedAt'] ?? '',
      v: json['__v'] ?? 0,
      carName: json['carName'] ?? '', // Assigning default value if key is not present
      buyerPhone: json['buyerPhone'] ?? '', // Assigning default value if key is not present
      buyerName: json['buyerName'] ?? '', // Assigning default value if key is not present
      chargerType:  json['chargerType'] ??'',
    );
  }
}

List<OrderModel> orderListFromJson(List<dynamic> jsonList) {
  return jsonList.map((item) => OrderModel.fromJson(item)).toList();
}