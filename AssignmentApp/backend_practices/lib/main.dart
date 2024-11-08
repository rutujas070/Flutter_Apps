
import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'modelclass.dart';
//import 'main.dart';


dynamic database;
void insertDatainCustomer(CustomerClass obj)async{
  Database localDB=await database;
  await localDB.insert(
    "Customer",
    obj.customerData(),
    conflictAlgorithm: ConflictAlgorithm.replace,
  );
}
void updateDatainCustomer(CustomerClass obj)async{
  Database localDB=await database;
  await localDB.update(
    "Customer",
    obj.customerData(),
    where: "id=?",
    whereArgs:[obj.id],
  );
}
void deleteDatainCustomer(CustomerClass obj)async{
  Database localDB=await database;
  await localDB.delete(
    "Customer",
    where: "id=?",
    whereArgs: [obj.id],
  );

}
Future getCustomerData()async{
  Database localDB=await database;
  List<Map<String,dynamic>> data=await localDB.query("Customer",);
  return data;
}
void main()async{

  WidgetsFlutterBinding.ensureInitialized();

  database=openDatabase(
    join(await getDatabasesPath(),"CustomerDB.db"),
    version: 1,
    onCreate:(db, version)async =>{
      await db.execute(
        '''
          CREATE TABLE Customer(
            id INT PRIMARY KEY,
            nameOfCustomer TEXT,
            billAmount INT,
            billStatus TEXT
          )
        '''
      ),
    },
  );
 print("************Insert***************");
  CustomerClass obj1=CustomerClass(id:1,nameOfCustomer:"Rutuja",billAmount: 100,billStatus: "Complete");
  CustomerClass obj2=CustomerClass(id:2,nameOfCustomer:"Gauri",billAmount: 5000,billStatus: "Pending");
  insertDatainCustomer(obj1);
  insertDatainCustomer(obj2);

  print(await getCustomerData());
  print("************Update***************");
 obj2=CustomerClass(id:2,nameOfCustomer:"Gauri",billAmount:5000,billStatus: "Complete");
  updateDatainCustomer(obj2);

  print(await getCustomerData());

  deleteDatainCustomer(obj1);
 print("************Delete***************");
 print( await getCustomerData());
}