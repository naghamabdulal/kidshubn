import 'package:flutter/material.dart';
import 'dropdownmenue.dart';
import 'textfeild.dart';
import 'activity.dart';
import 'page2.dart';
import 'task.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}


class _HomeState extends State<Home> {

  Actiivity current=acts[0];
  String unit="ml";
  double totalWater = double.parse(acts[0].getWater());
  double x=0 ,r=0;



  void updateweight(kg){

    x=double.parse(kg);


  }

  void Updateresult() {
    setState(() {
      if (x == 0) {
        r = 0;
      }
      if (x != 0 && unit == 'mL') {
        r = totalWater + (x * 35);
      }
      else if (x != 0 && unit == 'L') {
        r = (totalWater + (x * 35)) / 1000;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(actions: [
        IconButton(onPressed: (){
          setState(() {

            tasks();

          }
          );
        }, icon:Icon(Icons.refresh))
      ],
        backgroundColor: Colors.teal,
        title:

        Image.asset(
          'images/l.png',
          width: 400,
          height: 110,
        ),
      ),

      body:Container(
        color: Colors.lightBlue[50],
        child:   Center(
          child: Column( children: [
            SizedBox(height: 30,),
            Text('Child Water  Calculator',  style: TextStyle( fontSize: 20 ,fontWeight:FontWeight.bold,
                color:Colors.teal)),
            SizedBox(height: 20,),
            SizedBox(width: 300,
              height: 100,
              child:textfeild(f: updateweight, hint:  'Enter child weight(kg)',)
              ,
            ),

            Text(" Add activity level",
                style: TextStyle( fontSize: 20 ,fontWeight:FontWeight.bold,
                    color:Colors.teal)
            ),
            SizedBox(height: 10),

            dropdownmenue(updateact: (k){
              this.current=k;
              totalWater=double.parse(k.getWater());
            },

            ),
            SizedBox(height: 20),




            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Unit: '),
                Radio<String>(
                  value: 'mL',
                  groupValue: unit,
                  onChanged: (value) {
                    setState(() {
                      unit = value!;
                    });
                  },
                ),
                Text('milliter'),
                Radio<String>(
                  value: 'L',
                  groupValue: unit,
                  onChanged: (value) {
                    setState(() {
                      unit = value!;
                    });
                  },
                ),
                Text('Liter'),
              ],
            ),
            SizedBox(height: 20,),
            SizedBox(width:160,
              child:    ElevatedButton(onPressed:(){Updateresult();  }, child:
              Icon(Icons.water_drop,  size: 30),

              ),),


            SizedBox(height: 13),
            Text('the child need drink $r $unit',style: TextStyle(fontSize: 20 ,fontWeight:FontWeight.bold,
                color:Colors.teal),
            ),

            SizedBox(height: 13),
            Text("A Baby Start Drinkig water at 6 months",style: TextStyle(fontSize: 17 ,fontWeight:FontWeight.bold,
                color:Colors.green),
            ),
            SizedBox(height: 16),

            Text("Click refresh button to suggest a task for child",style: TextStyle(fontSize: 19 ,fontWeight:FontWeight.bold,
                color:Colors.brown),

            ),
            SizedBox(height: 20,),
            Container(
              height: 100,
              child:showtask(),

            ),

            ElevatedButton
              (
              onPressed: (){
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => Page2()));

              },
              child: Text("Next "),
            ),

          ],


          ),
        ),


      ),
    );
  }
}
