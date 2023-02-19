import 'package:flutter/material.dart';
import 'package:flutter_lab/data/models/band/cell_toplist_model.dart';
import 'package:flutter_lab/domains/band_home_domain.dart';
import 'package:flutter_lab/widgets/cell_widget.dart';
import 'package:flutter_lab/data/models/band/band_model.dart';

class BandHomeScreen extends StatefulWidget {
  const BandHomeScreen({super.key});

  @override
  State<BandHomeScreen> createState() => _BandHomeScreenState();
}

class _BandHomeScreenState extends State<BandHomeScreen> {
  BandHomeDomain domain = BandHomeDomain();
  late Future<BandModel> bandModel;

  @override
  void initState() {
    super.initState();

    bandModel = domain.fetchBands(0);
  }

  Future<void> fetchBands(int offset) async {
    await domain.fetchBands(offset);
    setState(() {});
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
              if (snapshot.hasData) {
                return Expanded(
                  child: createGridView(domain.getCellList()),
                );
              } else {
                return Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Center(
                        child: CircularProgressIndicator(),
                      ),
                    ],
                  ),
                );
              }
            },
          ),
        ],
      ),
    );
  }

  GridView createGridView(List<CellModel> cells) {
    const int nextPageThreshold = 6;
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        childAspectRatio: (1 / 1.48),
      ),
      itemCount: cells.length,
      itemBuilder: (context, index) {
        print('index = $index');
        if (index == domain.limit - nextPageThreshold) {
          if (!domain.isLast()) {
            //fetch more content
            print('fetch more band :: offset is ${cells.length}');
            fetchBands(cells.length);
          }
        }
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
