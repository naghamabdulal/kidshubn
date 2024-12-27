import 'package:flutter/material.dart';
import 'dart:convert' as convert;
import 'package:http/http.dart'as http;
import 'task.dart';
import 'health.dart';
class Page2 extends StatefulWidget {
  const Page2({super.key});

  @override
  State<Page2> createState() => _Page2State();
}

class _Page2State extends State<Page2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(actions: [
        IconButton(onPressed: (){
          setState(() {
            suggestmeal();
            healthy();


          }
          );
        }, icon:Icon(Icons.refresh))
      ],
        title: Text('Baby ',style:TextStyle(fontWeight: FontWeight.bold ,color: Colors.white) ,) ,
        backgroundColor: Colors.teal,),

      body: Container(
        color: Colors.lightBlue[50],
        child:
        Column(
          children: [
            SizedBox(height: 15,),
            Text("Press  the refresh button to get new meal and some tips",style: TextStyle(color: Colors.brown,fontWeight: FontWeight.bold, fontSize: 19) ,),
            Image.asset('images/vg.png',width: 200,),

            Container(
              height: 120,
              child:showmeal(),

            ),

            Text("Some health tips",style: TextStyle(color: Colors.brown,fontWeight: FontWeight.bold, fontSize: 20) ,),
            SizedBox(height: 10,),
            Expanded(
              child:   showtips(),

            ),


          ],



        ),
      ),);
  }
}


class rec{
  String title;
  String description;

  rec(this.title, this.description);

  @override
  String toString() {
    return ' Have a you tried preparing healthy and simple meals like  $title : $description';
  }
}
List<rec>r=[];
void suggestmeal() async{
  try{
    final d =await http.get(Uri.parse('http://10.0.2.2/getrec.php'),);
    r.clear();
    if(d.statusCode==200){
      final jsonResponse = convert.jsonDecode(d.body);
      for(var row in jsonResponse){
        rec pr= rec(
            row['title'],
            row['description']);
        r.add(pr);
      }
    } }
  catch(e){
    print('xyz ${e}');
  }
}
class showmeal extends StatelessWidget {
  const showmeal({super.key});

  @override
  Widget build(BuildContext context) {

    return
      ListView.builder(
          itemCount: r.length,
          itemBuilder: (context,index){
            return
              Container(

                child:

                Text(r[index].toString(),style: TextStyle(fontWeight: FontWeight.bold, fontSize:20 , color:Colors.teal),) ,


              );
          });
  }
}


