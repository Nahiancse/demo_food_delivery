import 'package:flutter/material.dart';


class SplashScreen extends StatefulWidget {
   SplashScreen({this.name,this.phone,this.adress});
  String? name;
  String? phone;
  String? adress;

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with TickerProviderStateMixin {
 
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
            Text('Name: ${widget.name!}',style: TextStyle(fontSize:25,fontWeight: FontWeight.bold),),
            SizedBox(height:5),
            Text('Phone: ${widget.phone!}',style: TextStyle(fontSize:25,fontWeight: FontWeight.bold),),
            SizedBox(height:5),
            Text('Address: ${widget.adress!}',style: TextStyle(fontSize:25,fontWeight: FontWeight.bold),),
          ],),
        )
      ),
    );
  }
}

