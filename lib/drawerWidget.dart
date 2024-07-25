import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:techviz/homeView.dart';

Widget drawer(BuildContext context) {

  return Drawer(
    child: Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(
          color: Colors.grey,
          width: 1.0,
        ),
      ),
      child: Column(
        children: <Widget>[
        Container( width: 500,
            child:  DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.blue[300]
            ),
            child: Row(
                children:<Widget>
            [ Icon(Icons.face_2,size: 32),
              Text(
              ' User',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
              ),
            )]
            ),
          )),
          Expanded(
            child: ListView(
              padding: EdgeInsets.zero,
              children: <Widget>[
                ListTile(
                  leading: Icon(Icons.home),
                  title: Text('Home'),
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                ),
                ListTile(
                  leading: Icon(Icons.settings),
                  title: Text('Settings'),
                  onTap: () {
                    Fluttertoast.showToast(
                      msg: "Under Process Settings",
                      toastLength: Toast.LENGTH_SHORT,
                      gravity: ToastGravity.BOTTOM,
                      timeInSecForIosWeb: 1,
                      backgroundColor: Colors.black38,
                      textColor: Colors.white,
                      fontSize: 16.0,
                    );
                  },
                ),
              ],
            ),
          ),
          ListTile(
            leading: Icon(Icons.battery_5_bar_sharp),
            title: LinearProgressIndicator(
              value: 0.3,
              minHeight: 10,
              backgroundColor: Colors.grey[300],
              valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
            ),

            onTap: () {
              Navigator.of(context).pop(); // Close the drawer
            },
          ),
          ListTile(
            leading: Icon(Icons.logout),
            title: Text('Logout'),
            onTap: () {
              Navigator.of(context).pop(); // Close the drawer
            },
          ),
          ListTile(
            leading: Icon(Icons.headset_mic),
            title: Text('Help & Support'),
            onTap: () {

            },
          )
        ],
      ),
    ),
  );
}


