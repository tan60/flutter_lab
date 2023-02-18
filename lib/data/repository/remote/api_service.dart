import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:flutter_lab/data/models/band/band_model.dart';

class ApiService {
  static const String scheme = "https";
  static const String domainPrd = "apis.wavve.com";
  static const String domainDev = "apis.wavve.com";
  static const String domainQa = "apis.wavve.com";

  static const String baseUrlPrd = "$scheme://$domainPrd";
  static const String baseUrlDev = "$scheme://$domainDev";
  static const String baseUrlQa = "$scheme://$domainQa";

  static Future<BandModel> getBand(String bandUrl) async {
    final url = Uri.parse(bandUrl);
    final response = await http.get(url);

    print(url);

    if (response.statusCode == 200) {
      final band = jsonDecode(response.body);
      print(band);
      return BandModel.fromJson(band);
    }

    throw Error();
  }
}
