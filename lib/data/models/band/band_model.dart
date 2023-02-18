import 'package:flutter_lab/data/models/band/cell_toplist_model.dart';

class BandModel {
  String type, subType, genTime, version, count, cellType = "";

  final CellTopListModel? cellTopList;

  BandModel.fromJson(Map<String, dynamic> json)
      : type = json['type'] ?? "",
        subType = json['sub_type'] ?? "",
        genTime = json['gen_time'] ?? "",
        version = json['version'] ?? "",
        cellTopList = json['cell_toplist'] != null
            ? CellTopListModel.fromJson(json['cell_toplist'])
            : null,
        cellType = json['cell_type'] ?? "",
        count = json['count'] ?? "";
}
