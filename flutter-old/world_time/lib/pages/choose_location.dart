import 'package:flutter/material.dart';
import 'package:world_time/services/world_time.dart';


class Chooselocation extends StatefulWidget {
  @override
  _ChooselocationState createState() => _ChooselocationState();

}

class _ChooselocationState extends State<Chooselocation> {

  List<WorldTime> locations=[
    WorldTime(location: "India",flagUrl: "India.png",locUrl: "Asia/Kolkata"),
    WorldTime(location: "Seoul",flagUrl: "south_korea.png",locUrl: "Asia/Seoul"),
    WorldTime(location: "Jakarta",flagUrl: "indonesia.png",locUrl: "Asia/Jakarta"),
    WorldTime(location: "Athens",flagUrl: "greece.png",locUrl: "Europe/Berlin"),
    WorldTime(location: "London",flagUrl: "uk.png",locUrl: "Europe/London"),
    WorldTime(location: "Cairo",flagUrl: "egypt.png",locUrl: "Africa/Cairo"),
    WorldTime(location: "Nairobi",flagUrl: "kenya.png",locUrl: "Africa/Nairobi"),
    WorldTime(location: "Chicago",flagUrl: "usa.png",locUrl: "America/Chicago"),
    WorldTime(location: "New York",flagUrl: "usa.png",locUrl: "America/New_York"),
  ];

  void updateTime(index) async{
      WorldTime instance=locations[index];
      await instance.getTime();
      Navigator.pop(context,{
        "location":instance.location,
        "flag":instance.flagUrl,
        "time":instance.time,
        "isDay":instance.isDay,
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Choose Location"),
        centerTitle: true,
        elevation: 0,
      ),
      backgroundColor: Colors.grey[800],
      body: ListView.builder( //idk why this is not working
        itemCount: locations.length,
          itemBuilder: (context,index){
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 2,horizontal: 2),
              child: Card(
                child: ListTile(
                  onTap: (){
                    updateTime(index);
                  },
                  title: Text(locations[index].location),
                  leading: CircleAvatar(
                    backgroundImage: AssetImage("assets/${locations[index].flagUrl}"),
                  )
                )
              ),
            );
          }),
    );
  }


}
