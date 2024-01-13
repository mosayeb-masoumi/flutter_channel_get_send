
import 'package:flutter/services.dart';

const platform = MethodChannel("your_channel_name");

Future<String> callStringNativeMethod() async {
  try {
    String result = await platform.invokeMethod('stringNativeMethod');
    return result;
  } catch (e) {
    print('Error calling native method: $e');
    return "";
  }
}

Future<dynamic> sendStringToNativeMethod(String strFromDart) async {

  String message = strFromDart;
  try {
    String result = await platform.invokeMethod('getStringFromDart' , message);
    return result;
  } catch (e) {
    print('Error calling native method: $e');
    return "";
  }
}




Future<int> callIntNativeMethod() async {
  try {
    int result = await platform.invokeMethod('intNativeMethod');
    return result;
  } catch (e) {
    print('Error calling native method: $e');
    return 0;
  }
}

Future<String> sendIntToNativeMethod(int intFromDart) async {
  int message = intFromDart;
  try {
    String result = await platform.invokeMethod('getIntFromDart' , message);
    return result;
  } catch (e) {
    print('Error calling native method: $e');
    return "";
  }
}





Future<dynamic> callMapNativeMethod() async {
  try {
    var result = await platform.invokeMethod('mapNativeMethod');
    return result;
  } catch (e) {
    print('Error calling native method: $e');
    return "error";
  }
}


Future<String> sendMapToNativeMethod(Map<String, dynamic> mapToSend) async {

  try {String result = await platform.invokeMethod('getMapFromDart' , mapToSend);
    return result;
  } catch (e) {
    print('Error calling native method: $e');
    return "error";
  }
}


Future<dynamic> callListNativeMethod() async {
  try {
    List<dynamic> result = await platform.invokeMethod('listNativeMethod');
    return result;
  } catch (e) {
    print('Error calling native method: $e');
    return [];
  }
}


Future<dynamic> sendListToNativeMethod(List<String> list) async {
  try {
   dynamic result = await platform.invokeMethod('getListFromDart' , list);
  return result;
  } catch (e) {
    print('Error calling native method: $e');
    return "";
  }
}


