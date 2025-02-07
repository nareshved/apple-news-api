import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapi/data/api_bloc/news_events.dart';
import 'package:newsapi/data/api_bloc/news_states.dart';
import 'package:newsapi/data/api_helper/api_helper.dart';
import 'package:newsapi/domain/models/news_model/news_model.dart';

class NewsBloc extends Bloc<NewsEvents, NewsStates> {
  ApiHelper apiHelper;
  NewsBloc({required this.apiHelper}) : super (NewsInitialState()) {

    on<GetNewsEvents>((event, emit) async{
      emit(NewsLoadingState());
      try{
      var rawData =  await apiHelper.getApi(apiUrl: "https://newsapi.org/v2/everything?q=apple&apiKey=950021bccae54216b322f508a999960f");
      var newsModelData = NewsModel.fromJson(rawData);

      emit(NewsLoadedState(mData: newsModelData));
      } catch (e) {
        emit(NewsErrorState(errorMsg: e.toString()));
      }
    },);
  }
}