// ignore: unused_import
import 'dart:convert';
// ignore: depend_on_referenced_packages
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:time_tracker/core/constants/api_const.dart';
import 'package:time_tracker/core/exceptions/failure.dart';
import 'package:time_tracker/core/manipulate_timespent.dart';
import 'package:time_tracker/time_tracker/data/datasources/itime_tracker.dart';
import 'package:time_tracker/time_tracker/data/models/time_tracker.dart';

import '../../../core/constants/environment.dart';

class TimeTrackerDataSource extends ITimeTrackerDataSource {
  Dio dio = Dio();
  @override
  Future<List<CategoryData>> getTimeSpent() async {
    var url = FlavorConfig.instance!.values.baseUrl + ApiConst().timeTracking;
    try {
      dio.interceptors.add(InterceptorsWrapper(
       
        onResponse: (Response response, ResponseInterceptorHandler handler) {
          if (response.requestOptions.path == url) {
            List<Map<String, dynamic>> responseData =
                (response.data as List<dynamic>).cast<Map<String, dynamic>>();
            response.data = manipulateResponse(responseData);
          }
          return handler.resolve(response);
        },
      ));

      Response response = await dio.get(
        url,
        options: Options(
          headers: {
            "Content-Type": "application/json",
          },
        ),
      );

      if (response.statusCode == 200) {
        List<CategoryData> categoryDataList = parseResponse(response.data);
        if (kDebugMode) {
          print(categoryDataList);
        }
        return categoryDataList;
      } else {
        throw Failure(
          message:
              "An error occurred, please check your internet connection and try again",
          statusCode: response.statusCode!,
        );
      }
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
      if (e is Failure) {
        throw Failure(statusCode: e.statusCode, message: e.message);
      }
      throw Failure(
          message:
              "An error occurred, please check your internet connection and try again");
    }
  }

  List<CategoryData> parseResponse(dynamic responseData) {
    List<CategoryData> categoryDataList = (responseData as List<dynamic>)
        .map((data) => CategoryData.fromJson(data))
        .toList();

    return categoryDataList;
  }
}
