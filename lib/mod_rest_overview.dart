import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

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
          ? const Center(child: CircularProgressIndicator(backgroundColor: Colors.green))
          : ListView(
        children: <Widget>[
          for (int i=0; i<=detailsData.length-1; i++)
            Card(
                elevation: 5.0,
                color: Colors.lightGreen,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    ListTile(
                        leading: const Icon(Icons.home, size: 50),
                        title: Text(detailsData[i]["name"]),
                        subtitle: Text('ID: ${detailsData[i]["id"]}'),
                        onTap: () => print("TODO: Detaildaten ausgeben.") // Todo
                    )
                  ],
                )
            )

        ],
      ),
    );
  }
}