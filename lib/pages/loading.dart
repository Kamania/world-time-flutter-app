import 'package:flutter/material.dart';
import 'package:world_time/services/world_time.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatefulWidget {
  const Loading({super.key});

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {

  Future<void> setWorldTime() async {
    WorldTime instance = WorldTime(location: 'Berlin', flag: 'germany.png', url: 'Europe/Berlin');
    await instance.getTime();
    Navigator.pushReplacementNamed(context, '/home', arguments: {
      'location': instance.location,
      'flag': instance.flag,
      'time': instance.time,
      'isDayTime': instance.isDayTime
    });
  }

  @override
  void initState() {
    super.initState();
    setWorldTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[900],
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.all(0),
          children:  [
            const DrawerHeader(
              decoration: BoxDecoration(
                  color: Colors.green
              ),
              child: UserAccountsDrawerHeader(
                decoration: BoxDecoration(color: Colors.green),
                accountName: Text(
                  "Joseph Kamania Chiira",
                  style: TextStyle(fontSize: 18),
                ),
                accountEmail: Text("kamaniajoseph@gmail.com"),
                currentAccountPictureSize: Size.square(50),
                currentAccountPicture: CircleAvatar(
                  backgroundColor: Color.fromARGB(255, 165, 255, 137),
                  child: Text(
                    "J",
                    style: TextStyle(
                        fontSize: 30.0,
                        color: Colors.blue
                    ),
                  ),
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.person),
              title: Text("My Profile"),
              onTap: (){Navigator.pop(context);},
            ),
            ListTile(
              leading: Icon(Icons.book),
              title: Text("My Course"),
              onTap: (){Navigator.pop(context);},
            ),
            ListTile(
              leading: Icon(Icons.workspace_premium),
              title: Text("Go Premium"),
              onTap: (){Navigator.pop(context);},
            ),
            ListTile(
              leading: Icon(Icons.video_label),
              title: Text("Saved Videos"),
              onTap: (){Navigator.pop(context);},
            ),
            ListTile(
              leading: Icon(Icons.edit),
              title: Text("Edit Profile"),
              onTap: (){Navigator.pop(context);},
            ),
            ListTile(
              leading: Icon(Icons.logout),
              title: Text("Logout"),
              onTap: (){Navigator.pop(context);},
            ),
          ],
        ),
      ),
      body: Center(
        child: SpinKitFoldingCube(
          color: Colors.white,
          size: 80.0,
        ),
      ),
    );
  }
}
