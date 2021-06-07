import 'package:flutter/material.dart';
import '../objects/quote.dart';

class quotesCard extends StatefulWidget {
  final quote;
  final author;
  final delete;
  late bool vis = true;
  quotesCard({this.quote, this.author, this.delete});

  @override
  _quotesCardState createState() => _quotesCardState();
}

class _quotesCardState extends State<quotesCard> {
  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: widget.vis,
      child: Card(
        elevation: 20,
        borderOnForeground: true,
        shadowColor: Colors.blue,
        margin: EdgeInsets.fromLTRB(16, 16, 16, 0),
        child: Padding(
            padding: EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Center(
                  child: Text(widget.quote),
                ),
                SizedBox(
                  height: 6,
                ),
                Text(
                  'Writer: ' + widget.author,
                  textAlign: TextAlign.left,
                  style: TextStyle(color: Colors.purple),
                ),
                SizedBox(
                  height: 6,
                ),
                TextButton(
                    onPressed: null,
                    onLongPress: () {
                      setState(() {
                        widget.vis = false;
                      });
                    },
                    autofocus: true,
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(Colors.black26),
                        overlayColor: MaterialStateProperty.all(Colors.black)),
                    child: Icon(
                      Icons.delete_rounded,
                    ))
              ],
            )),
      ),
    );
  }
}
