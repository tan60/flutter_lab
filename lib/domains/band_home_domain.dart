import 'package:flutter_lab/data/models/band/band_model.dart';
import 'package:flutter_lab/data/models/band/cell_toplist_model.dart';
import 'package:flutter_lab/data/repository/base_repository.dart';

class BandHomeDomain {
  String bandRequestUrl =
      "https://apis.wavve.com/es/vod/hotepisodes?uitype=VN500&uirank=12&uiparent=GN51-VN500&uicode=VN500&&channel=all&orderby=viewtime&mtype=N&genre=all&contenttype=vod&broadcastid=VN500&WeekDay=all&apikey=E5F3E0D30947AA5440556471321BB6D9&credential=none&device=mobile&drm=wm&partner=pooq&pooqzone=none&region=kor&service=wavve&targetage=all&offset=0&limit=21";
  late BandModel bandModel;
  final int limit = 21;
  final List<CellModel> _cells = [];
  bool _isLast = false;

  void reFetchBands() {
    _isLast = false;
    fetchBands(0);
  }

  Future<BandModel> fetchBands(int offset) async {
    Uri uri = Uri.parse(bandRequestUrl);
    Map<String, String> queryParameters = Map.from(uri.queryParameters);
    queryParameters['offset'] = '$offset';
    queryParameters['limit'] = '$limit';

    bandRequestUrl = uri.replace(queryParameters: queryParameters).toString();

    bandModel = await BaseReo().fetchBand(bandRequestUrl);

    if (bandModel.cellTopList != null &&
        bandModel.cellTopList!.cellList != null) {
      List<CellModel> cellList = bandModel.cellTopList!.cellList!;

      if (cellList.length < limit) {
        _isLast = true;
      }

      _cells.addAll(bandModel.cellTopList!.cellList!);
    }

    return bandModel;
  }

  List<CellModel> getCellList() {
    return _cells;
  }

  bool isLast() {
    return _isLast;
  }

  String getFilterTitle(int filterListItemIndex) {
    Uri uri = Uri.parse(bandRequestUrl);
    Map<String, String> queryParameters = Map.from(uri.queryParameters);

    for (var filterItem in bandModel
        .filterModel.filterList[filterListItemIndex].filterItemList) {
      String keyName = filterItem.apiParameters.split('=')[0].substring(1);
      String keyValue = filterItem.apiParameters.split('=')[1];
      String currentSetValue = queryParameters[keyName] ?? "";
      if (currentSetValue == keyValue) {
        return filterItem.title;
      }
    }

    return "";
  }
}
