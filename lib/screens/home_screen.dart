import 'dart:js_interop_unsafe';

import 'package:flutter/material.dart';
import 'package:user/models/user.dart';
import 'package:user/screens/add_user.dart';
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

  _showSnackBar(String message){
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content : Text(message)),);
  }

  _deleteDataDialog(BuildContext context, userId){
    return showDialog(
      context: context,
      builder: (param){
        return AlertDialog(
          title: Text("Are you sure you want to delete it?"),
          actions: [
            ElevatedButton(onPressed: () async{
              var result = await userService.deleteUser(userId);
              setState(() {
                if(result != null){
                  Navigator.pop(context);
                  getAllUsers();
                  _showSnackBar("User has been deleted!");
                }
              });

            }, child: Text("Delete")),
            ElevatedButton(onPressed: (){Navigator.pop(context);}, child: Text("Cancel"))
          ],
        );
      }
    );
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
              trailing: SizedBox(
                width: 150,
                child:  Row(
                children: [
                  IconButton(onPressed: (){}, icon: Icon(Icons.edit)),
                  IconButton(onPressed: (){
                    _deleteDataDialog(context, userList[index].id);
                  }, icon: Icon(Icons.delete)),
                ],
              ),)
              
            ),

          );
        },


      ),
      floatingActionButton: FloatingActionButton(onPressed: (){
        Navigator.push(context, MaterialPageRoute(builder: (context)=>AddUser()),);
      },

        child: const Icon(Icons.add),
      ),
    );
  }
}
