import 'package:flutter/material.dart';
import 'package:flutter_lab/data/models/filter_model.dart';

class FilterListScreen extends StatelessWidget {
  final List<FilterItemModel> filterItemList;

  const FilterListScreen({
    super.key,
    required this.filterItemList,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black.withOpacity(0.3),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            const SizedBox(height: 50),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: const Icon(
                    Icons.close,
                    color: Colors.white,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
