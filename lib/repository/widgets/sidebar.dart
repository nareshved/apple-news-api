import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class SidebarWidget extends StatelessWidget {
  const SidebarWidget({super.key});

  @override
  Widget build(BuildContext context) {
  //  final isPage = MediaQuery.sizeOf(context);
    return   Expanded(
      child: ListView(
        children: [
          Container(
            margin: EdgeInsets.all(22),
            // width: 60,
           //  height: 120,
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.primaryContainer,
              borderRadius: BorderRadius.circular(11),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: 11,
                children: [
      CircleAvatar(
        backgroundImage: NetworkImage("https://static.vecteezy.com/system/resources/previews/032/168/051/large_2x/entrepreneur-laptop-males-happy-office-happiness-technology-job-young-businessman-men-indian-smile-sitting-photo.jpg"),
      ),
                  Text("Naresh Kumar Flutter Dev",
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                ],
              ),
            ),
          ),
          ListTile(
            leading: Icon(Icons.dark_mode),
            title: Text("Dark Mode"),
          )
        ],
      ),
    );
  }
}
