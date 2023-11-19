import 'package:dio/dio.dart';
import 'package:laobooking/models/ScheduleConsular.dart';

import '../models/FindQueueModel.dart';
import '../models/RequestQueueRespose.dart';

class ConsularLaoApi {
  final _lao_gov = Dio(BaseOptions(
    baseUrl: "https://consularlao.gov.la/",
    headers: {
      'Authorization':
          'Bearer anUrbLQdEVK7V/w3Mjkp28ZDJXgDH7SpKeqtKBjkqMnNJT4OQ?ukI8w7M5/HmxsONU78KEg4p=!5r0WOf=5/zBa9h/PTI42lb5JEhR855=LTAt!!AeJBFkmFtrpOwS7KhMuk!=B=8Rn=aqz6U59ZoPATYEKFkaZ-C/4ZRUXjUfb4DA0-69KsueEHkI/RW8mD2lLudpbe5JZpti=uQmQe5Nq2G6pP9//DX9hGm3yFpVMInuh-O50nbYdMej1miJTs',
      'Content-Type': 'application/json', // Adjust content type as needed
    },
  ));

  final laobookingApi = Dio(BaseOptions(
    baseUrl: "http://localhost:3000",
  ));

  Future<Response<dynamic>> testListFullPro() {
    return _lao_gov.get("api/listfull_pro/1");
  }

  Future<Response<dynamic>> testFindQueue() {
    Map<String, dynamic> queryParams = {
      'fname': "THEP-ANANH",
      'lname': "VIRATHAVONE",
    };

    return _lao_gov.get('findqueue?${Uri(queryParameters: queryParams).query}');
  }

  Future<List<ScheduleConsular>> getListfullPro() async {
    final result = await _lao_gov.get("api/listfull_pro/1");
    if (result.statusCode == 200) {
      final histories = result.data;
      final List<ScheduleConsular> mapped = [];
      histories.forEach((usr) {
        mapped.add(ScheduleConsular.fromJson(usr));
      });

      return mapped;
    } else {
      throw Exception('Failed to load users');
    }
  }

  Future<List<FindQueueModel>> findQueue(
      String firstName, String lastName) async {
    // Define query parameters
    Map<String, dynamic> queryParams = {
      'fname': firstName,
      'lname': lastName,
    };

    final result = await _lao_gov
        .get('api/findqueue?${Uri(queryParameters: queryParams).query}');
    if (result.statusCode == 200) {
      final datalist = result.data['items'];
      final List<FindQueueModel> mapped = [];
      datalist.forEach((d) {
        mapped.add(FindQueueModel.fromJson(d));
      });

      return mapped;
    } else {
      throw Exception('Failed to load users');
    }
  }

  Future<RequestQueueResponse> requestQueueNo(
      String firstName,
      String lastName,
      String queueDate,
      String sex,
      String tel,
      String birthday,
      int age) async {
    final result = await _lao_gov.post('data/request_queue_no', data: {
      'table': "queue_details",
      'rows': {
        'age': '$age',
        'ca1': 'false',
        'ca2': 'false',
        'ca3': 'false',
        'ca4': 'false',
        'ca5': 'false',
        'ca6': 'false',
        'ca7': 'false',
        'ca8': 'false',
        'ca9': 'false',
        'ca10': 'false',
        'ca11': 'false',
        'ca12': 'false',
        'ca13': 'false',
        'ca14': 'false',
        'ca15': 'false',
        'dob': birthday,
        'fname': firstName,
        'lname': lastName,
        'queue_date': queueDate,
        'queue_no': "",
        'range_id': "1",
        'sex': sex,
        'tel': tel,
        'unit_id': 1,
      }
    });
    if (result.statusCode == 200) {
      print(result.data);
      return RequestQueueResponse.fromJson(result.data);
    } else {
      throw Exception('Failed to load users');
    }
  }
}
