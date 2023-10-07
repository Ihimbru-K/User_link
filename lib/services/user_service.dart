import 'dart:async';
import 'package:user/db_helper/repository.dart';
import 'package:user/models/user.dart';


class UserService{
  late Repository _repository;

  UserService(){
    _repository = Repository();
  }

  //save user
saveUser(User user)async{
    return await _repository.insertData('users', user.userMap());
}
//read all user records
  readAllUsersData(User user)async{
    return await _repository.readData('users');
  }

  //Edit user
  updateUser(User user)async{
    return await _repository.updateData('users', user.userMap());
  }

  //Delete user



}