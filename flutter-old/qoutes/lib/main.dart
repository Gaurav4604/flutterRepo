import 'package:flutter/material.dart';
import 'package:qoutes/quote.dart';
import 'package:qoutes/quote_card.dart';

void main() => runApp(MaterialApp(
    home: QuoteList(),
  debugShowCheckedModeBanner: false,
  )
);


class QuoteList extends StatefulWidget {
  @override
  _QuoteListState createState() => _QuoteListState();
}

class _QuoteListState extends State<QuoteList> {

  List<Quote> quotes=[
    Quote(text: "This is a text file 1",author: "me 1"),
    Quote(text: "This is a text file 2",author: "me 2"),
    Quote(text: "This is a text file 3",author: "me 3"),
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: Text("Awesome Quotes"),
        centerTitle: true,
      ),
      body: Column(
        children: quotes.map((e) => QuoteCard(
          quote: e,
          delete: (){
            setState(() {
              quotes.remove(e);
            });
          },
        )).toList(),
      ),
    );
  }
}

