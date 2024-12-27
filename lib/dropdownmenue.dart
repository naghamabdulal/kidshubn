import 'package:flutter/material.dart';

import 'activity.dart';


class dropdownmenue extends StatefulWidget {
  final Function(Actiivity) updateact;



  const dropdownmenue({super.key , required this.updateact});

  @override
  State<dropdownmenue> createState() => _dropdownmenueState();
}

class _dropdownmenueState extends State<dropdownmenue> {




  @override
  Widget build(BuildContext context) {
    return DropdownMenu(


      width: 300,

      dropdownMenuEntries: acts.map((e)=>
          DropdownMenuEntry(value: e, label: e.toString())).toList(),
      initialSelection: acts[0],
      onSelected: (abc){
        widget.updateact(abc as Actiivity);
      },

    );
  }
}


