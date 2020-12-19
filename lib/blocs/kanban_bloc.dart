import 'package:rxdart/rxdart.dart';
import 'package:nekidaem_kanban/Services/api_client.dart';
import 'package:nekidaem_kanban/models/Tickets.dart';

class KanbanBloc {
  final ApiClient _apiClient = ApiClient();
  final BehaviorSubject<List<Ticket>> _ticketsController =
      BehaviorSubject<List<Ticket>>();

  getTickets() async {
    List<Ticket> response = await _apiClient.getTickets();
    _ticketsController.sink.add(response);
  }

  dispose() {
    _ticketsController.close();
  }

  BehaviorSubject<List<Ticket>> get subject => _ticketsController;
}
