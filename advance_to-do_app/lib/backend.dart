// import 'dart:async';
// import 'package:flutter/material.dart';
// import 'package:path/path.dart';
// import 'package:sqflite/sqflite.dart';
// import 'modelclass.dart';
// import 'main.dart';


// dynamic database;
// void insertDatainTodo(TodoClass obj)async{
//   Database localDB=await database;
//   await localDB.insert(
//     "Todo",
//     obj.todoData(),
//     conflictAlgorithm: ConflictAlgorithm.replace,
//   );
// }
// void updateDatainCustomer(TodoClass obj)async{
//   Database localDB=await database;
//   await localDB.update(
//     "Todo",
//     obj.todoData(),
//     where: "id=?",
//     whereArgs:[obj.id],
//   );
// }
// void deleteDatainCustomer(int idforDelete)async{
//   Database localDB=await database;
//   await localDB.delete(
//     "Todo",
//     where: "id=?",
//     whereArgs: [idforDelete],
//   );

// }
//  Future getCustomerData(int idfrogetdata,String str)async{
//   Database localDB=await database;
//   String data=(await localDB.query(
//     "Todo",
//     where: "id=? " ,
//     whereArgs: [idfrogetdata],
//     columns: [str]

//   )) as String;
//   return  await data;
// }
// void main()async{

//   WidgetsFlutterBinding.ensureInitialized();

//   database=openDatabase(
//     join(await getDatabasesPath(),"TodoDB.db"),
//     version: 1,
//     onCreate:(db, version)async =>{
//       await db.execute(
//         '''
//           CREATE TABLE Todo(
//             id INTEGER PRIMARY KEY AUTOINCREMENT,
//             title TEXT ,
//             description TEXT,
//             date TEXT
//           )
//         '''
//       ),
//     },
//   );

 

//   // print(getCustomerData());

//   // obj1=TodoClass(title:"Gauri",description:"Hi",date: "Complete");
//   // updateDatainCustomer(obj1);

//   // print(getCustomerData());

//   // deleteDatainCustomer(obj1.id!);

//   // print(getCustomerData());
// }


