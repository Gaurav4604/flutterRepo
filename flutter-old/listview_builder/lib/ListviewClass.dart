import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:listview_builder/DataClass.dart';

class ListViewClass extends StatefulWidget {
  @override
  _ListViewClassState createState() => _ListViewClassState();
}

class _ListViewClassState extends State<ListViewClass> {

  List<DataClass> data=[];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      appBar: NewBar(),
      body: Padding(
        padding: EdgeInsets.fromLTRB(0,15,0,0),
        child: ListView.builder(
            itemCount: data.length,
            itemBuilder: (context,index){
              return Container(
                child: Card(
                  color: Colors.grey[800],
                  child: Column(
                    children: <Widget>[
                      ListTile(
                        leading: Icon(Icons.assignment_late,
                        color: data[index].priority,
                        ),
                        onTap: () async{
                          dynamic result= await Navigator.pushNamed(context,"textInput",arguments: {
                            "state": "Update",
                            "index": index,
                            "value": data[index].value,
                            "title":data[index].name,
                            "priority":data[index].priority
                          });
                          switch(result["context"]) {
                            case "Update":
                              setState(() {
                                data[index].name = result["title"];
                                data[index].value = result["value"];
                                data[index].priority = DataClass.bleh(result["priority"]);
                              });
                              break;
                            case "Edited":
                              setState(() {
                                int val=result["VAL"];
                                data.removeAt(val);
                              });
                              break;
                        }
                        },
                        title: Text(data[index].name,
                        style: TextStyle(
                          color: Colors.blue,
                              fontWeight: FontWeight.bold,
                          ),
                        ),
                        subtitle: Text(data[index].showcase(),
                          style: TextStyle(
                              color: Colors.lightGreen
                          ),
                        ),
                        trailing: IconButton(
                            icon: Icon(Icons.delete),
                            onPressed: (){
                              setState(() {
                                data.removeAt(index);
                              });
                            }),
                      ),
                    ],
                  ),
                ),
              );
            },
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          setState(() async{
          dynamic result= await Navigator.pushNamed(context,"textInput",arguments: {
              "state": "Add"
            });
          switch(result["context"]){
            case "Not Edited":
              break;
            case "Add":
              setState(() {
                data.add(DataClass(value: result["value"],name: result["title"],priority: DataClass.bleh(result["priority"])));
              });
              break;
          }
          });
        },
        backgroundColor: Colors.lightGreenAccent,
        child: Icon(
          Icons.add,
          color: Colors.grey[900],
        ),
      ),
    );
  }
}

class NewBar extends AppBar {
   NewBar({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text("NoteList",
      style: TextStyle(
        color: Colors.grey[900]
      ),
      ),
      centerTitle: true,
      elevation: 0,
      backgroundColor: Colors.lightGreenAccent,
    );
  }
}
