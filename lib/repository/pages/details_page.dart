
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:newsapi/domain/models/news_model/news_model.dart';
import 'package:newsapi/repository/widgets/responsive.dart';
import 'package:url_launcher/url_launcher.dart';

class DetailsPage extends StatelessWidget {
  const DetailsPage({super.key, required this.articleModel, required this.articleUrl});

  final ArticleModel articleModel;
  final String articleUrl;

  @override
  Widget build(BuildContext context) {
    final isPage = MediaQuery.sizeOf(context);
    final isDesktop = ResponsiveApp.isDesktop(context);
    return Scaffold(
      body: SafeArea(
          child:
      SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CachedNetworkImage(imageUrl: articleModel.urlToImage!, fit: BoxFit.fill, width: isPage.width, height: isPage.height*0.4,),
            SizedBox(height: isPage.height*0.030,),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 10),
              color: Theme.of(context).colorScheme.primaryContainer,
              child: ListTile(
                leading: CircleAvatar(foregroundColor: Colors.white,child: Icon(Icons.date_range),),
                title:  Text("PublishedAt : ${articleModel.publishedAt!}",
                  style: isDesktop ? Theme.of(context).textTheme.titleSmall :
                  Theme.of(context).textTheme.titleMedium,),
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 10),
              color: Theme.of(context).colorScheme.primaryContainer,
              child: ListTile(
                leading: CircleAvatar(foregroundColor: Colors.white,child: Icon(Icons.person),),
                title:  Text("Author : ${articleModel.author!}",
                  style: isDesktop ? Theme.of(context).textTheme.titleSmall :
                  Theme.of(context).textTheme.titleMedium,),
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 10),
              color: Theme.of(context).colorScheme.primaryContainer,
              child: ListTile(
                leading: CircleAvatar(foregroundColor: Colors.white,child: Icon(Icons.edit_calendar),),
                title:  Text(articleModel.content!,
                  style: isDesktop ? Theme.of(context).textTheme.titleSmall :
                  Theme.of(context).textTheme.titleMedium,),
              ),
            ),Container(
              margin: EdgeInsets.symmetric(horizontal: 10),
              color: Theme.of(context).colorScheme.primaryContainer,
              child: ListTile(
                leading: CircleAvatar(foregroundColor: Colors.white,child: Icon(Icons.edit_calendar),),
                title:  Text(articleModel.title!,
                  style: isDesktop ? Theme.of(context).textTheme.titleSmall :
                  Theme.of(context).textTheme.titleMedium,),
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 10),
              color: Theme.of(context).colorScheme.primaryContainer,
              child: ListTile(
                leading: CircleAvatar(foregroundColor: Colors.white,child: Icon(Icons.edit_calendar),),
                title:  Text(articleModel.description!,
                  style: isDesktop ? Theme.of(context).textTheme.titleSmall :
                  Theme.of(context).textTheme.titleMedium,),
              ),
            ),

            Container(
              margin: EdgeInsets.symmetric(horizontal: 10),
              color: Theme.of(context).colorScheme.primaryContainer,
              child: ListTile(
                leading: ElevatedButton(onPressed: (){
                  _launchUrl();
                }, child: Text("Read full article..")),
              ),
            ),
          ],
        ),
      )
      ),
    );
  }


  Future<void> _launchUrl() async {
    if (!await launchUrl(Uri.parse(articleUrl))) {
      throw Exception('Could not launch $articleUrl');
    }
  }
}
