import 'package:rxdart/rxdart.dart';
import 'package:nekidaem_kanban/Services/api_client.dart';

class AuthBloc {
  final _apiClient = ApiClient();
  final _isAuthenticated = BehaviorSubject<bool>.seeded(false);

  login(String user, String password) async {
    bool response = await _apiClient.logIn(username: user, password: password);
    _isAuthenticated.sink.add(response);
  }

  Stream<bool> get isAuthenticated => _isAuthenticated.stream;

  logout() {
    _apiClient.logout();
    _isAuthenticated.sink.add(false);
  }

  dispose() {
    _isAuthenticated.close();
  }
}
