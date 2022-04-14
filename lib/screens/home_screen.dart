import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_image_slider/carousel.dart';

class HomeScreen extends StatefulWidget {
  static const String screenRoute = 'HomeScreen';
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _firestore = FirebaseFirestore.instance;
  final _auth=FirebaseAuth.instance;
  late User signedInUser;
  @override
  void initState() {
    super.initState();
    getCurrentUser();
  }
  void getCurrentUser(){

    try{
      final user=_auth.currentUser;
      if(user!=null){
        signedInUser=user;
        print(signedInUser.email);

      }

    } catch(e){
      print(e);
    }
  }
 // void getRequest()async{
   // final requests=await _firestore.collection("request").get();
    //for(var request in requests.docs){
    //  print(request.data());
    //}
  //}
  void requestsStreams()async{
    await for (var snapshot in _firestore.collection("request").snapshots()){
      for(var request in snapshot.docs){
        print(request.data());
      }
    }
  }
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: _firestore.collection("request").snapshots(),
      builder: (context, snapshot) {
        List<Widget> requestsWidgets=[];
        if(!snapshot.hasData){
          //add here spinner
        }
        final requests=snapshot.data!.docs;
        for(var request in requests){
          final name=request.get("name");
          final bloodType=request.get("bloodType");
          final contact=request.get("contact");
          final localisation=request.get("location");
          final note=request.get("note");
          final date=request.get("date");
          final sender=request.get("sender");
          final requestWidget=Card(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                 ListTile(
                   trailing: Icon(Icons.bloodtype,size: 30,color: Color.fromARGB(255, 155, 36, 27),),
                   contentPadding: EdgeInsets.symmetric(vertical: 0.0, horizontal:
                   16.0),
                   dense:true,
                  leading: const Icon(Icons.person,
                    color:  Color.fromARGB(255, 155, 36, 27),
                  size: 30,),
                  title: const Text(
                    'Patient Name',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                      color: Colors.grey,
                    ),
                  ),
                  subtitle: Text(
                    '$name',
                    style: const TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                 ListTile(
                   trailing:Text(
                     '$bloodType ',
                     style: const TextStyle(
                       fontSize: 28,
                       fontWeight: FontWeight.bold,
                     ),
                   ) ,
                   contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal:
                   16.0),
                   dense:true,

                  leading:const  Icon(Icons.location_on,
                    color:  Color.fromARGB(255, 155, 36, 27),
                    size: 30,
                  ),
                  title: const Text(
                    'Location',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                      color: Colors.grey,
                    ),
                  ),
                  subtitle: Text(
                    '$localisation',
                    style: const TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                ListTile(
                  trailing: Text('$note',
                    style:const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  contentPadding: EdgeInsets.symmetric(vertical: 0.0, horizontal:
                  16.0),
                  dense:true,
                  leading:const  Icon(Icons.contact_mail_rounded,
                    color:  Color.fromARGB(255, 155, 36, 27),
                    size: 30,
                  ),
                  title: const Text(
                    'Contact',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                      color: Colors.grey,
                    ),
                  ),
                  subtitle: Text(
                    '$contact',
                    style: const TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),

              ],
            ),
          );
          requestsWidgets.add(requestWidget);
        }
        Size size = MediaQuery.of(context).size;

        return Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 5,
                vertical: 10,
              ),
              child: Container(
              decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              ),
                  height: size.height * 0.25,
                  width: size.width,
                  child: Carousel(
                    indicatorBarColor: Colors.transparent,
                    autoScrollDuration: Duration(seconds: 2),
                    animationPageDuration: Duration(milliseconds: 500),
                    activateIndicatorColor: Colors.red,
                    animationPageCurve: Curves.easeInOut,
                    indicatorBarHeight: 40,
                    indicatorHeight: 10,
                    indicatorWidth: 20,
                    unActivatedIndicatorColor: Colors.grey,
                    //stopAtEnd: true,
                    autoScroll: true,
                    // widgets
                    items: [
                      Padding(
                        padding: const EdgeInsets.only(left: 8),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            image: const DecorationImage(
                              image: AssetImage("assets/images/2b.jpg"),
                              fit: BoxFit.fill,
                            ),
                          ),

                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            image: const DecorationImage(
                              image: AssetImage("assets/images/1b.png"),
                              fit: BoxFit.fill,
                            ),


                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 8),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            image: const DecorationImage(
                              image: AssetImage("assets/images/3b.png"),
                              fit: BoxFit.fill,
                            ),


                          ),
                        ),
                      ),
                    ],
                  ),
              ),
            ),

            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(top: 20),
                child: ListView(
                  shrinkWrap: true,
                  padding: EdgeInsets.symmetric(
                    horizontal: 10,
                  ),
                  children: requestsWidgets,
                ),
              ),
            ),
          ],
        );
      }
    );
  }
}
