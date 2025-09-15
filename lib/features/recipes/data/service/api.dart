import 'dart:io';

import 'package:flutter_dotenv/flutter_dotenv.dart';

class RecipeApiService {
 

 

  Future<Map<String,dynamic>> getRecipes() async{
    try{
      final apiKey = dotenv.env['API_KEY'];
      print(apiKey);
      return {};
    }catch(e){
      throw Exception(e);
    }



  }

}