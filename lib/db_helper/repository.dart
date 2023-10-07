
import 'database_connection.dart';
import 'package:sqflite/sqflite.dart';

class Repository{

  late DatabaseConnection _databaseConnection;
  Repository(){
    _databaseConnection = DatabaseConnection();
}

static Database? _database;
  Future<Database?> get database async {
    if (database != null) {
      return _database;
    } else {
      _database = await _databaseConnection.setDatabase();
      return _database;
    }
  }

  //inserting user data
  insertData(table, data) async{
    var connection = await database;
    return await connection!.insert(table, data);
  }

  //read user data records

readData(table) async{
    var connection = await database;
    return await connection!.query(table);
}

//read a single record
readDataById(table, id) async{
    var connection = await database;
    return await connection!.query(table,where : 'id=?', whereArgs: [id]);
}

//Update Data

updateData(table, data)async{
    var connection = await database;
    return await connection!.update(table, data, where: 'id=?', whereArgs: [data['id']]);
}


//Delete data by id

deleteDataById(table, id) async{
    var connection = await database;
    return await connection!.rawDelete("DELETE from $table WHERE id=$id"); 
}
}