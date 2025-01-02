import 'dart:async';
import 'dart:io';

import 'package:clean_architecture_and_blog/config/data/exception/app_exception.dart';
import 'package:clean_architecture_and_blog/config/data/exception/network/baseapiservices.dart';
import 'package:http/http.dart' as http;

class Networkservices implements Baseapiservices {
  @override
  Future getApi(String url) async {
    dynamic responseJson;
    try {
      final response =
          await http.get(Uri.parse(url)).timeout(Duration(seconds: 50));
      responseJson = returnResponse(response);
      if (response.statusCode == 200) {}
    } catch (e) {
      print(e);
    } on SocketException {
      throw NoInternetException('No Internet connection');
    } on TimeoutException {
      throw RequestTimeOut('Request Time out');
    } on HttpException {
      throw FetchDataException('No Internet connection');
    } on FormatException {
      throw FetchDataException('Bad response format');
    }
    return responseJson;
  }

  @override
  Future postApi(String url, data) async {
    dynamic responseJson;
    try {
      final response = await http.post(Uri.parse(url), body: data).timeout(
            Duration(seconds: 50),
          );
      responseJson = returnResponse(response);
      if (response.statusCode == 200) {}
    } catch (e) {
      print(e);
    } on SocketException {
      throw NoInternetException('No Internet connection');
    } on TimeoutException {
      throw RequestTimeOut('Request Time out');
    } on HttpException {
      throw FetchDataException('No Internet connection');
    } on FormatException {
      throw FetchDataException('Bad response format');
    }
    return responseJson;
  }

  @override
  Future deleteApi(String url, data) async {
    dynamic responseJson;
    try {
      final response = await http.delete(Uri.parse(url), body: data).timeout(
            Duration(seconds: 50),
          );
      responseJson = returnResponse(response);
      if (response.statusCode == 200) {}
    } catch (e) {
      print(e);
    } on SocketException {
      throw NoInternetException('No Internet connection');
    } on TimeoutException {
      throw RequestTimeOut('Request Time out');
    } on HttpException {
      throw FetchDataException('No Internet connection');
    } on FormatException {
      throw FetchDataException('Bad response format');
    }
  }

  //
  dynamic returnResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        var responseJson = response.body;
        return responseJson;
      case 400:
        var responseJson = response.body;
        return responseJson;
      case 401:
      case 403:
        throw UnauthorizedException(response.body.toString());
      case 500:
      default:
        throw FetchDataException(
            'Error occured while Communication with Server with StatusCode : ${response.statusCode}');
    }
  }
}
