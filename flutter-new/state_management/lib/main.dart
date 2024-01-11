import 'package:flutter/material.dart';
import "package:provider/provider.dart";
import 'package:state_management/models.dart';

void main() {
  runApp(ChangeNotifierProvider(
    create: ((context) => CartModel()),
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const HomePage(title: 'Home'),
      debugShowCheckedModeBanner: false,
    );
  }
}

class HomePage extends StatefulWidget {
  final String title;
  const HomePage({super.key, required this.title});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    var cart = context.watch<CartModel>();

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Consumer<CartModel>(
            builder: (context, value, child) {
              return Text("Total Price ${value.totalPrice}");
            },
          ),
          ElevatedButton(
              onPressed: () {
                Provider.of<CartModel>(context, listen: false)
                    .add(Item(title: "New Item"));
              },
              child: const Text("Add Random Item"))
        ],
      ),
    );
  }
}
