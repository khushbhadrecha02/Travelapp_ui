import 'package:flutter/material.dart';

class MainFile1 extends StatelessWidget {
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
      body: Column(children: [
        Expanded(
          child: Column(
            children: [
              Expanded(
                child: Container(
                  color: Colors.orange,
                  child: Image.asset(
                    'images/img1.jpg',
                    fit: BoxFit.cover,

                  ),
                  margin: EdgeInsets.only(
                      left: 500, right: 500, top: 10, bottom: 10),
                ),
                flex: 3,
              ),
              Expanded(
                  child: Column(
                children: [
                  Expanded(
                    child: Container(
                      child: Center(
                          child: Text(
                        'Ceylon Tea Tour',
                        style: TextStyle(
                            fontSize: 30,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      )),
                    ),
                    flex: 2,
                  ),
                  Expanded(
                      child: Row(
                    children: [
                      Expanded(
                        child: Container(
                          child: Center(
                            child: Text(
                              '14 hours',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                          margin: EdgeInsets.only(left: 590),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          child: Center(
                            child: Text(
                              'Rs 60/person',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                          margin: EdgeInsets.only(right: 560),
                        ),
                      ),
                    ],
                  )),
                ],
              )),
            ],
          ),
        ),
        Expanded(
          child: Column(
            children: [
              Expanded(
                child: Container(
                  color: Colors.orange,
                  child: Image.asset(
                    'images/img2.jpg',
                    fit: BoxFit.cover,
                  ),
                  margin: EdgeInsets.only(
                      left: 500, right: 500, top: 10, bottom: 10),
                ),
                flex: 3,
              ),
              Expanded(
                  child: Column(
                children: [
                  Expanded(
                    child: Container(
                      child: Center(
                          child: Text(
                        'Dambulla Temple',
                        style: TextStyle(
                            fontSize: 30,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      )),
                    ),
                    flex: 2,
                  ),
                  Expanded(
                      child: Row(
                    children: [
                      Expanded(
                        child: Container(
                          child: Center(
                            child: Text(
                              '16 hours',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                          margin: EdgeInsets.only(left: 590),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          child: Center(
                            child: Text(
                              'Rs 70/person',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                          margin: EdgeInsets.only(right: 560),
                        ),
                      ),
                    ],
                  )),
                ],
              )),
            ],
          ),
        ),
        Expanded(
          child: Column(
            children: [
              Expanded(
                child: Container(
                  color: Colors.orange,
                  child: Image.asset(
                    'images/img3.jpg',
                    fit: BoxFit.cover,
                  ),
                  margin: EdgeInsets.only(
                      left: 500, right: 500, top: 10, bottom: 10),
                ),
                flex: 3,
              ),
              Expanded(
                  child: Column(
                children: [
                  Expanded(
                    child: Container(
                      child: Center(
                          child: Text(
                        'Old Port Galle',
                        style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      )),
                    ),
                    flex: 2,
                  ),
                  Expanded(
                      child: Row(
                    children: [
                      Expanded(
                        child: Container(
                          child: Center(
                            child: Text(
                              '15 hours',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                          margin: EdgeInsets.only(left: 590),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          child: Center(
                            child: Text(
                              'Rs 80/person',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                          margin: EdgeInsets.only(right: 560),
                        ),
                      ),
                    ],
                  )),
                ],
              )),
            ],
          ),
        ),
      ]),
      backgroundColor: Colors.orange,
    );
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
