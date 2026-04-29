import 'api_service.dart';

class ApiServiceImpl implements ApiService {
  @override

  @override
  Future<void> postData(String endpoint, Map<String, dynamic> data) async {
    await Future.delayed(const Duration(seconds: 1));
    print('Posted data to $endpoint: $data');
  }
}
