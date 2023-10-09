import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: HomePage());
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Counter myCounter = new Counter(count: 0);
  @override
  Widget build(BuildContext context) {
    return CounterProvider(
      counter: myCounter,
      child: Scaffold(
        appBar: AppBar(
          title: Text("Scoped Model App"),
        ),
        body: ExtraClass(),
        floatingActionButton: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            IconButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => SecondPage()));
                },
                icon: Icon(Icons.add)),
            IconButton(
                onPressed: () {
                  myCounter.increment();
                  print(myCounter.count);
                  setState(() {});
                },
                icon: Icon(Icons.plus_one))
          ],
        ),
      ),
    );
  }
}

class PlaceHolderIcon extends StatelessWidget {
  const PlaceHolderIcon({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant<CounterProviderScoped>(
      builder: (context, _, model) => IconButton(
          onPressed: () {
            model.add();
          },
          icon: Icon(Icons.plus_one)),
    );
  }
}

class SecondPage extends StatefulWidget {
  const SecondPage({Key? key}) : super(key: key);

  @override
  _SecondPageState createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  @override
  Widget build(BuildContext context) {
    return ScopedModel(
      model: CounterProviderScoped(),
      child: Scaffold(
        body: ScopedModelDescendant<CounterProviderScoped>(
          builder: (context, _, model) => Center(
            child: Text("${model.counts}"),
          ),
        ),
        floatingActionButton: PlaceHolderIcon(),
      ),
    );
  }
}

class Counter {
  int count;
  Counter({required this.count});
  void increment() {
    count++;
  }

  int get countvalue => count;
}

class CounterProvider extends InheritedWidget {
  final Counter counter;
  final Widget child;

  CounterProvider({required this.counter, required this.child})
      : super(child: child);

  static CounterProvider? of(BuildContext context) =>
      context.dependOnInheritedWidgetOfExactType<CounterProvider>();

  @override
  bool updateShouldNotify(CounterProvider oldWidget) {
    print("working processing");
    if (counter.count != oldWidget.counter.count) {
      return true;
    }
    return false;
  }
}

class ExtraClass extends StatelessWidget {
  ExtraClass({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print("built");
    return Container(
      child: Center(
        child: ExtraClass2(),
      ),
    );
  }
}

class ExtraClass2 extends StatelessWidget {
  const ExtraClass2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Counter counter = CounterProvider.of(context)!.counter;
    return Container(child: Text("${counter.countvalue}"));
  }
}

class CounterProviderScoped extends Model {
  Counter counter = new Counter(count: 0);

  int get counts => counter.count;

  void add() {
    counter.increment();
    print(counter.count);
    notifyListeners();
  }
}
