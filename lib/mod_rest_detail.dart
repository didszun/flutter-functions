import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'class_UserModel.dart';

class RestDetail extends StatefulWidget {
  String userId = "";

  @override
  _RestDetailState createState() => _RestDetailState();
}

class _RestDetailState extends State<RestDetail> {
  //List <dynamic> detailsData = [];
  // String detailsData = "";
  UserModel? detailsData = null;

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {

    //final String? userId = ModalRoute.of(context)!.settings.arguments as String?;

    final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/users/1'));

    if (response.statusCode == 200) {
      setState(() {
        detailsData = jsonDecode(response.body); // TODO: parse json
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
      body: detailsData!=null //detailsData.isEmpty
          ? const Center(child: CircularProgressIndicator(backgroundColor: Colors.red))
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