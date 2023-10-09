import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:listview_builder/DataClass.dart';

class TextInput extends StatefulWidget {
  @override
  _TextInputState createState() => _TextInputState();
}

class _TextInputState extends State<TextInput> {

  Map data={};
  List<bool> isSelectedList=[true,false,false];
  List<IconData> IconList=[Icons.check_box,Icons.check_box_outline_blank,Icons.check_box_outline_blank];
  TextEditingController txt1=TextEditingController();
  TextEditingController txt2=TextEditingController();
  String str1,str2;
  Color tickVal=Colors.red;
  int PriorityIndex=0;
  int counter=0;
  int retuner(Color val){
    if(val==Colors.red)
      return 0;
    if(val==Colors.orange)
      return 1;
    if(val==Colors.lightGreenAccent)
      return 2;
  }

  @override
  Widget build(BuildContext context) {

    data=ModalRoute.of(context).settings.arguments;
    String titleVal=data["state"].toString()=="Add"?"Add New Note":"Edit Note";
    if(titleVal!="Add New Note"&&counter==0){
    txt1.text=str1=data["title"];
    txt2.text=str2=data["value"];
    PriorityIndex=retuner(data["priority"]);
    for(int i=0;i<isSelectedList.length;i++){
      if(i==PriorityIndex){
        IconList[i]=Icons.check_box;
        tickVal=data["priority"];
        isSelectedList[i]=true;
      }
      else{
        IconList[i]=Icons.check_box_outline_blank;
        isSelectedList[i]=false;
        }
      }
    counter++;
    }

    return GestureDetector(
      onTap: (){
        FocusScopeNode scopeNode=FocusScope.of(context);
        if(!scopeNode.hasPrimaryFocus)
            scopeNode.unfocus();
      },
      child: Scaffold(
        backgroundColor: Colors.grey[900],
        appBar: AppBar(
          iconTheme: IconThemeData(
            color: Colors.grey[900]
          ),
          title: Text(titleVal,
          style: TextStyle(
            color: Colors.grey[900],
            ),
          ),
          centerTitle: true,
          backgroundColor: Colors.lightGreenAccent,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(10,20,10,0),
            child: Column(
              children: <Widget>[
                TextField(
                  controller: txt1,
                  onChanged: (text) {
                    str1=text;
                    print(text);
                  },
                  style: TextStyle(
                    color: Colors.white
                  ),
                  maxLength: 50,
                  cursorColor: Colors.lightGreenAccent,
                  decoration: InputDecoration(
                    counterStyle: TextStyle(
                        color: Colors.blue
                    ),
                    border: OutlineInputBorder(),
                    labelText: 'Title',
                    hintText: 'Enter Title',
                    hintStyle: TextStyle(
                      color: Colors.grey[500]
                    ),
                    labelStyle: TextStyle(
                      color: Colors.lightGreenAccent
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.lightGreenAccent
                      )
                    )
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                TextField(
                  controller: txt2,
                  style: TextStyle(
                      color: Colors.white
                  ),
                  onChanged: (text) {
                    str2=text;
                    print(str2);
                  },
                  minLines: 1,
                  maxLines: 20,
                  cursorColor: Colors.lightGreenAccent,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Text',
                      hintText: 'Enter Text',
                      hintStyle: TextStyle(
                          color: Colors.grey[500]
                      ),
                      labelStyle: TextStyle(
                          color: Colors.lightGreenAccent
                      ),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Colors.lightGreenAccent
                          )
                      )
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Flexible(
                      flex: 1,
                      child: RotatedBox(
                        quarterTurns: 1,
                        child: ToggleButtons(
                          children: <Widget>[
                            RotatedBox(
                              quarterTurns: 3,
                              child: Container(
                                padding: EdgeInsets.symmetric(vertical: 5,horizontal: 5),
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: isSelectedList[0]?tickVal:Colors.grey
                                  )
                                ),
                                child: Row(
                                  children: <Widget>[
                                    Icon(IconList[0],
                                        color: isSelectedList[0]?tickVal:Colors.grey
                                    ),
                                    SizedBox(width: 15,),
                                    Text("High",
                                      style: TextStyle(
                                        color: isSelectedList[0]?tickVal:Colors.grey
                                    ),)
                                  ],
                                ),
                              ),
                            ),
                            RotatedBox(
                              quarterTurns: 3,
                              child: Container(
                                padding: EdgeInsets.symmetric(vertical: 5,horizontal: 5),
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        color: isSelectedList[1]?tickVal:Colors.grey
                                    )
                                ),
                                child: Row(
                                  children: <Widget>[
                                    Icon(IconList[1],
                                      color: isSelectedList[1]?tickVal:Colors.grey,
                                    ),
                                    SizedBox(width: 5,),
                                    Text("Moderate",
                                      style: TextStyle(
                                          color: isSelectedList[1]?tickVal:Colors.grey,
                                      ),)
                                  ],
                                ),
                              ),
                            ),
                            RotatedBox(
                              quarterTurns: 3,
                              child: Container(
                                padding: EdgeInsets.symmetric(vertical: 5,horizontal: 5),
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        color: isSelectedList[2]?tickVal:Colors.grey
                                    )
                                ),
                                child: Row(
                                  children: <Widget>[
                                    Icon(IconList[2],
                                        color: isSelectedList[2]?tickVal:Colors.grey
                                    ),
                                    SizedBox(width: 15,),
                                    Text("Low",
                                      style: TextStyle(
                                          color: isSelectedList[2]?tickVal:Colors.grey
                                      ),)
                                  ],
                                ),
                              ),
                            ),
                          ],
                          selectedColor: tickVal,
                          renderBorder: false,
                          isSelected: isSelectedList,
                          onPressed: (int index){
                            setState(() {
                              print(PriorityIndex);
                              for(int i=0;i<isSelectedList.length;i++) {
                                if (i == index){
                                  PriorityIndex=index;
                                  isSelectedList[i] = true;
                                  IconList[i]=isSelectedList[i]?Icons.check_box:Icons.check_box_outline_blank;
                                }
                                else {
                                  isSelectedList[i] = false;
                                  IconList[i]=Icons.check_box_outline_blank;
                                }
                              }
                              switch (index){
                                case 0:
                                  tickVal=Colors.red;
                                  break;
                                case 1:
                                  tickVal=Colors.orange;
                                  break;
                                case 2:
                                  tickVal=Colors.lightGreenAccent;
                                  break;
                              }
                            });
                          },
                        ),
                      ),
                    ),
                    Flexible(
                      flex: 2,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          SizedBox(
                            width: double.infinity,
                            child: FlatButton.icon(
                              color: Colors.red,
                                onPressed: (){
                                if(data["state"].toString()=="Add"){
                                  Navigator.pop(context,{
                                    "context":"Not Edited"
                                  });
                                }
                                else{
                                    int valor=data["index"];
                                    Navigator.pop(context,{
                                      "context": "Edited",
                                      "VAL":valor,
                                    });
                                  }
                                },
                                icon: Icon(Icons.delete),
                                label: Text(data["state"].toString()=="Add"?"Clear":"Delete")
                            ),
                          ),
                          SizedBox(
                            width: double.infinity,
                            child: FlatButton.icon(
                                color: Colors.lightGreen,
                                onPressed: (){
                                  if(data["state"].toString()=="Add"){
                                    Navigator.pop(context,{
                                      "context":"Add",
                                      "title": str1,
                                      "value": str2,
                                      "priority": PriorityIndex
                                    });
                                  }
                                  else
                                    Navigator.pop(context,{
                                      "context": "Update",
                                      "title": str1,
                                      "value": str2,
                                      "priority": PriorityIndex
                                    });
                                },
                                icon: Icon(Icons.check_circle_outline),
                                label: Text(data["state"].toString()=="Add"?"Add":"Edit")
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
