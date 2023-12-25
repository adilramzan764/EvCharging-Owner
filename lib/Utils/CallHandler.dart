import 'package:flutter/services.dart';
import 'package:url_launcher/url_launcher.dart';

class CallHandler {
  static Future<void> makePhoneCall(String phoneNumber) async {
    final Uri url = Uri(
      scheme: 'tel',
      path: phoneNumber,
    );

    try {
      if (await canLaunchUrl(url)) {
        await launchUrl(url);
      } else {
        throw 'Could not launch $phoneNumber';
      }
    } on PlatformException catch (e) {
      print('Error launching phone dialer: $e');
      // Handle the error or throw it again if needed
      throw e;
    }
  }
}
