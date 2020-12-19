import 'package:flutter/material.dart';
import 'package:nekidaem_kanban/blocs/auth_bloc.dart';

import 'package:nekidaem_kanban/blocs/kanban_bloc.dart';
import 'package:nekidaem_kanban/blocs/login_bloc.dart';
import 'package:provider/provider.dart';

import 'Screens/auth_screen.dart';
import 'Screens/kanban_screen/kanban_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  //final KanbanBloc kanbanBloc = KanbanBloc();

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider(
          create: (_) => LoginBloc(),
        ),
        Provider(
          create: (_) => KanbanBloc(),
        ),
        Provider(
          create: (_) => AuthBloc(),
        )
      ],
      child: MaterialApp(
        title: 'Kanban NeKidaem',
        theme: ThemeData(
          brightness: Brightness.dark,
        ),
        home: KanbanScreen(),
        // Consumer<AuthBloc>(builder: (context, _authBloc, _) {
        //   return StreamBuilder(
        //       stream: _authBloc.isAuthenticated,
        //       builder: (context, snapshot) {
        //         if (snapshot.data) {
        //           return KanbanScreen();
        //         } else {
        //           return AuthScreen();
        //         }
        //       });
        // }),
      ),
    );
  }
}
