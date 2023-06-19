import 'package:flutter/material.dart';
import 'package:news_api/common/cached_network_image_widget.dart';

Widget newsListCard(
  BuildContext context, {
  required String imageUrl,
  required String titleText,
  required String date,
  required void Function()? onTap,
}) {
  return GestureDetector(
    onTap: onTap,
    child: Card(
      elevation: 3,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            cachedNetworkImage(context, imageUrl: imageUrl),
            const SizedBox(
              height: 10,
            ),
            Text(
              titleText,
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(
              height: 10,
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: Text(
                date,
                style: const TextStyle(fontSize: 16),
              ),
            )
          ],
        ),
      ),
    ),
  );
}
