class CellTopListModel {
  final List<TitleModel>? titleList;
  final List<CellModel>? cellList;

  CellTopListModel.fromJson(Map<String, dynamic> json)
      : titleList = (json['title_list'] as List)
            .map((titleJson) => TitleModel.fromJson(titleJson))
            .toList(),
        cellList = (json['celllist'] as List)
            .map((cellJson) => CellModel.fromJson(cellJson))
            .toList();
}

class TitleModel {
  final String icon, text;

  TitleModel.fromJson(Map<String, dynamic> json)
      : icon = json['icon'],
        text = json['text'];
}

class CellModel {
  final String thumbnail, alt;
  //final BrandTag brandTag;

  CellModel.fromJson(Map<String, dynamic> json)
      : thumbnail = json['thumbnail'],
        alt = json['alt'];
  //brandTag = json['brand_tag'];
}

class BrandTag {
  final List<String> brandTag = [];
}
