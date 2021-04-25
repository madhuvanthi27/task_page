import 'package:flutter/material.dart';


class task extends StatefulWidget {
  //static int index;
  task();

  @override
  _task createState() => _task();
}

class _task extends State<task> {

  GlobalKey<FormState> _formState = GlobalKey<FormState>();
  DateTime selectedData;

  Future<void> showInfoDialog(BuildContext context) async{
    return await showDialog(
    context: context,
    builder: (context){
      final TextEditingController _textController = TextEditingController();
      var rating = 0.0;
      bool isChecked = false;
      return StatefulBuilder(builder: (context, setState){
        return AlertDialog(
        content: SingleChildScrollView(
          scrollDirection: Axis.vertical,
        child:  Form(
          key: _formState,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextFormField(
                controller: _textController,
                
                validator: (value){
                  return value.isNotEmpty ? null : "Cannot be Empty";
                },
                decoration: InputDecoration(
                  //hintText: "Enter Task",
                  labelText: "Edit Task *"
                ),
              ),

            Container(
              height: 20.0,
            ),

            Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Completion Slider",
                    style: TextStyle(
                      fontSize: 15.5,
                    ),
                  ),
                Slider(
                  value: rating, 
                  onChanged: (newRating){
                    setState(() => rating = newRating);                
                  },
                  divisions: 4,
                  label: "$rating",
                ),
              ],
            ),

            Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Mark as done"),
                  Checkbox(value: isChecked, onChanged: (checked){
                    setState(() {
                      isChecked = checked;
                    });
                    
                  })
                ],
              ),
            ],            
          )
          ),
        ),
        actions: <Widget>[
          TextButton(
            child: Text("OK"),
            onPressed: (){
              if(_formState.currentState.validate()){
                Navigator.of(context).pop();
              }    
          },)
        ],
      );
      });
    });
  }
  @override
  Widget build(BuildContext context) {
    var tasks = ['Work on backened for login and signup', 'Work on backend for chat section'];
    var due = ['02/05/2021', '03/05/2021'];
      return Container(
        color: Colors.white,
        child: ListView.builder(
      itemCount: tasks.length,
      itemBuilder: (context, index){
        return Card(          
          child: ListTile(
            title: Text(tasks[index]),            
            subtitle: Text("DUE: " + due[index]),
            onTap: () async{
              await showInfoDialog(context);
            },
          ),
        );
      }
    )
  );
  }
}