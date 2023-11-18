import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hackaton_2023/history/api/client_history_repository.dart';
import 'package:hackaton_2023/history/models/history_model.dart';

final historyCNProvider =
    ChangeNotifierProvider((ref) => HistoryChangeNotifier(ref));

enum LoadingState { process, success, error }

class HistoryChangeNotifier extends ChangeNotifier {
  HistoryChangeNotifier(Ref ref) : _api = ref.read(repositoryProvider);
  final HistoryRepository _api;
  final List<History> histories = [];
  LoadingState loading = LoadingState.process;

  Future<void> loadHistories() async {
    try {
      final response = await _api.getHistories();
      print(response);
      loading = LoadingState.success;
      histories.addAll(response);
    } catch (err) {
      loading = LoadingState.error;
    }
    notifyListeners();
  }
}
