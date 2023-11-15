import 'package:flutter/material.dart';
import 'package:layouts/people.dart';

void main() {
  runApp(const MyApp());
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
        visualDensity: const VisualDensity(horizontal: 4, vertical: 4),
      ),
      debugShowCheckedModeBanner: false,
      home: const Homepage(),
    );
  }
}

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Layout Management"),
      ),
      body: LayoutBuilder(builder: (context, constraints) {
        if (constraints.maxWidth > 600) {
          return const WideLayout();
          // TODO add multiple cases for 400 and 600, thats a grid of photos
        } else {
          return const NarrowLayout();
        }
      }),
    );
  }
}

class PersonList extends StatelessWidget {
  const PersonList({Key? key, required this.onPersonTap}) : super(key: key);

  // defining a callback
  final void Function(Person) onPersonTap;

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        for (final person in people)
          ListTile(
              title: Text(person.name),
              leading: Image.network(
                person.picture,
              ),
              onTap: () => onPersonTap(person)),
      ],
    );
  }
}

class PersonDetail extends StatelessWidget {
  final Person person;
  const PersonDetail(this.person, {super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
      if (constraints.maxHeight > 200) {
        return Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              MouseRegion(
                  onEnter: (event) {
                    print(event);
                  },
                  child: Text(person.name)),
              Text(person.phone),
              MaterialButton(
                  onPressed: () => {},
                  color: Colors.blue[300],
                  hoverColor: Colors.blue[500],
                  child: const Text("Contact Me"))
            ],
          ),
        );
      } else {
        return Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              MouseRegion(
                  onEnter: (event) {
                    print(event);
                  },
                  child: Text(person.name)),
              Text(person.phone),
              MaterialButton(
                  onPressed: () => {},
                  color: Colors.blue[300],
                  hoverColor: Colors.blue[500],
                  child: const Text("Contact Me"))
            ],
          ),
        );
      }
    });
  }
}

class NarrowLayout extends StatelessWidget {
  const NarrowLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: PersonList(
        onPersonTap: (person) => Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => Scaffold(
                appBar: AppBar(
                  title: Text(person.name),
                ),
                body: (PersonDetail(person))))),
      ),
    );
  }
}

class WideLayout extends StatefulWidget {
  const WideLayout({super.key});

  @override
  State<WideLayout> createState() => _WideLayoutState();
}

class _WideLayoutState extends State<WideLayout> {
  Person? _selectedPerson;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
            width: 300,
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: PersonList(
                onPersonTap: (person) => {
                  if ((_selectedPerson != null &&
                          _selectedPerson?.phone != person.phone) ||
                      _selectedPerson == null)
                    setState(() {
                      _selectedPerson = person;
                    })
                },
              ),
            )),
        Flexible(
          flex: 3,
          child: _selectedPerson == null
              ? const Placeholder()
              : PersonDetail(_selectedPerson!),
        )
      ],
    );
  }
}
