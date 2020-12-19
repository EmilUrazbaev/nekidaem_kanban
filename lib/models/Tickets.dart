import 'dart:convert';

class Ticket {
  int id;
  String row;
  int seqNum;
  String text;

  Ticket({this.id, this.row, this.seqNum, this.text});

  Ticket.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    row = json['row'];
    seqNum = json['seq_num'];
    text = json['text'];
  }

  static List<Ticket> fromJsonArray(String jsonString) {
    List<dynamic> dynamicList = jsonDecode(jsonString);
    List<Ticket> tickets = List<Ticket>();
    dynamicList.forEach((f) {
      Ticket s = Ticket.fromJson(f);
      tickets.add(s);
    });

    return tickets;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['row'] = this.row;
    data['seq_num'] = this.seqNum;
    data['text'] = this.text;
    return data;
  }
}
