import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:travelapp/mainfile2.dart';
import 'package:travelapp/mainfile3.dart';
import 'package:travelapp/mainfile4.dart';

class MainFile1 extends StatefulWidget {
  @override
  State<MainFile1> createState() => _MainFile1State();
}

class _MainFile1State extends State<MainFile1> {
  @override
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
        actions: [IconButton(onPressed: () async {
          Navigator.of(context).push(MaterialPageRoute(builder: (context) {
            return MainFile3();
          }),);
        }, icon: Icon(Icons.add))
        ],
        backgroundColor: Colors.amber,
      ),
      body: FutureBuilder<List<dynamic>>(
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemBuilder: (context, index) {
                return Container(
                  margin: EdgeInsets.only(left: 300, right: 300, bottom: 5),
                  height: 500,
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

                                  child: Text(
                                    snapshot.data![index]['time'].toString(),
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                Expanded(
                                    child: Text(
                                      snapshot.data![index]['price'].toString(),
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold),
                                    )),
                              ],
                            ),
                            InkWell(
                              onTap: () {
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (context) {
                                      return MainFile2(
                                          id: snapshot.data![index]['id']);
                                    },
                                  ),
                                );
                              },
                              child: Icon(
                                Icons.arrow_right,
                                size: 40,
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (context) {
                                      return MainFile4(userDetails: UserDetails(
                                        id: snapshot.data![index]['id'].toString(),
                                      image:snapshot.data![index]['avatar'],
                                      name:snapshot.data![index]['name'],
                                      time:snapshot.data![index]['time'].toString(),
                                      price:snapshot.data![index]['price'].toString(),),);
                                      },
                                  ),
                                );
                              },
                              child: Icon(
                                Icons.update,
                                size: 40,
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
    http.Response res = await http.get(
        Uri.parse('https://63fed413571200b7b7d074f5.mockapi.io/travel'));

    List<dynamic> jsonData = jsonDecode(res.body.toString());

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
              margin: EdgeInsets.all(15),
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
