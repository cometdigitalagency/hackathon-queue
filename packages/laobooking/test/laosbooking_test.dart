import 'package:flutter_test/flutter_test.dart';
import 'package:laobooking/api/lao_gov_passport_api.dart';

void main() async {
  final laoGovApi = LaoGovApi();
  test("test api for get booking date", () async {
    final listFullPro = await laoGovApi.testListFullPro();
    expect(listFullPro.statusCode, 200);
  });
  test("test app find queue", () async {
    final test_findQueue = await laoGovApi.testFindQueue();
    expect(test_findQueue.statusCode, 200);
  });
}
