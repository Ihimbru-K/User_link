import 'package:flutter/material.dart';
import 'package:user/services/user_service.dart';



class AddUser extends StatefulWidget {
  const AddUser({Key? key}) : super(key: key);

  @override
  State<AddUser> createState() => _AddUserState();
}

class _AddUserState extends State<AddUser> {

  TextEditingController nameController = TextEditingController();
  TextEditingController contactController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();


  var _userService = UserService();


  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add User"),
        centerTitle: true,

      ),
      body: Container(
        padding: EdgeInsets.all(12),
        child: Column(
        children: [
          TextField(
            controller: nameController,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10)

              ),
              hintText: "Enter name",
              labelText: "Name"
            ),
          ),
          SizedBox(height: screenHeight*0.08,),
          TextField(
            controller: contactController,
            decoration: InputDecoration(
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10)

                ),
                hintText: "Enter Contact",
                labelText: "Contact"
            ),
          ),
          SizedBox(height: screenHeight*0.08,),
          TextField(
            controller: descriptionController,
            decoration: InputDecoration(
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10)

                ),
                hintText: "Enter Description",
                labelText: "Description"
            ),
          ),
          SizedBox(height: screenHeight*0.08,),
          Row(mainAxisAlignment: MainAxisAlignment.center,
            children: [
            ElevatedButton(onPressed: (){}, child: const Text("Save")),
            const SizedBox(width: 10,),
            ElevatedButton(onPressed: (){}, child: const Text("Reset"))
          ],)
        ],
      ),)

    );
  }
}
