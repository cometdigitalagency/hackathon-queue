import 'package:dio/dio.dart';
import 'package:laobooking/models/ListfullPro.dart';

class LaoGovApi {
  final _lao_gov = Dio(BaseOptions(
    baseUrl: "https://consularlao.gov.la/api/",
  ));

  Future<Response<dynamic>> testListFullPro() {
    return _lao_gov.get("listfull_pro/1");
  }

  Future<Response<dynamic>> testFindQueue() {
    Map<String, dynamic> queryParams = {
      'fname': "THEP-ANANH",
      'lname': "VIRATHAVONE",
    };

    return _lao_gov.get('findqueue?${Uri(queryParameters: queryParams).query}');
  }

  Future<List<ListfullPro>> getListfullPro() async {
    final result = await _lao_gov.get("listfull_pro/1");
    if (result.statusCode == 200) {
      final histories = result.data;
      final List<ListfullPro> mappedHistories = [];
      histories.forEach((usr) {
        mappedHistories.add(ListfullPro.fromJson(usr));
      });

      return mappedHistories;
    } else {
      throw Exception('Failed to load users');
    }
  }

  Future<List<ListfullPro>> findQueue(String firstName, String lastName) async {
    // Define query parameters
    Map<String, dynamic> queryParams = {
      'fname': firstName,
      'lname': lastName,
    };

    final result = await _lao_gov
        .get('findqueue?${Uri(queryParameters: queryParams).query}');
    if (result.statusCode == 200) {
      final histories = result.data;
      final List<ListfullPro> mappedHistories = [];
      histories.forEach((usr) {
        mappedHistories.add(ListfullPro.fromJson(usr));
      });

      return mappedHistories;
    } else {
      throw Exception('Failed to load users');
    }
  }
}
