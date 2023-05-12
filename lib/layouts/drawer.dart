import 'package:flutter/material.dart';
import 'package:flutter_application/pages/authpage.dart';

class SideDrawer extends StatelessWidget {
  const SideDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.85, //20.0,
      child: Drawer(
          child: ListView(
        children: <Widget>[
          const DrawerHeader(
            decoration: BoxDecoration(
                color: Colors.orange,
                borderRadius:
                    BorderRadius.vertical(bottom: Radius.circular(20))),
            child: Center(
                child: Text(
              "Login to see detail!",
              style: TextStyle(fontSize: 40),
            )),
          ),
          ListTile(
            title: const Text(
              'Others',
              style: TextStyle(
                fontSize: 30,
                shadows: [Shadow(color: Colors.black, offset: Offset(0, -5))],
                color: Colors.transparent,
                decoration: TextDecoration.underline,
                decorationColor: Colors.black,
                decorationThickness: 3,
              ),
            ),
            onTap: () {
              /*Navigator.pop(context);
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const Auth()));*/
            },
          ),
          ListTile(
            title: const Text(
              'Creps',
              style: TextStyle(
                fontSize: 30,
                shadows: [Shadow(color: Colors.black, offset: Offset(0, -5))],
                color: Colors.transparent,
                decoration: TextDecoration.underline,
                decorationColor: Colors.black,
                decorationThickness: 3,
              ),
            ),
            onTap: () {
              /*Navigator.pop(context);
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const Auth()));*/
            },
          ),
          ListTile(
            title: const Text(
              'Contact Us',
              style: TextStyle(
                fontSize: 30,
                shadows: [Shadow(color: Colors.black, offset: Offset(0, -5))],
                color: Colors.transparent,
                decoration: TextDecoration.underline,
                decorationColor: Colors.black,
                decorationThickness: 3,
              ),
            ),
            onTap: () {
              /*Navigator.pop(context);
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const Auth()));*/
            },
          ),
        ],
      )),
    );
  }
}
