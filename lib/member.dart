import 'package:flutter/material.dart';
import 'customDialogTask.dart';

class members extends StatelessWidget {
  //static int index;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: toDos(context));
  }
}
Widget toDos(BuildContext context){
  var members = ['Madhu', 'Swa', 'Ganesh', 'Avinash'];
  //var due = ['02/05/2021', '03/05/2021'];
  var listView = ListView.builder(
    itemCount: members.length,
    itemBuilder: (context, index){
      return Card(
        child: ListTile(
          title: Text(members[index]),
          //subtitle: Text("DUE: " + due[index]),
          onTap: (){
            Navigator.push(context, MaterialPageRoute(builder: (context) => task()),
              );
          }
        ),
       
        );
      

    }
    );
    return listView;
}
