import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:http/http.dart' as Client;
import 'package:login_practice/screen/user.dart';

class JsonPrac extends StatefulWidget {
  const JsonPrac({super.key});

  @override
  State<JsonPrac> createState() => _JsonPracState();
}

class _JsonPracState extends State<JsonPrac> {
  List<Jdata> jdata = [];
  @override
  void initState() {
    super.initState();
    fetchUser();
  }

  fetchUser() async {
    try {
      final url = "https://jsonplaceholder.typicode.com/posts";
      final uri = Uri.parse(url);
      final response = await Client.get(uri);
      print(response.statusCode);
      final List decodedbody = json.decode(response.body);
      print(response.statusCode);
      setState(() {});

      jdata = decodedbody.map((item) {
        return Jdata.convert(item);
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
            itemCount: jdata.length,
            itemBuilder: ((context, index) {
              final data = jdata[index];
              return Container(
                child: Column(
                  children: [
                    Text(data.title),
                  ],
                ),
              );
            })));
  }
}
