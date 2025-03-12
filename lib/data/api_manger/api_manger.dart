import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import '../model/Product_response.dart';
import '../model/Register_response.dart';

class ApiManger {
  Dio dio = Dio(
    BaseOptions(
      // connectTimeout: Duration(microseconds: 500),
      baseUrl: 'https://api.escuelajs.co/api/v1/'
    )

  )..interceptors.add(PrettyDioLogger(
      requestHeader: true,
      requestBody: true,
      responseBody: true,
      responseHeader: false,
      error: true,
      compact: true,
      maxWidth: 90,
      enabled: kDebugMode,
      filter: (options, args){
        // don't print requests with uris containing '/posts'
        if(options.path.contains('/posts')){
          return false;
        }
        // don't print responses with unit8 list data
        return !args.isResponse || !args.hasUint8ListData;
      }
  )
  );

  Future<List<ProductResponse>> getAllProducts() async {
    try {
      final response =
          await dio.get('products');

      List<dynamic> data = response.data;

      return data
          .map(
            (product) => ProductResponse.fromJson(product),
          )
          .toList();
    } catch (e) {
      return [];
    }
  }

  Future<RegisterResponse?>register({
    required String name,
    required String email,
    required String password,
})async{
    
   try{
     final response =await dio.post('users/',
         data: {
           "name": name,
           "email": email,
           "password": password,
           "avatar": "https://picsum.photos/800"
         }
     );

     return RegisterResponse.fromJson(response.data);
   }
   catch(e){
     print(e.toString());
     return null;
   }

  }
}
