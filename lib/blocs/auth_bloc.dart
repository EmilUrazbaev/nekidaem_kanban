import 'package:rxdart/rxdart.dart';
import 'package:nekidaem_kanban/Services/api_client.dart';

class AuthBloc {
  final _apiClient = ApiClient();
  final _authController = BehaviorSubject<ApiResponse>();
  final _isAuthenticated = BehaviorSubject<bool>.seeded(false);

  login(String user, String password) async {
    ApiResponse response = await _apiClient.logIn();
    _authController.sink.add(response);
    _isAuthenticated.sink.add(response.isAuthenticated);
  }

  Stream<bool> get isAuthenticated => _isAuthenticated.stream;

  dispose() {
    _authController.close();
    _isAuthenticated.close();
  }
}
