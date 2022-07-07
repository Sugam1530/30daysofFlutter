import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final imageUrl = "https://s3-ap-southeast-1.amazonaws.com/tv-prod/member/photo/7212145-large.jpeg";
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            padding: EdgeInsets.zero,
            child: UserAccountsDrawerHeader(
              margin: EdgeInsets.zero,
              decoration: BoxDecoration(
                color: Colors.deepPurple,
              ),
              accountName: Text("Sugam Das", textScaleFactor: 1.2,),
              accountEmail: Text("sugamdas1530@gmail.com", textScaleFactor: 1.2,),
              currentAccountPicture: CircleAvatar(
              backgroundImage: NetworkImage(imageUrl),
              ),
            ),
            ),
            ListTile(
              leading: Icon(CupertinoIcons.home),
              title: Text("Home", textScaleFactor: 1.2,),
            ),
            ListTile(
              leading: Icon(CupertinoIcons.profile_circled),
              title: Text("Profile", textScaleFactor: 1.2,),
            ), 
            ListTile(
              leading: Icon(CupertinoIcons.mail),
              title: Text("Email", textScaleFactor: 1.2,),
            ),
        ],
      ),
    );
  }
}