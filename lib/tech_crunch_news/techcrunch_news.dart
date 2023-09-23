import 'package:flutter/material.dart';
import 'package:news_api/common/card.dart';
import 'package:news_api/common/colors.dart';
import 'package:news_api/network_api.dart';
import 'package:news_api/post_model.dart';
import 'package:news_api/tech_crunch_news/techcrunch_news_details.dart';

class TechCrunchNewsScreen extends StatefulWidget {
  const TechCrunchNewsScreen({super.key});

  @override
  State<TechCrunchNewsScreen> createState() => _TechCrunchNewsScreenState();
}

class _TechCrunchNewsScreenState extends State<TechCrunchNewsScreen> {
  NewsApi? newsData;
  bool loading = false  ;
  @override
  void initState() {
    getNewsData();
    super.initState();
  }

  getNewsData() async {
    loading = true;
    newsData = await NetworkApi.fetchNews(
        'top-headlines?sources=techcrunch&apiKey=4e68ccdb0e594edda7cac6cb35a23c31');
    loading = false;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: loading
            ? Center(
                child: CircularProgressIndicator(color: primaryColor),
              )
            : Padding(
                padding: const EdgeInsets.all(10),
                child: ListView.separated(
                  separatorBuilder: (context, index) => Divider(
                    indent: 5,
                    endIndent: 5,
                    color: secondaryColors,
                  ),
                  itemCount: newsData!.articles.length,
                  itemBuilder: (context, index) {
                    return newsListCard(context, onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => TechCrunchNewsDetailsScreen(
                            news: newsData!.articles[index],
                          ),
                        ),
                      );
                    },
                        imageUrl: newsData!.articles[index].urlToImage ??
                            'https://cdn.w600.comps.canstockphoto.com/no-stock-illustration_csp19967382.jpg',
                        titleText: newsData!.articles[index].title!,
                        date:
                            '${newsData!.articles[index].publishedAt!.day.toString()}/${newsData!.articles[index].publishedAt!.month.toString()}/${newsData!.articles[index].publishedAt!.year.toString()}');
                  },
                ),
              ),
      ),
    );
  }
}
