import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: ApiTst(),
      // debugShowCheckedModeBanner: false,
    );
  }
}

class ApiTst extends StatefulWidget {
  const ApiTst({super.key});

  @override
  State<ApiTst> createState() => _ApiTstState();
}

class _ApiTstState extends State<ApiTst> {
  List posts = [];

  Future getPost() async {
    var url = "https://jsonplaceholder.typicode.com/posts";
    var response = await http.get(Uri.parse(url));
    var responsebody = jsonDecode(response.body);
    return responsebody;
    // setState(() {
    //   posts.addAll(responsebody);
    // });
    // print(responsebody[1]);
  }

  // @override
  // void initState() {
  //   getPost();
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Dialog'),
        ), // AppBar
        body: Padding(
            padding: const EdgeInsets.all(27.0),
            child: FutureBuilder(
              future: getPost(),
              builder: ((context, snapshot) {
                if (snapshot.hasData) {
                  return ListView.builder(
                      itemCount: snapshot.data.length,
                      itemBuilder: (context, index) {
                        return Container(
                          color: Colors.white,
                          margin: EdgeInsets.only(top: 10, bottom: 10),
                          child: Text("${snapshot.data[index]['id']}"),
                        );
                      });
                }
                return CircularProgressIndicator();
              }),
            )));
  }
}
