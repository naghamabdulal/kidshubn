import 'dart:convert' as convert;
import 'package:flutter/material.dart';

import 'package:http/http.dart'as http;

class health{
  String category;
  String description;

  health(this.category, this.description);

  @override
  String toString() {
    return ' $category : $description}';
  }
}

List<health> p=[];
void healthy() async{
  try{
    final r =await http.get(Uri.parse('http://10.0.2.2/health.php'));
    p.clear();
    if(r.statusCode==200){
      final jsonResponse = convert.jsonDecode(r.body);
      for(var row in jsonResponse){
        health pr= health(
            row['category'],
            row['description']);
        p.add(pr);
      }
    } }
  catch(e){
    print('xyz ${e}');
  }
}

class showtips extends StatelessWidget {
  const showtips({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: p.length,
        itemBuilder: (context,index){
          return Container(
            color: index %2 ==0 ?Colors.green[100]: Colors.green[50],
            padding: const EdgeInsets.all(9),
            child: Text(p[index].toString(), style: TextStyle(color: Colors.teal,fontWeight: FontWeight.bold ,fontSize: 15),),
          );
        });
  }
}