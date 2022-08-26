import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  List<Widget> todosList = <Widget>[
    ToDoWidget("Go College", "At 10 A.M be in College for lab", DateTime.now()),
    Divider(),
    ToDoWidget("Back Hostel", "At 4 P.M way back to hostel", DateTime.now()),
    Divider(),
    ToDoWidget("Go Study", "ADS", DateTime.now()),
    Divider(),
    ToDoWidget("Rest", "Take rest for sometime", DateTime.now()),
    Divider(),
    ToDoWidget("Start study again", "ADS", DateTime.now()),
    Divider(),
    ToDoWidget("Sleep", "make bed", DateTime.now()),
  ];
  @override
  Widget build(BuildContext context) {
    var navigationBarTap = (int index) {
      print(index);
    };

    var navigationBar = BottomNavigationBar(
      onTap: navigationBarTap,
      items: [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
        BottomNavigationBarItem(icon: Icon(Icons.add), label: "Add ToDo"),
      ],
    );
    return MaterialApp(
      home: Scaffold(
        bottomNavigationBar: navigationBar,
        appBar: AppBar(
          title: Text(
            "To-Do App",
            style: TextStyle(color: Colors.black),
          ),
        ),
        body: ListView(
          children: <Widget>[
            Container(child: Column(children: this.todosList))
          ],
        ),
      ),
    );
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
    var message = Expanded(
        child: SingleChildScrollView(
            child: Padding(
                padding: EdgeInsets.only(top: 10.0),
                child: Text(
                  this.message,
                  style: TextStyle(fontSize: 20.0),
                ))));

    String dateString = "Created " +
        this.date.day.toString() +
        "/" +
        this.date.month.toString() +
        "/" +
        this.date.year.toString();

    var titleController = TextEditingController(text: this.title);
    var textTitleFieldDecoration = InputDecoration(border: InputBorder.none);
    var textTitleFieldStyle = TextStyle(
        fontSize: 27.0, fontWeight: FontWeight.bold, color: Colors.black);
    var title = TextField(
      controller: titleController,
      decoration: textTitleFieldDecoration,
      style: textTitleFieldStyle,
    );

    var dateCreated = Text(dateString);

    var todoCard = Column(
      children: <Widget>[title, message, dateCreated],
      crossAxisAlignment: CrossAxisAlignment.start,
    );

    return Container(
      width: 400.0,
      height: 200.0,
      alignment: Alignment.centerLeft,
      constraints: BoxConstraints(maxHeight: 150, maxWidth: 1000.0),
      padding: EdgeInsets.all(19.0),
      child: todoCard,
    );
  }
}
