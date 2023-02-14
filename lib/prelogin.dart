import 'package:flutter/material.dart';
import 'package:travelapp/mainfile1.dart';

class PreLogin extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Stack(
              fit: StackFit.expand,
              children: [
                Image.asset(
                  'images/background.jpg',
                  fit: BoxFit.cover,
                ),
                Expanded(
                  child: Container(
                    child: Text(
                      'HIDDEN\nTREASURES\nOF CEYLON',
                      style: TextStyle(
                          fontSize: 70,
                          fontStyle: FontStyle.italic,
                          fontWeight: FontWeight.bold),
                    ),
                    margin: EdgeInsets.only(top: 250, left: 20),
                  ),
                ),
                Row(
                  children: [
                    Expanded(
                      child: InkWell(
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) {
                                return MainFile1();
                              },
                            ),
                          );
                        },
                        child: Container(
                          child: CircleAvatar(
                            backgroundColor: Colors.black,
                            child: Icon(Icons.arrow_forward),
                            radius: 30,
                          ),
                          margin:
                              EdgeInsets.only(top: 660, left: 650, bottom: 10),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        child: Text(
                          'Explore Now',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              color: Colors.white),
                        ),
                        margin:
                            EdgeInsets.only(top: 680, right: 530, bottom: 30),
                      ),
                    ),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
