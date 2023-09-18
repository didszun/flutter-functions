import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

// REST API test endpoints:
// https://jsonplaceholder.typicode.com/users

void main() {runApp(const MyApp());}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Google Material Design Demo',

        initialRoute: '/',
        routes: {
          '/': (context) => HomeScreen(),
          '/rest-overview': (context) => RestOverview(),
        },
    );
  }
}

class HomeScreen extends StatelessWidget {
  // final List<Map<String, dynamic>> data = [
  //   {"id": 1, "title": "Item 1"},
  //   {"id": 2, "title": "Item 2"},
  //   {"id": 3, "title": "Item 3"},
  // ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          leading: const Icon(Icons.menu),
          title: const Text("Flutter-Funktionsgalerie"),
          backgroundColor: Colors.orange

      ),
      body: ListView(
        children: <Widget>[
          Card(
              elevation: 5.0,
              color: Colors.purpleAccent,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  ListTile(
                      leading: const Icon(Icons.add_alert, size: 50),
                      title: const Text("Dialog-Beispiel"),
                      subtitle: const Text("Bei Tap wird Dialogbox gezeigt."),
                      onTap: () => print("Open Alert.")
                  )
                ],
              )
          ),
          Card(
              elevation: 5.0,
              color: Colors.lightBlue,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  ListTile(
                      leading: const Icon(Icons.backup_rounded, size: 50),
                      title: const Text("REST-TEST"),
                      subtitle: const Text("REST-API-Aufruf"),
                      onTap: () {
                        Navigator.pushNamed(
                          context,
                          '/rest-overview',
                        );
                      }
                      //=> print("Jetzt neue Route öffnen.")
                  )
                ],
              )
          ),
          for (int i=1; i<=20; i++)
            Card(
                elevation: 5.0,
                color: Colors.lightGreen,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    ListTile(
                        leading: const Icon(Icons.home, size: 50),
                        title: Text("Eintrag Nr. $i"),
                        subtitle: const Text("Dies ist ein Subtitel"),
                        onTap: () => print("Eintrag Nr. $i gedrückt.")
                    )
                  ],
                )
            )

        ],
      ),
    );
  }
}

class RestOverview extends StatefulWidget {
  @override
  _RestOverviewState createState() => _RestOverviewState();
}

class _RestOverviewState extends State<RestOverview> {
  List <dynamic> detailsData = [];

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    final response = await http.get(Uri.parse(
        'https://jsonplaceholder.typicode.com/users'));
        // /${ModalRoute.of(context).settings.arguments}

    if (response.statusCode == 200) {
      setState(() {
        detailsData = jsonDecode(response.body);
      });
    } else {
      throw Exception('Failed to load data');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Details Screen'),
      ),
      body: detailsData.isEmpty
          ? Center(child: CircularProgressIndicator())
          : ListTile(
        title: Text('Name: ${detailsData[0]["name"]}'),
        subtitle: Text('ID: ${detailsData[0]["id"]}'),
      ),
    );
  }
}
