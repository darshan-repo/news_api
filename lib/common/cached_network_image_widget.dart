import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news_api/common/colors.dart';

Widget cachedNetworkImage(
  BuildContext context, {
  required String imageUrl,
}) {
  return SizedBox(
    height: MediaQuery.of(context).size.height * 0.28,
    width: double.infinity,
    child: CachedNetworkImage(
      imageUrl: imageUrl,
      imageBuilder: (context, imageProvider) => Container(
        height: MediaQuery.of(context).size.height * 0.28,
        width: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: imageProvider,
            fit: BoxFit.fill,
          ),
        ),
      ),
      placeholder: (context, url) => Center(
        child: CircularProgressIndicator(
          color: primaryColor,
        ),
      ),
      errorWidget: (context, url, error) => const Icon(Icons.error),
    ),
  );
}
