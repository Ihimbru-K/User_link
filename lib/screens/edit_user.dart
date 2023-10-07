import 'package:flutter/material.dart';



class EditUser extends StatefulWidget {
  const EditUser({Key? key}) : super(key: key);

  @override
  State<EditUser> createState() => _EditUserState();
}

class _EditUserState extends State<EditUser> {
  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
        appBar: AppBar(
          title: const Text("Edit User"),
          centerTitle: true,

        ),
        body: Container(
          padding: EdgeInsets.all(12),
          child: Column(
            children: [
              TextField(
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
                  ElevatedButton(onPressed: (){}, child: const Text("Update")),
                  const SizedBox(width: 10,),
                  ElevatedButton(onPressed: (){}, child: const Text("Reset"))
                ],)
            ],
          ),)

    );
  }
}
