import 'package:flutter/material.dart';

class TicketTile extends StatelessWidget {
  final String id;
  final String text;

  TicketTile({this.id, this.text});
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Card(
        color: Colors.grey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding:
                  const EdgeInsets.only(top: 8, left: 8, right: 8, bottom: 4),
              child: Text(
                'ID:$id',
                style: TextStyle(color: Colors.white),
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.only(top: 4, left: 8, right: 8, bottom: 8),
              child: Text(
                text,
                style: TextStyle(color: Colors.white),
              ),
            )
          ],
        ),
      ),
    );
  }
}
