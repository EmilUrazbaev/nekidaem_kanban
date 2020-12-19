import 'package:flutter/material.dart';
import 'package:nekidaem_kanban/models/Tickets.dart';

import 'ticket_tile.dart';

class TicketsListview extends StatelessWidget {
  final List<Ticket> tickets;
  TicketsListview({this.tickets});
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (ctx, index) {
        return TicketTile(
            id: tickets[index].id.toString(), text: tickets[index].text);
      },
      itemCount: tickets.length,
    );
  }
}
