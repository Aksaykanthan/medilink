import 'package:url_launcher/url_launcher.dart';

class MapUtils {
  MapUtils._();
  static Future<void> openMap(String googleMapUrl) async {
    if (await canLaunchUrl(googleMapUrl as Uri)) {
      await launchUrl(googleMapUrl as Uri);
    } else {
      throw 'Could not open the Map';
    }
  }
}
