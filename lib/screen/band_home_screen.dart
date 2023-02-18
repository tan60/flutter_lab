import 'package:flutter/material.dart';
import 'package:flutter_lab/data/models/band/cell_toplist_model.dart';
import 'package:flutter_lab/widgets/cell_widget.dart';

import '../data/models/band/band_model.dart';
import '../data/repository/remote/api_service.dart';

class BandHomeScreen extends StatefulWidget {
  const BandHomeScreen({super.key});

  @override
  State<BandHomeScreen> createState() => _BandHomeScreenState();
}

class _BandHomeScreenState extends State<BandHomeScreen> {
  late Future<BandModel> bandModel;

  @override
  void initState() {
    super.initState();
    const String url =
        "https://apis.wavve.com/es/vod/hotepisodes?uitype=VN500&uirank=12&uiparent=GN51-VN500&uicode=VN500&orderby=viewtime&offset=0&mtype=N&limit=21&genre=all&contenttype=vod&broadcastid=VN500&WeekDay=all&apikey=E5F3E0D30947AA5440556471321BB6D9&credential=none&device=mobile&drm=wm&partner=pooq&pooqzone=none&region=kor&service=wavve&targetage=all";

    bandModel = ApiService.getBand(url);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        foregroundColor: Theme.of(context).textTheme.displayMedium!.color,
        backgroundColor: Theme.of(context).colorScheme.background,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
          ),
          onPressed: () {
            //Navigator.pop(context);
          },
        ),
      ),
      body: Column(
        children: [
          Row(
            children: [
              Text(
                'filter',
                style: TextStyle(
                  color: Theme.of(context).textTheme.displayMedium!.color,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 15,
          ),
          FutureBuilder(
            future: bandModel,
            builder: (context, snapshot) {
              if (snapshot.hasData &&
                  snapshot.data!.cellTopList != null &&
                  snapshot.data!.cellTopList!.cellList != null) {
                List<CellModel> cells = snapshot.data!.cellTopList!.cellList!;

                return Expanded(
                  child: createGridView(cells),
                );
              } else {
                return const Text('...');
              }
            },
          ),
        ],
      ),
    );
  }

  GridView createGridView(List<CellModel> cells) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        childAspectRatio: (1 / 1.48),
      ),
      itemCount: cells.length,
      itemBuilder: (context, index) {
        CellModel cell = cells[index];
        return Cell(
          thumbnail: cell.thumbnail,
          alt: cell.alt,
          deeplink: "",
        );
      },
    );
  }
}
