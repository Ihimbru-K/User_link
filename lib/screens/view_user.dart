import 'package:flutter/material.dart';


class ViewUser extends StatefulWidget {
  const ViewUser({Key? key}) : super(key: key);

  @override
  State<ViewUser> createState() => _ViewUserState();
}

class _ViewUserState extends State<ViewUser> {
  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
        appBar: AppBar(
          title: const Text("Add User"),
          centerTitle: true,

        ),
        body: Container(
         // padding: EdgeInsets.all(12),
          child: Column(
            children: [
              Text("Name"),
              Text("ID"),
              Text("Contact"),
              Text("Description"),


            ],
          ),)

    );
  }
}
