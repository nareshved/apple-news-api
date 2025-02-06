import 'package:flutter/material.dart';
import 'package:newsapi/domain/utils/app_colors.dart';
import 'package:newsapi/domain/utils/app_info.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text(AppDeveloperInfo.appName),
        ),
        body: Center(
          child: Column(
            children: [
              Text(
                "Naresh KUMAR",
                style: Theme.of(context).textTheme.displayLarge,
              ),
              Text(
                "Naresh KUMAR",
                style: Theme.of(context).textTheme.displayMedium!.copyWith(
                      color: Theme.of(context).colorScheme.primary,
                    ),
              ),
              Text(
                "Naresh KUMAR",
              ),
              Container(
                width: 200,
                height: 200,
                color: AppColors.darkOnPrimaryContainerColor,
              )
            ],
          ),
        ),
      ),
    );
  }
}
