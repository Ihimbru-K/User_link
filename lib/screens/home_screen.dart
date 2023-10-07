import 'package:flutter/material.dart';
import 'package:user/models/user.dart';
import 'package:user/services/user_service.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  late List<User> userList = <User>[];
  final userService = UserService();
  
  getAllUsers()async{
    var users = await userService.readAllUsersData();
    userList = <User>[];
    users.forEach((user){
      setState(() {
        var userModel = User();
        userModel.id = user['id'];
        userModel.name = user['name'];
        userModel.contact = user['contact'];
        userModel.description = user['description'];

      });
    });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("SQLite CRUD App"),
        centerTitle: true,

      ),
      body: Container(

      ),
    );
  }
}
