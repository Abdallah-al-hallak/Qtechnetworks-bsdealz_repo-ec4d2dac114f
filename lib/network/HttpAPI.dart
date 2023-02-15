
import 'dart:developer';
import 'dart:io';

import 'package:bsdealz/utils/inherited/refresh_app_state.dart';

import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:dio_logger/dio_logger.dart';

import '../utils/Config.dart';


 class  HttpAPI {
   //String BASE_URL = "http://bsdeals.we-demo.xyz/";
  // String BASE_URL = "http://10.0.2.2/bsdealz/public/";
   String BASE_URL = Config.API_URL;
   //10.0.2.2:8000
   int connectTimeout = 15000;
   int receiveTimeout = 25000;
   Dio dio = new Dio();

   Inisalize(BuildContext context)  {
     // with default Options

     String API_URL = BASE_URL+"/api/";
// Set default configs
   print("server connection Inisalized"+"----------------------------------");
     this.dio.options.baseUrl = API_URL;
     this.dio.options.connectTimeout = connectTimeout; //5s
     this.dio.options.receiveTimeout = receiveTimeout;
     this.dio.options.followRedirects= false;
     this.dio.options.validateStatus= (status) { return status! < 500; };
     this.dio.options.responseType=ResponseType.json;
     //this.dio.options.contentType!=ContentType.parse("application/x-www-form-urlencoded");
     dio.interceptors.add(dioLoggerInterceptor);
     getToken(context);
     try {
       (this.dio.httpClientAdapter as DefaultHttpClientAdapter)
           .onHttpClientCreate = (HttpClient client) {
         client.badCertificateCallback =
             (X509Certificate cert, String host, int port) => true;
         return client;
       };
     }catch (_){
       // if(kIsWeb){
       //   (this.dio.httpClientAdapter as BrowserHttpClientAdapter)
       //       .onHttpClientCreate = (HttpClient client) {
       //     client.badCertificateCallback =
       //         (X509Certificate cert, String host, int port) => true;
       //     return client;
       //
       //   }
       //

     }
     return this.dio;
// or new Dio with a BaseOptions instance.
//     BaseOptions options = new BaseOptions(
//       baseUrl: BASE_URL,
//       connectTimeout: connectTimeout,
//       receiveTimeout: receiveTimeout,
//         headers:{"token":CustomSgaredPrefs().getV("token")},
//     );
//     Dio dio = new Dio(options);
   }
   getToken(BuildContext context)  {
    print("Getting Headers"+"----------------------------------");
    this.dio.options.headers = {
      "Authorization": "Bearer "+RefreshApp.of(context)!.apiHeaders.token.toString(),
      "Accept-Language":'${RefreshApp.of(context)!.apiHeaders.acceptLanguage}',
      "Accept-Currency":'${RefreshApp.of(context)!.apiHeaders.acceptCurrency}',
      "Keep-Alive": "true"
    };

    print("acceptLanguage-"+"${RefreshApp.of(context)!.apiHeaders.acceptLanguage}"+"-");
   }

   APILogin(@required email, @required password) async {
     var responce = await dio.post(
         "/login", data: { "email": email, "password": password});
   }

   APIGetUser(@required email, @required password) async {
     return await dio.post(
         "/login", data: { "email": email, "password": password});
   }
   APIGetCategories() async{
     var responce = await dio.get("/categories",);
     return responce.data.toString();
   }
   APIValidateResponce(Response<dynamic> responce) {
     if (responce.statusCode! < 400) {
       return true;
     } else {
       return false;
     }
   }

 }