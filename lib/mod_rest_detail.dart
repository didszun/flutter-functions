import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class RestDetail extends StatefulWidget {
  @override
  _RestDetailState createState() => _RestDetailState();
}

class _RestDetailState extends State<RestDetail> {
  List <dynamic> detailsData = [];

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    final response = await http.get(Uri.parse(
        'https://jsonplaceholder.typicode.com/users'));
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
        title: const Text('Details Screen'),
      ),
      body: detailsData.isEmpty
          ? const Center(child: CircularProgressIndicator(backgroundColor: Colors.green))
          : Table(
        border: TableBorder.all(),
        columnWidths: const <int, TableColumnWidth>{
          0: IntrinsicColumnWidth(),
          1: FlexColumnWidth(),
          2: FixedColumnWidth(64),
        },
        defaultVerticalAlignment: TableCellVerticalAlignment.middle,
        children: <TableRow>[
          TableRow(
            children: <Widget>[
              Container(
                height: 32,
                color: Colors.green,
              ),
              TableCell(
                verticalAlignment: TableCellVerticalAlignment.top,
                child: Container(
                  height: 32,
                  width: 32,
                  color: Colors.red,
                ),
              ),
              Container(
                height: 64,
                color: Colors.blue,
              ),
            ],
          ),
          TableRow(
            decoration: const BoxDecoration(
              color: Colors.grey,
            ),
            children: <Widget>[
              Container(
                height: 64,
                width: 128,
                color: Colors.purple,
              ),
              Container(
                height: 32,
                color: Colors.yellow,
              ),
              Center(
                child: Container(
                  height: 32,
                  width: 32,
                  color: Colors.orange,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}