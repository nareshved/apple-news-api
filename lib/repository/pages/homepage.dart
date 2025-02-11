import 'dart:developer';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:newsapi/data/api_bloc/news_bloc.dart';
import 'package:newsapi/data/api_bloc/news_events.dart';
import 'package:newsapi/data/api_bloc/news_states.dart';
import 'package:newsapi/domain/utils/app_info.dart';
import 'package:newsapi/repository/pages/details_page.dart';
import 'package:newsapi/repository/widgets/responsive.dart';
import 'package:newsapi/repository/widgets/sidebar.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    BlocProvider.of<NewsBloc>(context).add(GetNewsEvents());
  }



  @override
  Widget build(BuildContext context) {
   //  final isPage = MediaQuery.sizeOf(context);
    final isResponsive = ResponsiveApp.isDesktop(context);
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text(AppDeveloperInfo.appName),
        ),
        body: Row(
          children: [
            SidebarWidget(),
           BlocBuilder<NewsBloc, NewsStates>(
             builder: (context, state) {

               if(state is NewsLoadingState){
                 return Center(child: CircularProgressIndicator());
               }

               if(state is NewsErrorState) {
                 log("ye hai ${state.errorMsg}");
                 return Center(child: Text(state.errorMsg));
               }

               if(state is NewsLoadedState) {
                 return Expanded(
                   flex: 3,
                   child: GridView.builder(
                     gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                       childAspectRatio: isResponsive ? 2/2 : 2/2.9,
                         crossAxisCount: 2),
                     itemCount: state.mData.articles!.length,
                     itemBuilder: (context, index) {
                       var newsData = state.mData.articles![index];
                     return Container(
                       margin: EdgeInsets.all(13),
                       decoration: BoxDecoration(
                         color: Theme.of(context).colorScheme.primaryContainer,
                         borderRadius : BorderRadius.circular(12),
                       ),
                       child: Padding(
                         padding: const EdgeInsets.all(12.0),
                         child: Column(
                           mainAxisAlignment: MainAxisAlignment.spaceAround,
                           crossAxisAlignment: CrossAxisAlignment.start,
                           children: [
                           ClipRRect(
                               borderRadius : BorderRadius.circular(12),
                               child: CachedNetworkImage(
                                 placeholder: (context, url) => Center(child: CircularProgressIndicator()),
                                 errorWidget: (context, url, error) => Image.asset("assets/images/apple.png",),
                              //   width: isPage.width*0.5,
                                 imageUrl: newsData.urlToImage!= null ? newsData.urlToImage! : "wait",
                                 scale: 1.0, fit: BoxFit.cover,
                               )),
                             FittedBox(
                               child: Text("PublishedAt : ${newsData.publishedAt!}",
                                 style: isResponsive ? Theme.of(context).textTheme.titleMedium : Theme.of(context).textTheme.bodyMedium,
                               
                               ),
                             ),
                             FittedBox(
                               child: Text(newsData.title!, overflow: isResponsive ? TextOverflow.ellipsis : TextOverflow.fade,
                               style: isResponsive ? Theme.of(context).textTheme.titleMedium : Theme.of(context).textTheme.bodyMedium,
                               ),
                             ),
                             ElevatedButton(onPressed: () =>
                                 Navigator.push(context, MaterialPageRoute(builder: (context) => DetailsPage(articleModel: newsData, articleUrl: newsData.url!,),)),
                                 child: Text("Read More...")),
                           ],
                         ),
                       ),
                     );
                   },),
                 );
               }

               return Lottie.asset(
                   "assets/images/lottie/no_result.json",
                   alignment: Alignment.center,
                   width: 80, height: 80); // lottie no data
           },),
          ],
        ),

      ),
    );
  }
}
