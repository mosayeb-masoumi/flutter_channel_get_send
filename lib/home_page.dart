
import 'package:flutter/material.dart';

import 'channel.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  String strFromAndroid = "";
  int intFromAndroid = -1;

  var mapItem1 ="";
  var mapItem2 ="" ;

  List<String> list = [];

  String sentStrToAndroid = "";
  String sentIntToAndroid = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: SafeArea(
        child: SizedBox(
          width: double.infinity,
          height: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [

              /********************* get String *********************/
              ElevatedButton(onPressed: () async {
                var value = await callStringNativeMethod();
                setState(() {
                  strFromAndroid = value;
                });
              }, child: const Text("get native String")),

              Text(strFromAndroid),

              /********************* send String *********************/
              ElevatedButton(onPressed: () async {
                var value = await sendStringToNativeMethod("string from dart");
                setState(() {
                  sentStrToAndroid = value;
                });
              }, child: const Text("send String to android")),

              Text(sentStrToAndroid),


              /********************* get Int *********************/
              ElevatedButton(onPressed: () async {
                var value = await callIntNativeMethod();
                setState(() {
                  intFromAndroid= value;
                });
              }, child: const Text("get native int")),

              Text(intFromAndroid.toString()),

              /********************* send Int *********************/
              ElevatedButton(onPressed: () async {
                var value = await sendIntToNativeMethod(110);
                setState(() {
                  sentIntToAndroid= value.toString();
                });
              }, child: const Text("send int to android")),

              Text(sentIntToAndroid.toString()),



              /********************* get MAP *********************/
              ElevatedButton(onPressed: () async {
                var value = await callMapNativeMethod();
                mapItem1 = value['key1'];
                mapItem2 = value['key2'].toString();
                setState(() {

                });

              }, child: Text("get native map")),

              Text("${mapItem1} - ${mapItem2.toString()}"),


              /********************* send MAP *********************/
              ElevatedButton(onPressed: () async {

                Map<String, dynamic> mapToSend = {
                  'key1': 'value1',
                  'key2': 42,
                  // Add more key-value pairs as needed
                };
                var value = await sendMapToNativeMethod(mapToSend);

                setState(() {

                });

              }, child: Text("get native map")),

              Text("${mapItem1} - ${mapItem2.toString()}"),



              /********************* get List *********************/
              ElevatedButton(onPressed: () async {

                var dynamicList = await callListNativeMethod();
                for (var item in dynamicList) {
                  list.add(item.toString());
                }

                setState(() {
                });
              }, child: Text("get native list")),

              Text(list.isNotEmpty?"${list[0]} - ${list[1]}":"")

            ],
          ),
        ),
      ),
    );
  }

}
