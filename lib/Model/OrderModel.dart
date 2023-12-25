class BookingInfo {
  final String stationId;
  final String status;
  final String buyerId;
  final String buyerName;
  final String buyerPhone;
  final String chargerType;
  final String carName;
  final String startedAt;
  final String chargingPrice;
  final String parkingPrice;
  final String duration;
  final String units;
  final String id;
  final String createdAt;
  final String updatedAt;

  BookingInfo({
    required this.stationId,
    required this.status,
    required this.buyerId,
    required this.buyerName,
    required this.buyerPhone,
    required this.chargerType,
    required this.carName,
    required this.startedAt,
    required this.chargingPrice,
    required this.parkingPrice,
    required this.duration,
    required this.units,
    required this.id,
    required this.createdAt,
    required this.updatedAt,
  });

  factory BookingInfo.fromJson(Map<String, dynamic> json) {
    return BookingInfo(
      stationId: json['stationId'] ?? '',
      status: json['status'] ?? '',
      buyerId: json['buyerId'] ?? '',
      buyerName: json['buyerName'] ?? '',
      buyerPhone: json['buyerPhone'] ?? '',
      chargerType: json['chargerType'] ?? '',
      carName: json['carName'] ?? '',
      startedAt: json['startedAt'] ?? '',
      chargingPrice: json['chargingPrice'] ?? '',
      parkingPrice: json['parkingPrice'] ?? '',
      duration: json['duration'] ?? '',
      units: json['units'] ?? '',
      id: json['_id'] ?? '',
      createdAt: json['createdAt'] ?? '',
      updatedAt: json['updatedAt'] ?? '',
    );
  }
}


