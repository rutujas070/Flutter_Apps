import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:frontend/models/Person_modal.dart';
import 'package:http/http.dart' as http;

class Api{

  //Post
  static addPerson(Map pData) async{
    print(pData);
    var url = Uri.parse("http://192.168.1.75:3000/api/add_person");
    try{
      final res=await http.post(url,body: pData);
      if(res.statusCode==200){
        //
        var data=jsonDecode(res.body.toString());
        print(data);
      }else{
        //
        print("#########Fail to upload Data");
      }
    }catch(e){
      debugPrint(e.toString());
    }
  }

  //Get 

  static getPerson()async{
    List<Person>person=[];
    var url = Uri.parse("http://192.168.1.75:3000/api/get_person");
  
    try{
      final res=await http.get(url);
      if(res.statusCode==200){
        var data=jsonDecode(res.body);
        print(data);
        data['Person']?.forEach((value){
          person.add(Person(
            value['pName'], 
            value['pPhone'],
            value['pAge']
            ));
        });
        return person;
      }else{
        return [];
      }
    }catch(e){
      debugPrint(e.toString());
    }
  }
}