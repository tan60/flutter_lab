import 'dart:convert';

import 'package:flutter_lab/data/repository/api_blueprint.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_lab/data/models/band/band_model.dart';

class ApiService extends ApiBlueprint {
  final String scheme = "https";
  final String domainPrd = "apis.wavve.com";
  final String domainDev = "apis.wavve.com";
  final String domainQa = "apis.wavve.com";

  late final String baseUrlPrd;
  late final String baseUrlDev;
  late final String baseUrlQa;

  ApiService() {
    baseUrlPrd = "$scheme://$domainPrd";
    baseUrlDev = "$scheme://$domainDev";
    baseUrlQa = "$scheme://$domainQa";
  }

  @override
  Future<BandModel> fetchBand(String bandUrl) async {
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
