import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  List<Widget> todosList = <Widget>[
    ToDoWidget(
      "Make Bed",
      "Remeber to tuck in the sheets",
      DateTime.now(),
    ),
    Divider(),
    ToDoWidget(
      "Walk Dog",
      "Remember to pick up milk",
      DateTime.now(),
    ),
    Divider(),
    ToDoWidget(
      "Vaccum",
      "rememeber to get behind the furniture",
      DateTime.now(),
    ),
    Divider(),
    ToDoWidget(
      "Play Piano",
      "Let's get that music Learned",
      DateTime.now(),
    )
  ];

  @override
  Widget build(BuildContext context) {
    var onNavigationBarTap = (int index) {
      print(index);
    };

    var bottomNavigationBar = BottomNavigationBar(
      onTap: onNavigationBarTap,
      items: [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: "Todos"),
        BottomNavigationBarItem(icon: Icon(Icons.add), label: "Add Todos")
      ],
    );

    return MaterialApp(
        home: Scaffold(
            bottomNavigationBar: bottomNavigationBar,
            appBar: AppBar(title: Text("To-Do List")),
            body: ListView(
              children: <Widget>[
                Container(child: Column(children: this.todosList))
              ],
            )));
  }
}

class ToDoWidget extends StatefulWidget {
  final String title;
  final String message;
  final DateTime date;

  ToDoWidget(this.title, this.message, this.date);

  @override
  State<StatefulWidget> createState() {
    return ToDoState(this.title, this.message, this.date);
  }
}

class ToDoState extends State<ToDoWidget> {
  String title;
  String message;
  DateTime date;

  ToDoState(this.title, this.message, this.date);

  @override
  Widget build(BuildContext context) {
    String dateString = "Created " +
        this.date.day.toString() +
        "/" +
        this.date.month.toString() +
        "/" +
        this.date.year.toString();

    var message = Expanded(
        child: SingleChildScrollView(
            child: Padding(
                padding: EdgeInsets.only(top: 10.0),
                child: Text(
                  this.message,
                  style: TextStyle(fontSize: 20.0),
                ))));

    var titleController = TextEditingController(text: this.title);

    var textTitleFieldDecoration = InputDecoration(border: InputBorder.none);

    var textTitleFieldStyle = TextStyle(
        fontSize: 27.0, fontWeight: FontWeight.bold, color: Colors.black);

    var title = TextField(
      controller: titleController,
      decoration: textTitleFieldDecoration,
      style: textTitleFieldStyle,
    );

    var dateCreated =
        Padding(padding: EdgeInsets.only(top: 10.0), child: Text(dateString));

    var todoCard = Column(
      children: <Widget>[title, message, dateCreated],
      crossAxisAlignment: CrossAxisAlignment.start,
    );

    return Container(
        width: 400.0,
        height: 200.0,
        alignment: Alignment.centerLeft,
        constraints: BoxConstraints(maxHeight: 200.0, maxWidth: 1000.0),
        padding: EdgeInsets.all(19.0),
        child: todoCard);
  }
}
