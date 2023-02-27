import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:travelapp/mainfile2.dart';

class MainFile1 extends StatefulWidget {
  @override
  State<MainFile1> createState() => _MainFile1State();
}

class _MainFile1State extends State<MainFile1> {
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: SideDrawer(),
      appBar: AppBar(
        title: Column(
          children: [
            Container(
              child: CircleAvatar(
                backgroundImage: AssetImage(
                  'images/profile.jpg',
                ),
              ),
              margin: EdgeInsets.only(left: 1345),
            ),
          ],
        ),
        backgroundColor: Colors.amber,
      ),
      body: FutureBuilder<List<dynamic>>(
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemBuilder: (context, index) {
                return Container(
                  margin: EdgeInsets.only(left: 300, right: 300, bottom: 5),
                  height: 440,
                  width: 100,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Card(
                        child: Column(
                      children: [
                        Image.network(
                          snapshot.data![index]['avatar'].toString(),
                          height: 300,
                          width: 440,
                          fit: BoxFit.cover,
                        ),
                        Text(
                          snapshot.data![index]['name'].toString(),
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 40,
                              fontWeight: FontWeight.bold),
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: Container(
                                child: Text(
                                  snapshot.data![index]['time'].toString(),
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                            Expanded(
                                child: Container(
                              child: Text(
                                snapshot.data![index]['price'].toString(),
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold),
                              ),
                              margin: EdgeInsets.only(left: 140),
                            )),
                          ],
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) {
                                  return MainFile2();
                                },
                              ),
                            );
                          },
                          child: Icon(
                            Icons.arrow_right,
                            size: 45,
                          ),
                        ),
                      ],
                    )),
                  ),
                );
              },
              itemCount: snapshot.data!.length,
            );
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
        future: getTravelData(),
      ),
    );
  }

  Future<List<dynamic>> getTravelData() async {
    http.Response res = await http
        .get(Uri.parse('https://63fb07e64e024687bf70dc13.mockapi.io/travel'));
    List<dynamic> jsonData = jsonDecode(res.body.toString());
    return jsonData;
  }

  Future<dynamic> getOneData(id) async {
    http.Response res = await http.get(
        Uri.parse('https://63fb07e64e024687bf70dc13.mockapi.io/travel/$id'));
    dynamic jsonData = jsonDecode(res.body.toString());
    return jsonData;
  }
}

class SideDrawer extends StatelessWidget {
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.amber,
      child: Column(
        children: [
          ListTile(
            title: Container(
              child: Center(
                child: RotatedBox(
                  quarterTurns: 3,
                  child: Text('Places',
                      style: TextStyle(fontSize: 20, color: Colors.white)),
                ),
              ),
              margin: EdgeInsets.all(20),
            ),
          ),
          ListTile(
            title: Container(
              child: Center(
                child: RotatedBox(
                  quarterTurns: 3,
                  child: Text(
                    'Accomodation',
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                ),
              ),
              margin: EdgeInsets.all(15),
            ),
          ),
          ListTile(
            title: Container(
              child: Center(
                child: RotatedBox(
                  quarterTurns: 3,
                  child: Text(
                    'Group tours',
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              margin: EdgeInsets.all(15),
            ),
          ),
          ListTile(
            title: Container(
              child: Center(
                child: RotatedBox(
                  quarterTurns: 3,
                  child: Text(
                    'Individual tours',
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                ),
              ),
              margin: EdgeInsets.all(15),
            ),
          ),
          ListTile(
            title: Container(
              child: Center(
                child: RotatedBox(
                  quarterTurns: 3,
                  child: Text(
                    'Activities',
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                ),
              ),
              margin: EdgeInsets.all(15),
            ),
          ),
        ],
      ),
    );
  }
}
