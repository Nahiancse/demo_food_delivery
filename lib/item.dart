import 'package:flutter/material.dart';

import 'im.dart';

class MyApps extends StatefulWidget {
  const MyApps({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}
class _MyAppState extends State<MyApps> {
  TextEditingController nameC=TextEditingController();
  TextEditingController phoneC=TextEditingController();
  TextEditingController addressC=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.blueGrey,
        appBar: AppBar(
          title:  Text('Modal Bottom Sheet'),
          backgroundColor: Colors.black38,
        ),
        body: Builder(
          builder: (context) {
            return Center(
              child: ElevatedButton(
                child: Text('SEE OPTIONS'),
                onPressed: () {
                  showModalBottomSheet(
                    context: context,
                    builder: (context) {
                      return Wrap(
                        children: [
                          ListTile(
                            leading: Icon(Icons.shopping_bag),
                            title: Text('Order'),
                            trailing: IconButton(icon: Icon(Icons.edit),onPressed: (){
                                   showDialog(
                context: context,
                builder: (ctx) => AlertDialog(
                  title: Text("Order Details"),
                  content: Column(
                    children: [
                      TextField(decoration: InputDecoration(  
    border: OutlineInputBorder(),  
    // labelText: 'Enter Name',  
    hintText: 'Enter Your Name'  
  ),  controller: nameC,),SizedBox(height:5),
                      TextField(decoration: InputDecoration(  
    border: OutlineInputBorder(),  
    // labelText: 'Enter Name',  
    hintText: 'Enter Your Phone'  
  ),  controller: phoneC,),SizedBox(height:5),
                      TextField(decoration: InputDecoration(  
    border: OutlineInputBorder(),  
    // labelText: 'Enter Name',  
    hintText: 'Enter Your Address'  
  ),  controller: addressC,),
                      
                    ],
                  ),
                  actions: <Widget>[
                    Row(
                      mainAxisAlignment:MainAxisAlignment.center,
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context){
                              return SplashScreen( name: nameC.text,phone:phoneC.text ,adress:addressC.text ,);

                            }));
                          },
                          child: Text("Confirm"),
                        ),
                      ],
                    ),
                  ],
                ),
              );
                            },),
                          ),
                          ListTile(
                            leading: Icon(Icons.watch),
                            title: Text('ABCD'),
                            trailing: Icon(Icons.lock_clock)
                          ),
                          ListTile(
                            leading: Icon(Icons.copy),
                            title: Text('EFGH'),
                            trailing: Icon(Icons.lock_clock)
                          ),
                          ListTile(
                            leading: Icon(Icons.copy),
                            title: Text('IJKL'),
                            trailing: Icon(Icons.lock_clock)
                          ),
                         
                        ],
                      );
                    },
                  );
                },
              ),
            );
          },
        ),
      );
    
  }
}