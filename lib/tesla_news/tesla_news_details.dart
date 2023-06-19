import 'package:flutter/material.dart';
import 'package:news_api/common/cached_network_image_widget.dart';
import 'package:news_api/common/colors.dart';
import 'package:news_api/post_model.dart';
import 'package:url_launcher/url_launcher.dart';

class TeslaNewsDetailsScreen extends StatefulWidget {
  final Article news;
  const TeslaNewsDetailsScreen({super.key, required this.news});

  @override
  State<TeslaNewsDetailsScreen> createState() => _TeslaNewsDetailsScreenState();
}

class _TeslaNewsDetailsScreenState extends State<TeslaNewsDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('TESLA NEWS'),
          backgroundColor: primaryColor,
          centerTitle: true,
          elevation: 0,
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView(
            children: [
              cachedNetworkImage(context, imageUrl: widget.news.urlToImage!),
              const SizedBox(height: 10),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Expanded(child: Text(widget.news.author!)),
                  Text(
                      '${widget.news.publishedAt!.day.toString()}/${widget.news.publishedAt!.month.toString()}/${widget.news.publishedAt!.year.toString()}'),
                ],
              ),
              const SizedBox(height: 5),
              Text(
                widget.news.title!,
                style:
                    const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
              ),
              const SizedBox(height: 5),
              Text(widget.news.content!, textAlign: TextAlign.justify),
              const SizedBox(height: 5),
              Text(widget.news.description!, textAlign: TextAlign.justify),
              const SizedBox(height: 5),
              GestureDetector(
                onTap: () async {
                  await launchUrl(Uri.parse(widget.news.url!));
                },
                child: Text(
                  widget.news.url!,
                  style: const TextStyle(color: Colors.blue),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
