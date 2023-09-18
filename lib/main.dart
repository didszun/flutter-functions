import 'package:flutter/material.dart';
import 'package:flutter_functions/route_generator.dart';
import 'mod_rest_overview.dart';
import 'mod_rest_detail.dart';

// REST API test endpoints:
// https://jsonplaceholder.typicode.com/users

void main() {runApp(const MyApp());}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Google Material Design Demo',
        onGenerateRoute: RouteGenerator.generateRoute,

        // initialRoute: '/',
        // routes: {
        //   '/': (context) => HomeScreen(),
        //   '/rest-overview': (context) => RestOverview(),
        //   '/rest-detail/:userId': (context) => RestDetail(), // Todo: wrong
        // },
    );
  }
}

class HomeScreen extends StatelessWidget {
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


