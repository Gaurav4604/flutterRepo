import 'package:flutter/material.dart';

void main()=>runApp(
  MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Home()
  )
);

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "CrossPlatform",
          style: TextStyle(
            letterSpacing: 2,
            fontWeight: FontWeight.w200,
            color: Colors.deepPurple,
          ),
        ),
        backgroundColor: Colors.blue,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
        Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          ContainerExtension.customContainer(),
          ContainerExtension.customContainer(),
          ContainerExtension.customContainer(),
        ],),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ContainerExtension.customContainer(),
            ContainerExtension.customContainer(),
            ContainerExtension.customContainer(),
          ],),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ContainerExtension.customContainer(),
            ContainerExtension.customContainer(),
            ContainerExtension.customContainer(),
          ],)
        ],
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: (){
            print("button clicked");
          },
        child: Text("Click"),
          backgroundColor: Colors.blue,
          ),
    );
  }
}

class ContainerExtension{
  static Widget customContainer(){
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.0,vertical: 5.0),
      margin: EdgeInsets.all(5.0),
      color: Colors.grey[800],
      child: SizedBox(
        width: 90,
        height: 40,
        child: RaisedButton.icon(
          color: Colors.amber,
          icon: Center(
            child: SizedBox(
              width: 10,
              height: 10,
              child: Icon(
                Icons.mail,
                color: Colors.blue,
              ),
            ),
          ),
          onPressed: (){
            print("you clicked me");
          },
          label: Text(
            "Click me",
            style: TextStyle(
              fontSize: 10,
              color: Colors.blue,
            ),
          ),
        ),
      ),
    );
  }
}