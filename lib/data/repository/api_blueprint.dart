import 'package:flutter_lab/data/models/band/band_model.dart';

abstract class ApiBlueprint {
  Future<BandModel>? fetchBand(String bandUrl);
}
