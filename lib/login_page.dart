import 'package:flutter/material.dart';
import 'package:internationalization/services/db_service.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  Map? mp;

  void saveData() {
    String myEmail = emailController.text.trim();
    String myPassword = passwordController.text.trim();

    HiveDbService.saveData(email: myEmail, password: myPassword);
  }

  void getData() {
    setState(() {
      mp = HiveDbService.getData();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login Page'),
        centerTitle: true,
        backgroundColor: Colors.green,
      ),
      body: Center(
        child: Column(
          children: [
            const SizedBox(
              height: 50,
            ),
            TextField(
              controller: emailController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Email',
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            TextField(
              controller: passwordController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Password',
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () {
                saveData();
              },
              style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
              child: const Text(
                "SAVE",
                style: TextStyle(fontSize: 40, color: Colors.white),
              ),
            ),
            SizedBox(
              height: 50,
            ),
            ElevatedButton(
              onPressed: () {
                getData();
              },
              style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
              child: const Text(
                "GET",
                style: TextStyle(fontSize: 40, color: Colors.white),
              ),
            ),
            Text(
              mp?["email"] ?? "empty",
              style: TextStyle(fontSize: 30),
            ),
            Text(
              mp?["password"] ?? "empty",
              style: TextStyle(fontSize: 30),
            ),
          ],
        ),
      ),
    );
  }
}
