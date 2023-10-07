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
        userList.add(userModel);

      });
    });

  }

  @override
  void initState() {
    // TODO: implement initState
    getAllUsers();
    super.initState();
  }
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("SQLite CRUD App"),
        centerTitle: true,

      ),
      body: ListView.builder(
        itemCount: userList.length,

        itemBuilder: (context,index){
          return Card(
            child: ListTile(onTap: (){},
            leading: Icon(Icons.people),
              title: Text(userList[index].name ?? ''),
              subtitle: Text(userList[index].name ?? ''),
              trailing: Row(
                children: [
                  IconButton(onPressed: (){}, icon: Icon(Icons.edit)),
                  IconButton(onPressed: (){}, icon: Icon(Icons.delete)),
                ],
              ),
              
            ),

          );
        },


      ),
      floatingActionButton: FloatingActionButton(onPressed: (){},),
    );
  }
}
