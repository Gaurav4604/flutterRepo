import 'package:flutter/material.dart';


class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  Map data={};

  @override
  Widget build(BuildContext context) {

    data=data.isNotEmpty?data:ModalRoute.of(context).settings.arguments;
    print(data);

    String bgImage=data["isDay"]?"daytime.png":"nighttime.png";

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/$bgImage"),
            fit: BoxFit.cover,
          )
        ),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(0,280,0,0),
          child: Column(
            children: [
              FlatButton.icon(onPressed: () async{
                dynamic result=await Navigator.pushNamed(context,"/location");
                setState(() {
                  data={
                    "flag":result["flag"],
                    "location":result["location"],
                    "time":result["time"],
                    "isDay":result["isDay"],
                  };
                });
              },
                  shape: RoundedRectangleBorder(
                    side: BorderSide(color: data["isDay"]? Colors.grey[900]:Colors.grey[400]),
                  ),
                icon: Icon(
                  Icons.edit_location,
                  color: data["isDay"]? Colors.grey[900]:Colors.grey[400],
                ),
                  label: Text("Edit location",
                  style: TextStyle(
                    color: data["isDay"]? Colors.grey[900]:Colors.grey[400],
                  ),)
              ),
              SizedBox(height: 20,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    data["location"],
                    style: TextStyle(
                      fontSize: 20,
                      letterSpacing: 2,
                      color:data["isDay"]? Colors.grey[900]:Colors.grey[400],
                    ),
                  )
                ],
              ),
              SizedBox(height: 20,),
              Text(
                data["time"],
                style: TextStyle(
                  fontSize: 66,
                  color: data["isDay"]? Colors.grey[900]:Colors.grey[400],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
