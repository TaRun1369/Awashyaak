// import 'package:flutter/material.dart';
//
import 'package:flutter/material.dart';

import '../../screens/dashboard.dart';
import '../../screens/notifications.dart';
import 'my_drawer_header.dart';

class MyDrawer extends StatefulWidget {
  final String email;
  const MyDrawer({required this.email});
  @override
  _MyDrawerState createState() => _MyDrawerState();
}

// class _MyHeaderDrawerState extends State<MyHeaderDrawer> {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       color: Colors.green[700],
//       width: double.infinity,
//       height: 200,
//       padding: EdgeInsets.only(top: 20.0),
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           Container(
//             margin: EdgeInsets.only(bottom: 10),
//             height: 70,
//             decoration: BoxDecoration(
//               shape: BoxShape.circle,
//               image: DecorationImage(
//                 image: AssetImage('assets/images/profile.jpg'),
//               ),
//             ),
//           ),
//
//           Text(
//             widget.email,
//             style: TextStyle(
//               color: Colors.grey[200],
//               fontSize: 20,
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

// class MyHeaderDrawer extends StatefulWidget {
//   @override
//   _HomePageState createState() => _HomePageState();
// }

class _MyDrawerState extends State<MyDrawer> {
  var currentPage = DrawerSections.dashboard;

  @override
  Widget build(BuildContext context) {
    var container;
    if (currentPage == DrawerSections.dashboard) {
      container = DashboardPage();
    } else if (currentPage == DrawerSections.notifications) {
      container = NotificationsPage();
    }
    return Drawer(
        child: SingleChildScrollView(
      child: Container(
        child: Column(
          children: [
            MyHeaderDrawer(),
            MyDrawerList(),
          ],
        ),
      ),
    ));
  }

  Widget MyDrawerList() {
    return Container(
      padding: EdgeInsets.only(
        top: 15,
      ),
      child: Column(
        // shows the list of menu drawer
        children: [
          menuItem(1, "Dashboard", Icons.dashboard_outlined,
              currentPage == DrawerSections.dashboard ? true : false),
          menuItem(2, "Notifications", Icons.notifications_outlined,
              currentPage == DrawerSections.notifications ? true : false),
          Divider(),
          menuItem(3, "Privacy policy", Icons.privacy_tip_outlined,
              currentPage == DrawerSections.privacy_policy ? true : false),
          menuItem(4, "Send feedback", Icons.feedback_outlined,
              currentPage == DrawerSections.send_feedback ? true : false),
          Divider(),
          menuItem(5, "Logout", Icons.privacy_tip_outlined,
              currentPage == DrawerSections.Logout ? true : false),
        ],
      ),
    );
  }

  Widget menuItem(int id, String title, IconData icon, bool selected) {
    return Material(
      color: selected ? Colors.grey[300] : Colors.transparent,
      child: InkWell(
        onTap: () {
          Navigator.pop(context);
          setState(() {
            if (id == 1) {
              currentPage = DrawerSections.dashboard;
            } else if (id == 2) {
              currentPage = DrawerSections.notifications;
            } else if (id == 3) {
              currentPage = DrawerSections.privacy_policy;
            } else if (id == 4) {
              currentPage = DrawerSections.send_feedback;
            } else if (id == 5) {
              currentPage = DrawerSections.Logout;
              Navigator.pop(context);
            }
          });
        },
        child: Padding(
          padding: EdgeInsets.all(15.0),
          child: Row(
            children: [
              Expanded(
                child: Icon(
                  icon,
                  size: 20,
                  color: Colors.black,
                ),
              ),
              Expanded(
                flex: 3,
                child: Text(
                  title,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

enum DrawerSections {
  dashboard,
  notifications,
  privacy_policy,
  send_feedback,
  Logout
}
