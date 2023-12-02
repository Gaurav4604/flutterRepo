import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const HomePage(title: 'Flutter Demo Home Page'),
      debugShowCheckedModeBanner: false,
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.title});
  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool showThisPart = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: showThisPart
            ? [
                Image.network('https://picsum.photos/250?image=9'),
                Image.network(
                    'https://docs.flutter.dev/assets/images/dash/dash-fainting.gif')
              ]
            : [
                FadeInImage.memoryNetwork(
                    placeholder: kTransparentImage,
                    image: "https://picsum.photos/250?image=9"),
                CachedNetworkImage(
                  imageUrl:
                      'https://docs.flutter.dev/assets/images/dash/dash-fainting.gif',
                  placeholder: (__, ___) => const CircularProgressIndicator(),
                ),
              ],
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () => setState(() {
                showThisPart = !showThisPart;
              })),
    );
  }
}
