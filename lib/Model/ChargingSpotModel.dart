class ChargingSpotModel {
  final String id;
  final String station;
  final String spotNumber;
  final String spotName;
  final List<BookingInfo> bookingInfo; // Update the type to List<BookingInfo>

  ChargingSpotModel({
    required this.id,
    required this.station,
    required this.spotNumber,
    required this.spotName,
    required this.bookingInfo,
  });

  factory ChargingSpotModel.fromJson(Map<String, dynamic> json) {
    return ChargingSpotModel(
      id: json['_id'],
      station: json['station'],
      spotNumber: json['spotNumber'],
      spotName: json['spotName'],
      bookingInfo: (json['bookingInfo'] as List<dynamic>)
          .map((booking) => BookingInfo.fromJson(booking))
          .toList(),
    );
  }
}

class BookingInfo {
  final String id;
  final String status;
  final String startedAt;
  final String duration;
  final String units;

  BookingInfo({
    required this.id,
    required this.status,
    required this.startedAt,
    required this.duration,
    required this.units,
  });

  factory BookingInfo.fromJson(Map<String, dynamic> json) {
    return BookingInfo(
      id: json['_id'],
      status: json['status'],
      startedAt: json['startedAt'],
      duration: json['duration'],
      units: json['units'],
    );
  }
}
