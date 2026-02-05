import 'package:flutter/material.dart';
import 'package:frontend/Services/Api.dart';
import 'package:frontend/models/Person_modal.dart';

class Display extends StatefulWidget {
  const Display({super.key});

  @override
  State<Display> createState() => _DisplayState();
}

class _DisplayState extends State<Display> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.blueAccent, Colors.greenAccent],
                ),
              ),
            ),

            Container(
              child: FutureBuilder(
                future: Api.getPerson(),
                builder: (BuildContext context,AsyncSnapshot snapshot){
                if(snapshot.hasData){
                  List<Person>pdata=snapshot.data;
                  return ListView.builder(
                    itemCount: pdata.length,
                    itemBuilder: (context,index){
                    return ListTile(
                      leading: Icon(Icons.person_2_rounded),
                      title: Text("Name: ${pdata[index].name}"),
                      subtitle: Text("Name: ${pdata[index].phone}"),
                      trailing: Text("Name: ${pdata[index].age}"),
                    );
                  });
                }else{
                  return Center(
                    child: Text("No data Found",
                    style: TextStyle(
                      fontSize: 20
                    ),
                    ),
                  );
                }
              }),
            )
           
            
          ],
        ),
      ),
    );
  }
}