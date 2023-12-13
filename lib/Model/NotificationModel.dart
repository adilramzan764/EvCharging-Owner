

class NotificationModel {
  final String profilepic;
  final String name;
  final String notification;
  final String? date; // Make the time property nullable

  final String? time; // Make the time property nullable

  NotificationModel({
    required this.profilepic,

    required this.name,
    required this.notification,
this.date,
    this.time, // Update the constructor parameter to match
  });
}
