import 'package:flutter/material.dart';
// import '../objects/quotesList.dart';
import '../objects/quote.dart';
import '../req/quotesCard.dart';
import 'nav.dart';
import '../services/getQuotes.dart';

class quotes extends StatefulWidget {
  const quotes({Key? key}) : super(key: key);
  @override
  _quotesState createState() => _quotesState();
}

class _quotesState extends State<quotes> {
  getQuotes q = getQuotes();
  List<quotesCard> qc = [];

  Future<String> getQ() async {
    await q.set();
    for (int i = 0; i < q.data["results"].length; i) {
      var content = q.data["results"][i]['content'];
      var author = q.data["results"][i]['author'];
      qc.add(quotesCard(
        quote: content,
        author: author,
        delete: false,
      ));
      i++;
    }
    return "GG";
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Nav(),
      appBar: AppBar(
        title: Text("Quotes"),
        centerTitle: true,
        backgroundColor: Colors.black54,
      ),
      body: FutureBuilder(
        future: getQ(),
        builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
          List<Widget> children;
          if (snapshot.hasData) {
            children = qc;
          } else if (snapshot.hasError) {
            children = <Widget>[
              const Icon(
                Icons.error_outline,
                color: Colors.red,
                size: 60,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 16),
                child: Text('Error: ${snapshot.error}'),
              )
            ];
          } else {
            children = [
              SizedBox(
                height: 200,
              ),
              Center(
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                    Text(
                      'Awaiting result...',
                      style: TextStyle(height: 10),
                    ),
                    Center(child: CircularProgressIndicator())
                  ])),
            ];
          }
          return ListView(
            shrinkWrap: true,
            children: children,
          );
        },
      ),
    );
  }
}
