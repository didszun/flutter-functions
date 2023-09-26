import 'package:flutter/material.dart';
import 'package:flutter_functions/route_generator.dart';
import 'package:flutter_functions/mat_dialog.dart';

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
                      title: const Text("Alert-Beispiel"),
                      subtitle: const Text("Bei Tap wird ein Info-Alert gezeigt."),
                      onTap: () {
                        showDialog(
                            context: context, builder: (BuildContext context) {
                          return const AlertDialog(
                            title: Text("Erfolg!"),
                            content: Text(
                                "Hier kann eine Erfolgsmeldung stehen."),
                          );
                        });
                      }
                  )
                ],
              )
          ),
          Card(
              elevation: 5.0,
              color: Colors.purpleAccent,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  ListTile(
                      leading: const Icon(Icons.question_answer, size: 50),
                      title: const Text("Dialog-Beispiel"),
                      subtitle: const Text("Bei Tap wird eine Dialogbox mit Future-Response gezeigt."),
                      onTap: () => showDialog(
                        context: context,
                        builder: (_) => DialogOverlay(),
                      ),
                  )
                ],
              )
          ),
          Card(
              elevation: 5.0,
              color: Colors.cyan,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  ListTile(
                      leading: const Icon(Icons.map, size: 50),
                      title: const Text("Map Integration"),
                      subtitle: const Text("flutter_map example."),
                      onTap: () {
                        Navigator.pushNamed(
                          context,
                          '/map',
                        );
                      }
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


