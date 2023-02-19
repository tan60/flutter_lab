import 'package:flutter_lab/data/models/band/band_model.dart';
import 'package:flutter_lab/data/repository/api_service.dart';
import 'package:flutter_lab/data/repository/local_service.dart';
import 'package:flutter_lab/data/repository/api_blueprint.dart';

class BaseReo extends ApiBlueprint {
  final LocalService _localService = LocalService();
  final ApiService _apiService = ApiService();

  BaseReo._privateConstructor();

  static final BaseReo _instance = BaseReo._privateConstructor();

  factory BaseReo() {
    return _instance;
  }

//"https://apis.wavve.com/es/vod/hotepisodes?uitype=VN500&uirank=12&uiparent=GN51-VN500&uicode=VN500&orderby=viewtime&offset=0&mtype=N&limit=21&genre=all&contenttype=vod&broadcastid=VN500&WeekDay=all&apikey=E5F3E0D30947AA5440556471321BB6D9&credential=none&device=mobile&drm=wm&partner=pooq&pooqzone=none&region=kor&service=wavve&targetage=all";
  @override
  Future<BandModel> fetchBand(String bandUrl) async {
    //find local first
    BandModel? bands = await _localService.fetchBand(bandUrl);

    if (bands != null && bands.cellTopList!.cellList!.isNotEmpty) {
      return bands;
    } else {
      //if there is no data in local then request to Server
      return await _apiService.fetchBand(bandUrl);
    }
  }
}
