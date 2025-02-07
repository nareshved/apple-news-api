import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapi/data/api_bloc/news_bloc.dart';
import 'package:newsapi/data/api_bloc/news_events.dart';
import 'package:newsapi/data/api_bloc/news_states.dart';
import 'package:newsapi/domain/utils/app_info.dart';
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
    // final isPage = MediaQuery.sizeOf(context);
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text(AppDeveloperInfo.appName),
        ),
        body: Row(
          children: [
            SidebarWidget(),
           Expanded(
             flex: 4,
               child: BlocBuilder<NewsBloc, NewsStates>(
                 builder: (context, state) {

                   if(state is NewsLoadingState){
                     return Center(child: CircularProgressIndicator());
                   }

                   if(state is NewsErrorState) {
                     log("ye hai ${state.errorMsg}");
                     return Center(child: Text(state.errorMsg));
                   }

                   if(state is NewsLoadedState) {
                     var newsData = state.mData.articles!;
                     return ListView.builder(
                       itemCount: state.mData.articles!.length,
                       itemBuilder: (context, index) {
                       return ListTile(
                         title: Text(newsData[index].title!),
                         subtitle: Text(newsData[index].description!),
                       );
                     },);
                   }

                   return Container(child: Text("naresh"),); // lottie no data
               },),

           ),
          ],
        ),
      ),
    );
  }
}
