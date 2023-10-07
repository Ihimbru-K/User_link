import 'package:flutter/material.dart';



class AddUser extends StatefulWidget {
  const AddUser({Key? key}) : super(key: key);

  @override
  State<AddUser> createState() => _AddUserState();
}

class _AddUserState extends State<AddUser> {
  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: Text("SQLite CRUD App"),
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
            ElevatedButton(onPressed: (){}, child: const Text("Save")),
            const SizedBox(width: 10,),
            ElevatedButton(onPressed: (){}, child: const Text("Save"))
          ],)
        ],
      ),)

    );
  }
}
