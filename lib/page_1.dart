import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:internationalization/core/constants/app_strings.dart';
import 'package:internationalization/models/user_model.dart';
import 'package:internationalization/services/db_service.dart';

class Page1 extends StatefulWidget {
  const Page1({super.key});

  @override
  State<Page1> createState() => _Page1State();
}

class _Page1State extends State<Page1> {
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  String? firstName;
  String? lastName;
  String? email;
  String? password;

  void save() {
    String firstName = firstNameController.text.trim();
    String lastName = lastNameController.text.trim();
    String email = emailController.text.trim();
    String password = passwordController.text.trim();

    User user = User(
      firstName: firstName,
      lastName: lastName,
      email: email,
      password: password,
    );
    HiveDbService.saveObject(objKey: "user", obj: user);
    firstNameController.clear();
    lastNameController.clear();
    emailController.clear();
    passwordController.clear();
  }

  void getUser() {
    User? user = HiveDbService.getObject(objectKey: "user");
    setState(() {
      firstName = user?.firstName ?? "www";
      lastName = user?.lastName ?? "WWW";
      email = user?.email ?? "WWW";
      password = user?.password ?? "WWW";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text(
          AppStrings.appName.tr(),
          style: const TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: SizedBox(
        width: double.infinity,
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 30,
              ),
              SizedBox(
                width: 300,
                child: TextField(
                  controller: firstNameController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'First name',
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                width: 300,
                child: TextField(
                  controller: lastNameController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Last name',
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                width: 300,
                child: TextField(
                  controller: emailController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Email',
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                width: 300,
                child: TextField(
                  controller: passwordController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Last name',
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                onPressed: () {
                  save();
                },
                style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
                child: const Text(
                  "SAVE",
                  style: TextStyle(fontSize: 40, color: Colors.white),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              ElevatedButton(
                onPressed: () {
                  getUser();
                },
                style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
                child: const Text(
                  "GET DATA",
                  style: TextStyle(fontSize: 40, color: Colors.white),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                onPressed: () {
                  HiveDbService.deleteObject(objKey: "user");
                },
                style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
                child: const Text(
                  "DELETE DATA",
                  style: TextStyle(fontSize: 40, color: Colors.white),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Text(
                firstName ?? "emty",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 40,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                lastName ?? "empty",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 40,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                email ?? "empty",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 40,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                password ?? "empty",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 40,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
