import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:woody_app/Screens/pageview_1.dart';
import 'package:woody_app/demo/api_service.dart';
import 'all_appointments_page.dart';
import 'const.dart';

class HomePage extends StatefulWidget {
  // static final pageName = '/HomePage';

  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentIndex = 0;
  final List<Widget> tabs = [
    PageView1(),
    AllAppointments(),
    Center(child: Text('Page 1')),
  ];

  void _p() async {
    print(await APIService().getAccessToken());
    print(await APIService().getPersonID());
  }

  @override
  Widget build(BuildContext context) {
    _p();
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          elevation: 0.0,

          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(15),
                bottomRight: Radius.circular(15)),
          ),
          // toolbarHeight: 100,
          title: Padding(
            padding: const EdgeInsets.only(top: 10.0),
            child: Image.asset(
              imagePath,
              height: 50,
            ),
          ),
          centerTitle: true,
          actions: [
            currentIndex == 2
                ? GestureDetector(onTap: () {}, child: Padding(
                  padding: const EdgeInsets.only(right: 20.0),
                  child: Center(child: Text('Sign out')),
                ))
                : Text('')
          ],
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(70),
            child: Padding(
              padding: const EdgeInsets.only(bottom: 25.0),
              child: Text(getPageTile(currentIndex),
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 30.0,
                      fontWeight: FontWeight.bold)),
            ),
          ),
        ),
        body: tabs[currentIndex],
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: primaryColor,
          onTap: (value) {
            currentIndex = value;
            print('$value');
            setState(() {});
            // Respond to item press.
          },
          items: [
            BottomNavigationBarItem(
              label: '',
              icon: Icon(
                Icons.home,
                size: 40,
                color: Colors.white,
              ),
            ),
            BottomNavigationBarItem(
              label: '',
              icon: Icon(
                CupertinoIcons.calendar,
                size: 40,
                color: Colors.white,
              ),
            ),
            BottomNavigationBarItem(
              label: '',
              icon: Icon(
                Icons.account_circle_sharp,
                size: 40,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }

  String getPageTile(int pageIndex) {
    switch (pageIndex) {
      case 0:
        return "Service My Woody";
      case 1:
        return "Appointments";
      case 2:
        return "profile";
      default:
        return "Undefined index";
    }
  }
}

// String getTab()
