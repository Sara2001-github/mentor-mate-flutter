import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mentor_mate/constants.dart';
import 'package:mentor_mate/screens/manager/manager_home_screen.dart';
import 'package:mentor_mate/screens/manager/manager_profile_screen.dart';

class AppBottomNavBarManagerScreen extends StatefulWidget {
  const AppBottomNavBarManagerScreen({Key? key, }) : super(key: key);

  @override
  _AppBottomNavBarManagerScreenState createState() => _AppBottomNavBarManagerScreenState();
}

class _AppBottomNavBarManagerScreenState extends State<AppBottomNavBarManagerScreen> {
  int _selectedIndex = 0;
  List<Widget> _pages = [
    //  HomeScreen(),
    // BookingScreen(),
    // ProfileScreen(),

  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  getToken() async {

  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      _pages = [
       // InstructorHomeScreen(instructorId: widget.subTitle.toString(),),
        const ManagerHomeScreen(userType: "Manager",),
        const ManagerProfileScreen(userType: "Manager",),
        // VehicleScreen(userType: widget.title.toString(),),
        //    BookingScreen(userType: widget.title.toString(),),
        //    ProfileScreen(userType: widget.title.toString(),),

      ];
    });

  }



  @override
  Widget build(BuildContext context) {
    final orientation = MediaQuery.of(context).orientation;
    //getToken();
    return WillPopScope(
      onWillPop: showExitPopup,
      child: Scaffold(
        backgroundColor: Colors.white,
        body: _pages.elementAt(_selectedIndex),
        bottomNavigationBar: CupertinoTabBar(
          activeColor: Colors.white,
          inactiveColor: primaryColorLight,
          currentIndex: _selectedIndex,
          backgroundColor: primaryColor,
          iconSize: 40,
          onTap: _onItemTapped,
          items: [
            orientation == Orientation.portrait
                ? BottomNavigationBarItem(
              icon: Padding(
                padding: const EdgeInsets.only(bottom: 4),
                child: InkWell(
                  onTap: () {
                    setState(() {
                      _selectedIndex = 0;
                  //    _pages[0] = InstructorHomeScreen( instructorId: widget.subTitle,);
                    });
                  },
                  child: const Icon(
                    Icons.home_outlined,
                    size: 25,
                    //color: Color(0xFF3A5A98),
                  ),
                ),
              ),
              label: 'Home',
            )
                : BottomNavigationBarItem(
              icon: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 4),
                    child: InkWell(
                      onTap: () {
                        setState(() {
                          _selectedIndex = 0;
                          //  _pages[0] = HomeScreen();
                        });
                      },
                      child: const Icon(
                        Icons.home_outlined,
                        size: 25,
                        //color: Color(0xFF3A5A98),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  const Text(
                    'Home',
                    style: TextStyle(fontSize: 15),
                  )
                ],
              ),
            ),
            orientation == Orientation.portrait
                ? BottomNavigationBarItem(
              icon: Padding(
                padding: const EdgeInsets.only(bottom: 4),
                child: InkWell(
                  onTap: () {
                    setState(() {
                      _selectedIndex = 1;
                      // _pages[2] = ProfileScreen(userType: widget.title.toString(),);
                    });
                  },
                  child: const Icon(
                    Icons.account_circle_outlined,
                    size: 25,
                  ),
                ),
              ),
              label: 'Profile',
            )
                : BottomNavigationBarItem(
              icon: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 4),
                    child: InkWell(
                      onTap: () {
                        setState(() {
                          _selectedIndex = 1;
                          //   _pages[2] = ProfileScreen(userType: widget.title.toString(),);
                        });
                      },
                      child: const Icon(
                        Icons.account_circle_outlined,
                        size: 25,
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  const Text(
                    'Profile',
                    style: TextStyle(fontSize: 15),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
  Future<bool> showExitPopup() async {
    return await showDialog( //show confirm dialogue
      //the return value will be from "Yes" or "No" options
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Exit App'),
        content: const Text('Do you want to exit the App?'),
        actions:[
          ElevatedButton(
            style: ElevatedButton.styleFrom(
                backgroundColor: primaryColor,
                textStyle: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold)),
            onPressed: () => Navigator.of(context).pop(false),
            //return false when click on "NO"
            child:const Text('No'),
          ),

          ElevatedButton(
            onPressed: () => Navigator.of(context).pop(true),
            //return true when click on "Yes"
            style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
                textStyle: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold)),
            child:const Text('Yes'),
          ),

        ],
      ),
    )??false; //if showDialouge had returned null, then return false
  }
}
