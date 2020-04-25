import 'package:flutter/material.dart';
//import 'package:http/http.dart';
import 'dart:convert';
import 'package:userapp/API.dart';
import 'package:userapp/models/User.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  build(context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'My Http App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyListScreen(),
    );
  }
}

class MyListScreen extends StatefulWidget {
  @override
  createState() => _MyListScreenState();
}

class _MyListScreenState extends State {
  var users = new List<User>();

  _getUsers() {
    API.getUsers().then((response) {
      setState(() {
        Iterable list = json.decode(response.body);
        users = list.map((model) => User.fromJson(model)).toList();
      });
    });
  }

  initState() {
    super.initState();
    _getUsers();
  }

  dispose() {
    super.dispose();
  }

  @override
  build(context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("User List"),
        ),
        body: ListView.builder(
          itemCount: users.length,
          itemBuilder: (context, index) {
            return ListTile(
                leading: CircleAvatar(
                    backgroundImage: NetworkImage(
                        'https://res.cloudinary.com/djxdnzlej/image/upload/v1554376001/pp.jpg')),
                title: Text(users[index].name),
                subtitle: Text(users[index].email));
          },
        ));
  }
}
