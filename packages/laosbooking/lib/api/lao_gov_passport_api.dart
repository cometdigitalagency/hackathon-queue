import 'package:dio/dio.dart';
import 'package:laosbooking/models/ListfullPro.dart';

class ListfullProRepository {
  final _lao_gov = Dio(BaseOptions(
    baseUrl: "https://consularlao.gov.la/api/",
  ));

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
}
