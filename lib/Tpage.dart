import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'main.dart';

class TandC extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(
              Icons.arrow_back,
              color: Colors.black,
            ),
          ),
          actions: <Widget>[
            IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => InfoPage()),
                );
              },
              alignment: Alignment.center,
              icon: Icon(
                Icons.info_outline,
                color: Colors.black,
              ),
            ),
          ],
          title: Center(
            child: Text(
              'PANAAH',
              style: TextStyle(
                  fontSize: 40,
                  color: Colors.blue[300],
                  fontFamily: 'Quicksand',
                  fontWeight: FontWeight.w900),
            ),
          ),
          backgroundColor: Colors.white,
        ),
        body: ListView(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(bottom: 16.0, top: 32),
              child: AutoSizeText(
                'Terms and Conditions',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w700,
                  fontFamily: 'Quicksand',
                  fontSize: 25,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
