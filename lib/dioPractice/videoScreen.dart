import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:dio/dio.dart';

final url =
    "https://pixabay.com/api/videos/?key=32046573-d5d3b7397135ffe4209e1020b&q=yellow+flowers";

class VideoScreen extends StatefulWidget {
  const VideoScreen({super.key});

  @override
  State<VideoScreen> createState() => _VideoScreenState();
}

class _VideoScreenState extends State<VideoScreen> {
  List videos = [];
  @override
  void initState() {
    super.initState();
    fetchVideos();
  }

  fetchVideos() async {
    try {
      final dio = Dio(BaseOptions());
      final response = await dio.get(url);
      final Map body = response.data;
      videos = body['hits'];
      print(response.statusCode);
      setState(() {});
    } catch (e, s) {
      print(e);
      print(s);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
          itemCount: videos.length,
          itemBuilder: ((context, index) {
            final video = videos[index];
            return Container(
              child: Image.network(video['userImageURL']),
            );
          })),
    );
  }
}
