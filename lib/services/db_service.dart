import 'dart:convert';
import 'package:easy_localization/easy_localization.dart';
import 'package:hive/hive.dart';
import 'package:internationalization/models/user_model.dart';

class HiveDbService {
  static var box = Hive.box("userData");

  static void saveData({required String email, required String password}) {
    try {
      box.put("email", email);
      box.put("password", password);
      print("Successfull");
    } catch (e) {
      print(e);
    }
  }

  static Map? getData() {
    try {
      String email = box.get("email");
      String password = box.get("password");
      Map mp = {"email": email, "password": password};
      return mp;
    } catch (e) {
      print(e);
    }
    return null;
  }

  static void deleteData() {
    try {
      box.delete("email");
      box.delete("password");
    } catch (e) {
      print(e);
    }
  }

  static saveObject({required String objKey, required var obj}) {
    try {
      String objString = jsonEncode(obj);
      box.put(objKey, objString);
      print("Object saved Successfully");
    } catch (e) {
      print("Object saving error: $e");
    }
  }

  static User? getObject({required String objectKey}) {
    try {
      String? userString = box.get(objectKey);
      Map<String, dynamic>? objMap = jsonDecode(userString!);
      User user = User.fromJson(map: objMap!);
      return user;
    } catch (e) {
      print("MANA: $e");
    }
    return null;
  }

  static deleteObject({required String objKey}) {
    try {
      box.delete(objKey);
      print("Deleted succesfully");
    } catch (e) {
      print(e);
    }
  }
}
