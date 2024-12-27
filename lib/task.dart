import 'dart:convert' as convert;
import 'package:flutter/material.dart';

import 'package:http/http.dart'as http;
class task{
  String category;
  String description;

  task(this.category, this.description);

  @override
  String toString() {
    return ' $category : $description';
  }
}

List<task> p=[];
void tasks() async{
  try{
    final r =await http.get(Uri.parse('http://10.0.2.2/task.php'));
    p.clear();
    if(r.statusCode==200){
      final jsonResponse = convert.jsonDecode(r.body);
      for(var row in jsonResponse){
        task pr= task(
            row['category'],
            row['description']);
        p.add(pr);
      }
    } }
  catch(e){
    print('xyz ${e}');
  }
}

class showtask extends StatelessWidget {
  const showtask({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: p.length,
        itemBuilder: (context,index){
          return Container(
            color:Colors.green[50],
            child: Text(p[index].toString(), style: TextStyle(color: Colors.teal,fontWeight: FontWeight.bold ,fontSize: 20),),
          );
        });
  }
}
