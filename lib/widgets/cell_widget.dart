import 'package:flutter/material.dart';
import 'package:flutter_lab/managers/image_manager.dart';

class Cell extends StatelessWidget {
  final String thumbnail, alt, deeplink;

  const Cell({
    super.key,
    required this.thumbnail,
    required this.alt,
    required this.deeplink,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Stack(
        alignment: AlignmentDirectional.center,
        children: [
          Container(
            clipBehavior: Clip.hardEdge,
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.03),
              borderRadius: BorderRadius.circular(15),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              alt,
              style: TextStyle(
                color: Theme.of(context)
                    .textTheme
                    .displayMedium!
                    .color!
                    .withOpacity(0.2),
                fontSize: 12,
              ),
            ),
          ),
          Column(
            children: [
              LayoutBuilder(
                builder: (p0, p1) {
                  double width = p1.maxWidth;
                  double height = width * 1.48;

                  return Container(
                    clipBehavior: Clip.hardEdge,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Stack(
                      children: [
                        Image.network(
                          ImageMgr.getImage(
                              thumbnail, width.toInt(), height.toInt()),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
