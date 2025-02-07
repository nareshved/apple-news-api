import 'package:flutter/material.dart';
import 'package:newsapi/domain/utils/app_info.dart';
import 'package:newsapi/repository/widgets/sidebar.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

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
               child: ListView.builder(
                 itemCount: 11,
                 itemBuilder: (context, index) {
                 return Container(
                   margin: EdgeInsets.symmetric(
                       horizontal: 66, vertical: 10),
                   width: 100, height: 100,
                   color: Colors.teal,);
               },)),
          ],
        ),
      ),
    );
  }
}
