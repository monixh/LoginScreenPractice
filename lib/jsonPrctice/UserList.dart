import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:http/http.dart' as Client;
import 'package:login_practice/jsonPrctice/userProperty.dart';

class UserList extends StatefulWidget {
  const UserList({super.key});

  @override
  State<UserList> createState() => _UserListState();
}

class _UserListState extends State<UserList> {
  List<User> user = [];
  @override
  void initState() {
    super.initState();
    getUser();
  }

  getUser() async {
    try {
      final url = "https://jsonplaceholder.typicode.com/users";
      final uri = Uri.parse(url);
      final response = await Client.get(uri);
      setState(() {});

      final List decodebody = json.decode(response.body);
      print(response.statusCode);
      user = decodebody.map((item) {
        return User.convert(item);
      }).toList();
    } catch (e, s) {
      print(e);
      print(s);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView.builder(
          itemCount: user.length,
          itemBuilder: ((context, index) {
            final data = user[index];
            return Padding(
              padding: const EdgeInsets.all(15.0),
              child: Container(
                child: Column(
                  children: [
                    Text(data.name),
                    Text(data.email),
                    Text(data.username),
                    Text(data.address.geo.lat),
                    Text(data.address.geo.lang)
                  ],
                ),
              ),
            );
          })),
    );
  }
}
