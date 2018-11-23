import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:path/path.dart';
import 'AddStudent.dart';
import 'Menu.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  //MyApp({Key key, @required this.items}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'GGC Student Picker',
      theme: new ThemeData(
        primarySwatch: Colors.green,
      ),
      home: new MyHome(),

    );
  }
}

class MyHome extends StatelessWidget {

//  @override
//  _ListViewState createState() => new _ListViewState();

  final List<String> items = ['A', 'D', 'C', 'B', 'E', 'H', 'I', 'G', 'F'];
  _choiceAction(String choice) {
    print('It works!');
    if (choice == Menu.addName) {
//      Navigator.push(
//          context,
//          MaterialPageRoute(builder: (context) => new AddStudent())
//      );
    }
    if (choice == Menu.sort) {
      items.sort();
      print(items);
      //setState((){});
    }
    if (choice == Menu.clear) {
      items.clear();
      print(items);
    }
    if (choice == Menu.shuffle) {
      items.shuffle();
      print(items);
    }
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("GGC Student Picker"),
        actions: <Widget>[
          PopupMenuButton(
            onSelected: _choiceAction,
            itemBuilder: (BuildContext context) {
              return Menu.choices.map((String choice) {
                return PopupMenuItem<String>(
                    value: choice, child: Text(choice));
              }).toList();
            },
          )
        ],
      ),
      body: new ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, int index) {
          new Image.asset('assets/bbuildingwavy.jpg');
          return new Dismissible(
            key: new Key(items[index]),

            onDismissed: (direction) {
              items.removeAt(index);
              Scaffold.of(context).showSnackBar(new SnackBar(
                content: new Text("Item dismissed"),
              ));
            },
            background: new Container(
              color: Colors.red,
            ),
            child: new ListTile(
              title: new Text("${items[index]}"),
              onTap: () {print('It Works!! gist ');}, //Can be used to set Hide/Unhide

            ),
          );
        },
      ),
    );
  }
}
/*class _ListViewState extends State<MyHome> {
  bool _isPresent = true;
  List<String> items = new List();

  @override
  void initState() {
    super.initState();
    setState(() {
      items.add('A');
      items.add('B');
      // ...
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(title: 'ListView State');
  }
}*/

//      routes: <String, WidgetBuilder> {
//        '/a': (BuildContext context) => AddStudent(),
/*  '/b': (BuildContext context) => MyPage(title: 'page B'),
        '/c': (BuildContext context) => MyPage(title: 'page C'),*/
//},
