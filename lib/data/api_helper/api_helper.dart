import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:newsapi/domain/models/news_model/news_model.dart';

class ApiHelper {

  Future getApi ({required String apiUrl}) async {
   var uri  = Uri.parse(apiUrl);
    try{

   var response =   await http.get(uri,
      //  headers: {
      //   "apiKey" : ApiUrls.adminApiKey,
      // }
      );
   
   if(response.statusCode==200){
    var rawData = jsonDecode(response.body);
    var mData = NewsModel.fromJson(rawData);
    log("api data api helper : ${mData.toString()}");
    return mData;
   }

    } catch (e) {
      throw Exception(e.toString());
    }
  }
}