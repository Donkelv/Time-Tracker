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
  Future<TimeSpentList> getTimeSpent() async {
    var url = FlavorConfig.instance!.values.baseUrl + ApiConst().timeTracking;
    debugPrint("the url is $url");
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
      print(response);
      TimeSpentList timeSpentList = TimeSpentList.fromJson(response.data);
      print(timeSpentList);
      if (response.statusCode == 200) {
        return TimeSpentList.fromJson(jsonDecode(response.data));
      } else {
        throw Failure(
          message:
              "An error occurred, please check your internet connection and try again",
          statusCode: response.statusCode!,
        );
      }
    } catch (e) {
      print(e);
      if (e is Failure) {
        throw Failure(statusCode: e.statusCode, message: e.message);
      }
      throw Failure(
          message:
              "An error occurred, please check your internet connection and try again");
    }
  }
}
