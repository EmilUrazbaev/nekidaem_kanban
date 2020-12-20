import 'package:flutter/material.dart';
import 'package:nekidaem_kanban/blocs/auth_bloc.dart';
import 'package:nekidaem_kanban/blocs/kanban_bloc.dart';
import 'package:nekidaem_kanban/Screens/kanban_screen/tickets_listview.dart';
import 'package:nekidaem_kanban/models/Tickets.dart';
import 'package:provider/provider.dart';

class KanbanScreen extends StatefulWidget {
  @override
  _KanbanScreenState createState() => _KanbanScreenState();
}

class _KanbanScreenState extends State<KanbanScreen>
    with SingleTickerProviderStateMixin {
  KanbanBloc _kanbanBloc;
  AuthBloc _authBloc;
  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    _kanbanBloc = Provider.of<KanbanBloc>(context);
    _authBloc = Provider.of<AuthBloc>(context);
    _kanbanBloc.getTickets();
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          bottom: TabBar(
            tabs: [
              Tab(text: 'On Hold'),
              Tab(text: 'In progress'),
              Tab(text: 'Needs Revision'),
              Tab(text: 'Approved'),
            ],
          ),
          title: Text('Kanban'),
          backgroundColor: Colors.grey[850],
          actions: [
            MaterialButton(
              onPressed: () {
                _authBloc.logout();
              },
              color: Colors.cyanAccent,
              textColor: Colors.white,
              child: Icon(
                Icons.arrow_back,
                size: 24,
              ),
              padding: EdgeInsets.all(16),
              shape: CircleBorder(),
            )
          ],
        ),
        body: Consumer<KanbanBloc>(
          builder: (context, _kanbanBloc, _) {
            return StreamBuilder<List<Ticket>>(
              stream: _kanbanBloc.subject.stream,
              initialData: [],
              builder: (context, snapshot) {
                return TabBarView(
                  children: [
                    TicketsListview(
                      tickets:
                          snapshot.data.where((f) => f.row == '0').toList(),
                    ),
                    TicketsListview(
                      tickets:
                          snapshot.data.where((f) => f.row == '1').toList(),
                    ),
                    TicketsListview(
                      tickets:
                          snapshot.data.where((f) => f.row == '2').toList(),
                    ),
                    TicketsListview(
                      tickets:
                          snapshot.data.where((f) => f.row == '3').toList(),
                    ),
                  ],
                );
              },
            );
          },
        ),
      ),
    );
  }
}
