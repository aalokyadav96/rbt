import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController fromController = TextEditingController();
  final TextEditingController toController = TextEditingController();
  final Dio dio = Dio();
  String result = "";

  Future<void> searchRoutes() async {
    String from = fromController.text;
    String to = toController.text;

    if (from.isEmpty || to.isEmpty) {
      setState(() => result = "Please enter both locations.");
      return;
    }

    try {
      final response = await dio.get("http://10.0.2.2:8080/search",
          queryParameters: {"from": from, "to": to});

      setState(() => result = response.data.toString());
    } catch (e) {
      setState(() => result = "Error fetching data");
    }
  }

  // Future<void> searchRoutes() async {
  //   String from = fromController.text;
  //   String to = toController.text;

  //   if (from.isEmpty || to.isEmpty) {
  //     setState(() => result = "Please enter both locations.");
  //     return;
  //   }

  //   try {
  //     final response = await dio.get("https://api.example.com/search",
  //         queryParameters: {"from": from, "to": to});

  //     setState(() => result = response.data.toString());
  //   } catch (e) {
  //     setState(() => result = "Error fetching data");
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Search Routes")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: fromController,
              decoration: const InputDecoration(labelText: "From"),
            ),
            TextField(
              controller: toController,
              decoration: const InputDecoration(labelText: "To"),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: searchRoutes,
              child: const Text("Search"),
            ),
            const SizedBox(height: 20),
            Text(result, style: const TextStyle(fontSize: 16)),
          ],
        ),
      ),
    );
  }
}
