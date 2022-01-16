import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rest_api_with_dio/controller/UserController.dart';
import 'package:rest_api_with_dio/screens/home_screen.dart';

void main() {
  runApp(const MyApp());

}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  final UserController userController = Get.put(UserController());

  UserController controller = UserController.to;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    controller.fetchUserList(1);
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Rest API with Dio & GetX Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        primarySwatch: Colors.blue,
      ),
      home: const HomeScreen(),
    );
  }
}

