import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:async';
import 'package:url_launcher/url_launcher.dart';
import 'Tpage.dart';
import 'Ppage.dart';
import 'package:firebase_core/firebase_core.dart';

final databaseReference = FirebaseFirestore.instance;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MaterialApp(
    home: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  @override
  HomePage createState() => HomePage();
}

class HomePage extends State<MyApp> {
  bool tc = false;
  bool pp = false;
  var s;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 8 / 14,
              child: Image.asset(
                'images/panaah_logo.png',
                fit: BoxFit.contain,
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height / 14,
              child: Padding(
                padding: const EdgeInsets.all(2.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    RaisedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => TandC()),
                        );
                      },
                      padding:
                          EdgeInsets.symmetric(vertical: 2, horizontal: 16),
                      shape: StadiumBorder(),
                      color: Colors.white,
                      child: Center(
                        child: AutoSizeText(
                          'Terms and Conditions',
                          maxFontSize: 30,
                          maxLines: 1,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                    Checkbox(
                      value: tc,
                      onChanged: (bool value) {
                        setState(() {
                          tc = value;
                        });
                      },
                    ),
                  ],
                ),
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height / 14,
              child: Padding(
                padding: const EdgeInsets.all(2.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    RaisedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => PandP()),
                        );
                      },
                      padding:
                          EdgeInsets.symmetric(vertical: 2, horizontal: 40),
                      shape: StadiumBorder(),
                      color: Colors.white,
                      child: Center(
                        child: AutoSizeText(
                          'Privacy Policy',
                          maxFontSize: 30,
                          maxLines: 1,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                    Checkbox(
                      value: pp,
                      onChanged: (bool value) {
                        setState(() {
                          pp = value;
                        });
                      },
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 5.0),
              child: Container(
                height: MediaQuery.of(context).size.height / 14,
                color: Colors.white,
                child: RichText(
                  text: TextSpan(
                    text: 'l',
                    style: TextStyle(color: Colors.white, fontSize: 5),
                    children: <TextSpan>[
                      TextSpan(
                        text: s,
                        style: TextStyle(color: Colors.red, fontSize: 15),
                      )
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 32, right: 32),
              child: Container(
                //height: MediaQuery.of(context).size.height / 14,
                child: RaisedButton(
                  onPressed: () {
                    if (tc == true && pp == true) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => SecondPage()),
                      );
                    } else {
                      setState(() {
                        s = '*Accept T&c and Private policy to continue';
                      });
                    }
                  },
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 5),
                  shape: StadiumBorder(),
                  child: Center(
                      child: AutoSizeText(
                    'Continue',
                    maxLines: 1,
                    maxFontSize: 50,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w900,
                      fontFamily: 'Quicksand',
                      fontSize: 25,
                    ),
                  )),
                  color: Colors.white,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class SecondPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white,
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
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: RaisedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => JoinFam()),
                    );
                  },
                  padding: EdgeInsets.symmetric(vertical: 16, horizontal: 16),
                  shape: StadiumBorder(),
                  child: AutoSizeText(
                    'Join our Family',
                    maxLines: 1,
                    maxFontSize: 50,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w700,
                      fontFamily: 'Quicksand',
                      fontSize: 25,
                    ),
                  ),
                  color: Colors.white,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: RaisedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Contri()),
                    );
                  },
                  padding: EdgeInsets.symmetric(vertical: 16, horizontal: 40),
                  shape: StadiumBorder(),
                  child: AutoSizeText(
                    'Contribute',
                    maxLines: 1,
                    maxFontSize: 50,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w700,
                      fontFamily: 'Quicksand',
                      fontSize: 25,
                    ),
                  ),
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class JoinFam extends StatelessWidget {
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
        body: MyStatefulWidget(),
      ),
    );
  }
}

class MyStatefulWidget extends StatefulWidget {
  @override
  JoinFamForm createState() => JoinFamForm();
}

bool validateEmail(String value) {
  Pattern pattern =
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
  RegExp regex = new RegExp(pattern);
  return (!regex.hasMatch(value)) ? false : true;
}

class JoinFamForm extends State<MyStatefulWidget> {
  final famkey = GlobalKey<FormState>();
  bool ag = false;
  TextEditingController email;
  TextEditingController city;
  TextEditingController state;
  TextEditingController address;
  TextEditingController phone;
  TextEditingController insta;
  TextEditingController faceb;
  TextEditingController name;
  TextEditingController dob;
  var x;

  initState() {
    name = new TextEditingController();
    email = new TextEditingController();
    phone = new TextEditingController();
    address = new TextEditingController();
    city = new TextEditingController();
    state = new TextEditingController();
    faceb = new TextEditingController();
    insta = new TextEditingController();
    dob = new TextEditingController();
    super.initState();
  }

  void addingData() async {
    await databaseReference.collection("Family").add({
      'Full Name': name.text,
      'Email': email.text,
      'Phone no.': phone.text,
      'DOB': dob.text,
      'City': city.text,
      'State': state.text,
      'Address': address.text,
      'Fb link': faceb.text,
      'Insta Link': insta.text,
    });
  }

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: new BoxConstraints(
        minHeight: 1.0,
        maxHeight: 2000.0,
      ),
      child: ListView(
        shrinkWrap: true,
        children: <Widget>[
          Form(
            key: famkey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 16, horizontal: 32),
                  child: new TextFormField(
                    decoration: new InputDecoration(
                      labelText: 'Full Name',
                      fillColor: Colors.blue[300],
                      border: new OutlineInputBorder(
                        borderRadius: new BorderRadius.circular(25.0),
                        borderSide: new BorderSide(),
                      ),
                    ),
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Please enter some text';
                      }
                      return null;
                    },
                    controller: name,
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 16, horizontal: 32),
                  child: new TextFormField(
                    keyboardType: TextInputType
                        .emailAddress, // Use email input type for emails.
                    decoration: new InputDecoration(
                      hintText: 'you@example.com',
                      labelText: 'E-mail Address',
                      fillColor: Colors.blue[300],
                      border: new OutlineInputBorder(
                        borderRadius: new BorderRadius.circular(25.0),
                        borderSide: new BorderSide(),
                      ),
                    ),
                    validator: (value) {
                      if (validateEmail(value)) {
                        return null;
                      }
                      return 'please enter a valid Email';
                    },
                    controller: email,
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 16, horizontal: 32),
                  child: new TextFormField(
                    decoration: new InputDecoration(
                      labelText: 'Phone Number',
                      fillColor: Colors.blue[300],
                      border: new OutlineInputBorder(
                        borderRadius: new BorderRadius.circular(25.0),
                        borderSide: new BorderSide(),
                      ),
                    ),
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Please enter some text';
                      }
                      return null;
                    },
                    controller: phone,
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 16, horizontal: 32),
                  child: new TextFormField(
                    decoration: new InputDecoration(
                      hintText: 'DD/MM/YYYY',
                      labelText: 'Date of Birth',
                      fillColor: Colors.blue[300],
                      border: new OutlineInputBorder(
                        borderRadius: new BorderRadius.circular(25.0),
                        borderSide: new BorderSide(),
                      ),
                    ),
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Please enter some text';
                      }
                      return null;
                    },
                    controller: dob,
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 16, horizontal: 32),
                  child: new TextFormField(
                    decoration: new InputDecoration(
                      labelText: 'Address',
                      fillColor: Colors.blue[300],
                      border: new OutlineInputBorder(
                        borderRadius: new BorderRadius.circular(25.0),
                        borderSide: new BorderSide(),
                      ),
                    ),
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Please enter some text';
                      }
                      return null;
                    },
                    controller: address,
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 16, horizontal: 32),
                  child: new TextFormField(
                    decoration: new InputDecoration(
                      labelText: 'City',
                      fillColor: Colors.blue[300],
                      border: new OutlineInputBorder(
                        borderRadius: new BorderRadius.circular(25.0),
                        borderSide: new BorderSide(),
                      ),
                    ),
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Please enter some text';
                      }
                      return null;
                    },
                    controller: city,
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 16, horizontal: 32),
                  child: new TextFormField(
                    decoration: new InputDecoration(
                      labelText: 'State',
                      fillColor: Colors.blue[300],
                      border: new OutlineInputBorder(
                        borderRadius: new BorderRadius.circular(25.0),
                        borderSide: new BorderSide(),
                      ),
                    ),
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Please enter some text';
                      }
                      return null;
                    },
                    controller: state,
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 16, horizontal: 32),
                  child: new TextFormField(
                    decoration: new InputDecoration(
                      labelText: 'Facebook Profile Link',
                      fillColor: Colors.blue[300],
                      border: new OutlineInputBorder(
                        borderRadius: new BorderRadius.circular(25.0),
                        borderSide: new BorderSide(),
                      ),
                    ),
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Please enter some text';
                      }
                      return null;
                    },
                    controller: faceb,
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 16, horizontal: 32),
                  child: new TextFormField(
                    decoration: new InputDecoration(
                      labelText: 'Instagram Username',
                      fillColor: Colors.blue[300],
                      border: new OutlineInputBorder(
                        borderRadius: new BorderRadius.circular(25.0),
                        borderSide: new BorderSide(),
                      ),
                    ),
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Please enter some text';
                      }
                      return null;
                    },
                    controller: insta,
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 16, horizontal: 32),
                  child: Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Checkbox(
                          value: ag,
                          onChanged: (bool value) {
                            setState(() {
                              ag = value;
                            });
                          },
                        ),
                        Flexible(
                          child: Text(
                            'I agree that I have provided correct information',
                            maxLines: 2,
                            style: TextStyle(
                              fontSize: 15,
                              color: Colors.black,
                              fontFamily: 'Quicksand',
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 16, horizontal: 32),
                  child: Container(
                    child: Flexible(
                      child: Text(
                        '*Tick the checkbox to Submit',
                        style: TextStyle(color: Colors.red, fontSize: 15),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 16, horizontal: 32),
                  child: Container(
                    //width: double.infinity,
                    child: RaisedButton(
                      onPressed: () {
                        if (ag == true) {
                          if (famkey.currentState.validate()) {
                            addingData();
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => TyPage()),
                            );
                          }
                        }
                      },
                      padding:
                          EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                      shape: StadiumBorder(),
                      child: AutoSizeText(
                        'Submit',
                        maxLines: 1,
                        maxFontSize: 50,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w700,
                          fontFamily: 'Quicksand',
                          fontSize: 25,
                        ),
                      ),
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class Contri extends StatelessWidget {
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
        body: MyStatefulWidgetTwo(),
      ),
    );
  }
}

class MyStatefulWidgetTwo extends StatefulWidget {
  @override
  ContriForm createState() => ContriForm();
}

class ContriForm extends State<MyStatefulWidgetTwo> {
  final contrikey = GlobalKey<FormState>();
  bool mont = false;
  var y;
  TextEditingController email2;
  TextEditingController city2;
  TextEditingController state2;
  TextEditingController address2;
  TextEditingController phone2;
  TextEditingController don;
  TextEditingController name2;
  TextEditingController dob2;

  initState() {
    name2 = new TextEditingController();
    email2 = new TextEditingController();
    phone2 = new TextEditingController();
    address2 = new TextEditingController();
    city2 = new TextEditingController();
    state2 = new TextEditingController();
    don = new TextEditingController();
    dob2 = new TextEditingController();
    super.initState();
  }

  void addingData2() async {
    await databaseReference.collection("Contribution").add({
      'Full Name': name2.text,
      'Email': email2.text,
      'Phone no.': phone2.text,
      'DOB': dob2.text,
      'City': city2.text,
      'State': state2.text,
      'Address': address2.text,
      'Donation': don.text,
    });
  }

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: new BoxConstraints(
        minHeight: 1.0,
        maxHeight: 2000.0,
      ),
      child: ListView(
        shrinkWrap: true,
        children: <Widget>[
          Form(
            key: contrikey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 16, horizontal: 32),
                  child: new TextFormField(
                    decoration: new InputDecoration(
                      labelText: 'Full Name',
                      fillColor: Colors.blue[300],
                      border: new OutlineInputBorder(
                        borderRadius: new BorderRadius.circular(25.0),
                        borderSide: new BorderSide(),
                      ),
                    ),
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Please enter some text';
                      }
                      return null;
                    },
                    controller: name2,
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 16, horizontal: 32),
                  child: new TextFormField(
                    keyboardType: TextInputType
                        .emailAddress, // Use email input type for emails.
                    decoration: new InputDecoration(
                      hintText: 'you@example.com',
                      labelText: 'E-mail Address',
                      fillColor: Colors.blue[300],
                      border: new OutlineInputBorder(
                        borderRadius: new BorderRadius.circular(25.0),
                        borderSide: new BorderSide(),
                      ),
                    ),
                    validator: (value) {
                      if (validateEmail(value)) {
                        return null;
                      }
                      return 'Please enter a valid Email';
                    },
                    controller: email2,
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 16, horizontal: 32),
                  child: new TextFormField(
                    decoration: new InputDecoration(
                      labelText: 'Phone Number',
                      fillColor: Colors.blue[300],
                      border: new OutlineInputBorder(
                        borderRadius: new BorderRadius.circular(25.0),
                        borderSide: new BorderSide(),
                      ),
                    ),
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Please enter some text';
                      }
                      return null;
                    },
                    controller: phone2,
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 16, horizontal: 32),
                  child: new TextFormField(
                    decoration: new InputDecoration(
                      hintText: 'DD/MM/YYYY',
                      labelText: 'Date of Birth',
                      fillColor: Colors.blue[300],
                      border: new OutlineInputBorder(
                        borderRadius: new BorderRadius.circular(25.0),
                        borderSide: new BorderSide(),
                      ),
                    ),
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Please enter some text';
                      }
                      return null;
                    },
                    controller: dob2,
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 16, horizontal: 32),
                  child: new TextFormField(
                    decoration: new InputDecoration(
                      labelText: 'Address',
                      fillColor: Colors.blue[300],
                      border: new OutlineInputBorder(
                        borderRadius: new BorderRadius.circular(25.0),
                        borderSide: new BorderSide(),
                      ),
                    ),
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Please enter some text';
                      }
                      return null;
                    },
                    controller: address2,
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 16, horizontal: 32),
                  child: new TextFormField(
                    decoration: new InputDecoration(
                      labelText: 'City',
                      fillColor: Colors.blue[300],
                      border: new OutlineInputBorder(
                        borderRadius: new BorderRadius.circular(25.0),
                        borderSide: new BorderSide(),
                      ),
                    ),
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Please enter some text';
                      }
                      return null;
                    },
                    controller: city2,
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 16, horizontal: 32),
                  child: new TextFormField(
                    decoration: new InputDecoration(
                      labelText: 'State',
                      fillColor: Colors.blue[300],
                      border: new OutlineInputBorder(
                        borderRadius: new BorderRadius.circular(25.0),
                        borderSide: new BorderSide(),
                      ),
                    ),
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Please enter some text';
                      }
                      return null;
                    },
                    controller: state2,
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 16, horizontal: 32),
                  child: new TextFormField(
                    keyboardType: TextInputType.multiline,
                    maxLines: null,
                    decoration: new InputDecoration(
                      labelText: 'Description of the donation',
                      fillColor: Colors.blue[300],
                      border: new OutlineInputBorder(
                        borderRadius: new BorderRadius.circular(25.0),
                        borderSide: new BorderSide(),
                      ),
                    ),
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Please enter some text';
                      }
                      return null;
                    },
                    controller: don,
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
                  child: Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Checkbox(
                          value: mont,
                          onChanged: (bool value) {
                            setState(() {
                              mont = value;
                            });
                          },
                        ),
                        Flexible(
                          child: Text(
                            'I am aware that Panaah foundation does not take donation in monetary form',
                            maxLines: 3,
                            style: TextStyle(
                              fontSize: 15,
                              color: Colors.black,
                              fontFamily: 'Quicksand',
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 16, horizontal: 32),
                  child: Container(
                    child: Flexible(
                      child: Text(
                        '*Tick the checkbox to Submit',
                        style: TextStyle(color: Colors.red, fontSize: 15),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 16, horizontal: 32),
                  child: Container(
                    child: RaisedButton(
                      onPressed: () {
                        if (mont == true) {
                          if (contrikey.currentState.validate()) {
                            addingData2();
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => TyPage()),
                            );
                          }
                        }
                      },
                      padding:
                          EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                      shape: StadiumBorder(),
                      child: AutoSizeText(
                        'Submit',
                        maxLines: 1,
                        maxFontSize: 50,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w700,
                          fontFamily: 'Quicksand',
                          fontSize: 25,
                        ),
                      ),
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class InfoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SafeArea(
          child: ListView(
            shrinkWrap: true,
            children: <Widget>[
              Align(
                alignment: Alignment.centerLeft,
                child: IconButton(
                  icon: Icon(Icons.arrow_back),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  color: Colors.black,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 16.0, top: 0.0),
                child: AutoSizeText(
                  'About Us',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w700,
                    fontFamily: 'Quicksand',
                    fontSize: 35,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.asset(
                  'images/panaah_pic.jpg',
                  height: 150,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Container(
                  child: Flexible(
                    child: AutoSizeText(
                      'At Panaah Foundation, we’ve taken initiative of offering our parts towards the betterment of our society by helping the underprivileged by providing them with old clothes, food items, books, donations and other basic necessities. The simple thought behind Panaah Foundation is connecting to people who are willing to offer whatever, little or more, and providing the collections to those who lack them and are unable to afford the basics. With a perspective to reach out masses and creating a community where people like us and you, can come together provide our helping hands, we welcome you to our journey.',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.black,
                        fontFamily: 'Quicksand',
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 16, horizontal: 100),
                child: RaisedButton(
                    onPressed: () {},
                    padding: EdgeInsets.symmetric(vertical: 8, horizontal: 8),
                    shape: StadiumBorder(),
                    child: AutoSizeText(
                      'Panaah Website',
                      maxLines: 1,
                      maxFontSize: 20,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.blue[300],
                        fontWeight: FontWeight.w700,
                        fontFamily: 'Quicksand',
                        fontSize: 20,
                      ),
                    ),
                    color: Colors.white),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: AutoSizeText(
                  'App developed by:',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w700,
                    fontFamily: 'Quicksand',
                    fontSize: 25,
                  ),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 16, horizontal: 100),
                child: RaisedButton(
                  onPressed: () {
                    launch(
                        'https://www.linkedin.com/in/priyanshu-jain-517418192/');
                  },
                  padding: EdgeInsets.symmetric(vertical: 8, horizontal: 8),
                  shape: StadiumBorder(),
                  child: AutoSizeText(
                    'Priyanshu Jain',
                    maxLines: 1,
                    maxFontSize: 20,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.blue[300],
                      fontWeight: FontWeight.w700,
                      fontFamily: 'Quicksand',
                      fontSize: 20,
                    ),
                  ),
                  color: Colors.white,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: 16.0, right: 16, bottom: 16, top: 0),
                child: AutoSizeText(
                  'priyanshu0405jain@gmail.com',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w700,
                    fontFamily: 'Quicksand',
                    fontSize: 15,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class TyPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          leading: Icon(
            Icons.arrow_back,
            color: Colors.white,
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
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Container(
              child: Flexible(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'Thank You for using Panaah App, your responses have been recorded. Panaah Foundation will shorty contact you. For more information about Panaah click the info icon.',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.black,
                        fontFamily: 'Quicksand',
                        fontSize: 25,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
