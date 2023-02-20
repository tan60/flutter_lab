import 'package:flutter/material.dart';
import 'package:flutter_lab/data/models/filter_model.dart';

class FilterListWidget extends StatelessWidget {
  final String currentTitle;
  final List<FilterItemModel> filterItemList;

  const FilterListWidget({
    super.key,
    required this.currentTitle,
    required this.filterItemList,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black.withOpacity(0.7),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,
        backgroundColor: Colors.transparent,
        actions: [
          IconButton(
            icon: const Icon(
              Icons.close,
              color: Colors.white,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
      extendBodyBehindAppBar: true, //body 위에 appBar 배치
      body: Center(
        child: Align(
          alignment: Alignment.center,
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(80.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  for (var filterItem in filterItemList)
                    FilterItemTextWidget(
                      isSelected: currentTitle.compareTo(filterItem.title) == 0,
                      filterItem: filterItem,
                    ),
                ],
              ),
            ),
          ),
        ),
        /* child: Padding(
          padding: const EdgeInsets.all(50.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 50),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  for (var filterItem in filterItemList)
                    FilterItemTextWidget(
                      isSelected:
                          currentTitle.compareTo(filterItem.title) == 0,
                      filterItem: filterItem,
                    ),
                ],
              ),
            ],
          ),
        ), */
      ),
    );
  }
}

class FilterItemTextWidget extends StatelessWidget {
  final FilterItemModel filterItem;
  final bool isSelected;

  const FilterItemTextWidget({
    super.key,
    required this.filterItem,
    required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          filterItem.title,
          style: TextStyle(
            color: isSelected ? Colors.white : Colors.grey,
            fontSize: isSelected ? 24 : 18,
          ),
        ),
        const SizedBox(
          height: 10,
        ),
      ],
    );
  }
}
