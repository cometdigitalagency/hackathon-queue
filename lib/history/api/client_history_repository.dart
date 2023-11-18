import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/history_model.dart';

final repositoryProvider =
    Provider<HistoryRepository>((_) => HistoryRepository());

class HistoryRepository {
  final _users = Dio(BaseOptions(
    baseUrl: "http://192.168.50.209:8000/",
  ));

  Future<List<History>> getHistories() async {
    Map<String, dynamic> postData = {"account": "2012345678"};
    final result = await _users.post("client_history.php", data: postData);
    if (result.statusCode == 200) {
      final histories = result.data;
      final List<History> mappedHistories = [];
      histories.forEach((usr) {
        mappedHistories.add(History.fromJson(usr));
      });

      return mappedHistories;
    } else {
      throw Exception('Failed to load users');
    }
  }
}
