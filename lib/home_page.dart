import 'package:flutter/material.dart';
import 'package:news_api/apple_news/apple_news.dart';
import 'package:news_api/business_news/business_news.dart';
import 'package:news_api/common/colors.dart';
import 'package:news_api/tech_crunch_news/techcrunch_news.dart';
import 'package:news_api/tesla_news/tesla_news.dart';
import 'package:news_api/wall_street_news/wall_street_news.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: const Text('DAILY NEWS'),
            backgroundColor: primaryColor,
            centerTitle: true,
            elevation: 0,
            actions: const [
              Icon(Icons.notifications_none),
              SizedBox(width: 10),
            ],
            bottom: const TabBar(
              indicatorSize: TabBarIndicatorSize.tab,
              isScrollable: true,
              indicatorWeight: 2.5,
              indicatorColor: Colors.white,
              tabs: [
                Text(
                  'Apple',
                  style: TextStyle(fontSize: 18),
                ),
                Text(
                  'Tesla',
                  style: TextStyle(fontSize: 18),
                ),
                Text(
                  'Business',
                  style: TextStyle(fontSize: 18),
                ),
                Text(
                  'Tech Crunch',
                  style: TextStyle(fontSize: 18),
                ),
                Text(
                  'Wall Street',
                  style: TextStyle(fontSize: 18),
                )
              ],
            ),
          ),
          body: NotificationListener<OverscrollIndicatorNotification>(
            onNotification: (notification) {
              notification.disallowIndicator();
              return true;
            },
            child: const TabBarView(
              children: [
                AppleNewsScreen(),
                BusinessNewsScreen(),
                TechCrunchNewsScreen(),
                TeslaNewsScreen(),
                WallStreetNewsScreen(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
