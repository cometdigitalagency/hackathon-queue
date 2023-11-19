import 'package:flutter_test/flutter_test.dart';
import 'package:laobooking/api/lao_gov_passport_api.dart';

void main() async {
  final api = ConsularLaoApi();
  test("test api for get booking date", () async {
    final listFullPro = await api.testListFullPro();
    expect(listFullPro.statusCode, 200);
  });
  test("test api find queue", () async {
    final result = await api.testFindQueue();
    expect(result.statusCode, 200);
  });
}
