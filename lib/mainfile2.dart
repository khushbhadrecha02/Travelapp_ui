import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

class MainFile2 extends StatefulWidget {
  const MainFile2({Key? key}) : super(key: key);

  @override
  State<MainFile2> createState() => _MainFile2State();
}

class _MainFile2State extends State<MainFile2> {











  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body:FutureBuilder<dynamic>(builder:(context, snapshot){
        if(snapshot.hasData)
          {
            return Card(
              child:Row(
                children: [
                  Image.network(snapshot.data!["avatar"].toString()),
                ],
              ) ,
            );
          }
        else{
        return  CircularProgressIndicator();
        }
      },future: getOneData([in]),  ),
    );
  }
    Future<dynamic> getOneData(id) async {
    http.Response res = await http.get(Uri.parse('https://63fb07e64e024687bf70dc13.mockapi.io/travel/$id'));
      dynamic jsonData = jsonDecode(res.body.toString());
      return jsonData;
    }

}
