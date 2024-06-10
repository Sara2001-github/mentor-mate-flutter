

import 'package:flutter/material.dart';
import 'package:mentor_mate/constants.dart';
import 'package:mentor_mate/firebase_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';


class TraineeProfileScreen extends StatefulWidget {
  final String userType;
  const TraineeProfileScreen({super.key, required this.userType});

  @override
  State<TraineeProfileScreen> createState() => _TraineeProfileScreenState();
}

class _TraineeProfileScreenState extends State<TraineeProfileScreen> {
  String userType = "";
  String email = "";
  String uid = "";
  String name = "";
  final MethodsHandler _methodsHandler = MethodsHandler();

  getData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (prefs.getString('userType') != null) {
      setState(() {
        userType = prefs.getString('userType')!;
        email = prefs.getString('userEmail')!;
        uid = prefs.getString('userId')!;
        name = prefs.getString('userName')!;
      });
    } else {
    }
  }


  @override
  void initState() {
    super.initState();
    userType = '';
    email = '';
    uid = '';
    getData();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Column(
        children: [
          Container(
              width: size.width,
              height: size.height*0.35,
              decoration: const BoxDecoration(
                // borderRadius: BorderRadius.only(bottomRight: Radius.circular(0), bottomLeft: Radius.circular(50)),
                gradient: LinearGradient(begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  stops: [
                    0.1,
                    0.9
                  ], colors: [

                    primaryColor,
                    primaryColorLight,
                  ],
                ),
              ),
              child: Column(children: [
                Padding(
                  padding:  EdgeInsets.only(top: size.height*0.03),
                  child: SizedBox(
                    height: size.height*0.08,
                    width: size.width,
                    child: Stack(
                      alignment: Alignment.centerRight,

                      children: [
                        SizedBox(
                            width: size.width,
                            height: size.height*0.08,
                            child: const Center(
                              child: Text('Profile',
                                style: TextStyle(color: Colors.white, fontSize: 16,fontWeight: FontWeight.bold),
                              ),
                            )),
                      ],),

                  ),
                ),

                SizedBox(
                  height: size.height*0.01,
                ),

                SizedBox(
                    width: size.width,
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CircleAvatar(
                          radius: 50,
                          backgroundImage: AssetImage( 'assets/images/coffee_header.jpeg'),
                        ),
                      ],
                    )),

                SizedBox(
                  height: size.height*0.02,
                ),

                SizedBox(
                    width: size.width,
                    child: Center(
                      child: Text(name == '' ? (widget.userType) : name,
                        style: const TextStyle(color: Colors.white, fontSize: 16,fontWeight: FontWeight.bold),
                      ),
                    )),


                SizedBox(
                  height: size.height*0.01,
                ),

                SizedBox(
                    width: size.width,
                    child: Center(
                      child: Text(email == '' ? 'trainer@gmail.com' : email,
                        style: const TextStyle(color: Colors.white, fontSize: 13,fontWeight: FontWeight.w400),
                      ),
                    )),





              ],)
          ),


          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 4,bottom: 4,left: 10,right: 10),
            child: ListTile(
              shape: RoundedRectangleBorder( //<-- SEE HERE
                side: const BorderSide(width: 1,color: Colors.white),
                borderRadius: BorderRadius.circular(10),
              ),

              tileColor: Colors.white,
              leading: Container(
                decoration: BoxDecoration(
                  color: secondaryColor.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(8),
                ),
                width: 30,
                height: 30,//devSize.height*0.05,
                child: const Icon(Icons.logout, color: Colors.red,),
              ),
              trailing: const Icon(
                Icons.arrow_forward_ios, color: Colors.black,size: 15,
              ),
              title:  const Text('Logout', style: TextStyle(
                  color: textColor,
                  fontWeight: FontWeight.w500
              )),
              onTap: () async {
                // Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>UserType()));
                _methodsHandler.signOut(context);

              },
            ),
          ),
          const SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }
}
