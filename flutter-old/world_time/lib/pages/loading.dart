import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:world_time/services/world_time.dart';

class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {


  void setUpWorldTime() async{
    WorldTime instance=WorldTime(location: "India",flagUrl: "India.png",locUrl: "Asia/Kolkata");
    await instance.getTime();
    //argument is a key value pair
    Navigator.pushReplacementNamed(context, '/home',arguments: {
      "location":instance.location,
      "flag":instance.flagUrl,
      "time":instance.time,
      "isDay":instance.isDay,
    });
  }

  @override
  void initState() {
    //since it is async, nothing else in affected
    super.initState();
    setUpWorldTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      body: Center(
        child: SpinKitCubeGrid(
          color: Colors.amber,
          size: 70.0,
        ),
      )
    );
  }
}
