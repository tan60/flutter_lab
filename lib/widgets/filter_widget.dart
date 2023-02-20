import 'package:flutter/material.dart';
import 'package:flutter_lab/data/models/filter_model.dart';
import 'package:flutter_lab/widgets/filter_list_widget.dart';

class FilterWidget extends StatelessWidget {
  final String title;
  final List<FilterItemModel> filterItemList;

  const FilterWidget(
      {super.key, required this.title, required this.filterItemList});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        showGeneralDialog(
          barrierDismissible: false,
          context: context,
          pageBuilder: (context, animation, secondaryAnimation) {
            return FilterListWidget(
              currentTitle: title,
              filterItemList: filterItemList,
            );
          },
        );
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5.0),
        child: Row(
          children: [
            Text(
              title,
              style: TextStyle(
                color: Theme.of(context).textTheme.displayMedium!.color,
              ),
            ),
            const Icon(
              Icons.keyboard_arrow_down_outlined,
              color: Colors.white,
            ),
          ],
        ),
      ),
    );
  }
}
