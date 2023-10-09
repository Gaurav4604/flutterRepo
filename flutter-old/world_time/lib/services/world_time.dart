import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

class WorldTime{
  String location; //location of data
  String time;  //time of the selected location
  String flagUrl;  //url of asset file
  String locUrl; //location url of endpoint
  bool isDay; //true if day, false if night

  WorldTime({this.location,this.flagUrl,this.locUrl});

  Future<void> getTime() async{
    try{
      Response response=await get('http://worldtimeapi.org/api/timezone/$locUrl');
      Map data=jsonDecode(response.body);
      String datetime=data["datetime"];
      String offsetHours=data["utc_offset"].substring(1,3);
      String offsetMin=data["utc_offset"].substring(4,6);
      //print("$datetime - $offset");
      DateTime now=DateTime.parse(datetime);//bleh
      now=now.add(Duration(hours: int.parse(offsetHours),minutes: int.parse(offsetMin)));
      //setting time property
      isDay= (now.hour>6 && now.hour<18);
      time=DateFormat.jm().format(now);
    }
    catch(e){
      print("caught error $e");
      time="Could not get data";
    }
  }
}
