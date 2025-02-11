

import '../../domain/models/news_model/news_model.dart';

abstract class NewsStates {}

class NewsInitialState extends NewsStates {}

class NewsLoadingState extends NewsStates {}

class NewsLoadedState extends NewsStates {
  NewsModel mData;

  NewsLoadedState({required this.mData});
}

class NewsErrorState extends NewsStates {
  String errorMsg;
  NewsErrorState({required this.errorMsg});
}