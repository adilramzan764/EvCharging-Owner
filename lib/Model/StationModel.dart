class StationModel {
  final String userId;
  final String serviceHours;
  final String numberOfChargingSpots;
  final String perHourPrice;
  final String parkingPrice;
  final List<String> amenities;
  final List<String> namesOfChargingSpots;

  StationModel({
    required this.userId,
    required this.serviceHours,
    required this.numberOfChargingSpots,
    required this.perHourPrice,
    required this.parkingPrice,
    required this.amenities,
    required this.namesOfChargingSpots,
  });

  factory StationModel.fromJson(Map<String, dynamic> json) {
    return StationModel(
      userId: json['userId'],
      serviceHours: json['serviceHours'],
      numberOfChargingSpots: json['numberOfChargingSpots'],
      perHourPrice: json['perHourPrice'],
      parkingPrice: json['parkingPrice'],
      amenities: List<String>.from(json['amenities']),
      namesOfChargingSpots: List<String>.from(json['namesOfChargingSpots']),
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {
      'userId': userId,
      'serviceHours': serviceHours,
      'numberOfChargingSpots': numberOfChargingSpots,
      'perHourPrice': perHourPrice,
      'parkingPrice': parkingPrice,
      'amenities': amenities,
      'namesOfChargingSpots': namesOfChargingSpots,
    };
    return data;
  }
}
