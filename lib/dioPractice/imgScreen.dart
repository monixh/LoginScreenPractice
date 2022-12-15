import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:dio/dio.dart';

const apiKey = "32046573-d5d3b7397135ffe4209e1020b";
const pixUrl = "https://pixabay.com/api/";

class ImgScreen extends StatefulWidget {
  const ImgScreen({super.key});

  @override
  State<ImgScreen> createState() => _ImgScreenState();
}

class _ImgScreenState extends State<ImgScreen> {
  List images = [];
  @override
  void initState() {
    super.initState();
    fetchimages();
  }

  fetchimages() async {
    try {
      final dio = Dio(BaseOptions());
      final response = await dio.get(pixUrl, queryParameters: {
        "key": apiKey,
        "page": 1,
        "per_page": 50,
        "q": "birds"
      });
      final Map body = response.data;
      images = body['hits'];
      print(response.statusCode);
    } on DioError catch (e, s) {
      print(e);
      print(s);
    } catch (e, s) {
      print(e);
      print(s);
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
          itemCount: images.length,
          itemBuilder: ((context, index) {
            final image = images[index];
            return Padding(
              padding: const EdgeInsets.all(15.0),
              child: Container(
                child: Image.network(image["largeImageURL"]),
              ),
            );
          })),
    );
  }
}
