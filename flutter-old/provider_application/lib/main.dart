import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Provider Sign-In Example",
      home: HomePage(),
      debugShowCheckedModeBanner: false
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Provider Login Example"),
        actions: [
          IconButton(onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => LoginRoute()));
          }, icon: Icon(Icons.person))
        ],
      ),
      body: Center(
        child: Consumer<SignInDetailsModel>(
          builder: (context, userModel, child) {
            String message = (userModel.user == ""? "Please Sign in" : "Wlecome ${userModel.user}");
            return Text(message, style: Theme.of(context).textTheme.headline4,);
          },
        ),
      )
    );
  }
}

class LoginRoute extends StatelessWidget {
  const LoginRoute({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      
    );
  }
}

// https://medium.com/flutter-community/managing-flutter-state-using-provider-e26c78060c26