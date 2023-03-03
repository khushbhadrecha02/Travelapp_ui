import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class MainFile2 extends StatefulWidget {
  final dynamic id;

  MainFile2({required this.id});

  @override
  _MainFile2State createState() => _MainFile2State();
}

class _MainFile2State extends State<MainFile2> {
  late Future<Map<String, dynamic>> _detailsFuture;

  @override
  void initState() {
    super.initState();
    _detailsFuture = fetchDetailsById(widget.id);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<Map<String, dynamic>>(
        future: _detailsFuture,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final details = snapshot.data!;
            return Center(
              child: Card(
                child: Column(
                  children: [
                    Image.network('${details['avatar']}'),
                    Text(
                      '${details['name']}',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 100,
                          fontWeight: FontWeight.bold),
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Container(
                            child: Text(
                              '${details['time']}',
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
                              '${details['price']}',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ],
                    ),
                    IconButton(
                      onPressed: () async {
                        try {
                          await deleteUser('${details['id']}')
                              .then((value) => setState(() {
                                bool _isLoading = true;
                          }));
                          Navigator.pop(context);
                        } catch (e) {
                          print(e);
                        }
                      },
                      icon: Icon(Icons.delete,color: Colors.red,size: 40,),
                    )
                  ],
                ),
              ),
            );
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }

  Future<Map<String, dynamic>> fetchDetailsById(dynamic id) async {
    final response = await http.get(
        Uri.parse('https://63fed413571200b7b7d074f5.mockapi.io/travel/$id'));
    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception("Failed to fetch details");
    }
  }

  Future<void> deleteUser(dynamic id) async {
    final response = await http.delete(
      Uri.parse('https://63fed413571200b7b7d074f5.mockapi.io/travel/$id'),
      headers: {'Authorization': 'Bearer <your access tokens>'},
    );

    if (response.statusCode == 200) {
      print('record deleted sucessfully');
    } else {
      throw Exception("Failed to delete data");
    }
  }
}
