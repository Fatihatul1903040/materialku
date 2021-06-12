import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:materialku/DetailBarang.dart';
import 'dart:async';
import 'dart:convert';

import 'package:materialku/TambahBarang.dart';

class DataBarang extends StatefulWidget {
  @override
  _DataBarangState createState() => _DataBarangState();
}

class _DataBarangState extends State<DataBarang> {
  Future<List> getData() async {
    final response = await http
        .get(Uri.parse("http://192.168.43.246/api-materialku/read.php"));
    return json.decode(response.body);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        automaticallyImplyLeading: false,
        title: Text("Materialku"),
      ),
      floatingActionButton: new FloatingActionButton(
        backgroundColor: Colors.black,
        child: new Icon(Icons.add),
        onPressed: () => Navigator.of(context).push(new MaterialPageRoute(
          builder: (BuildContext context) => new TambahBarang(),
        )),
      ),
      body: new FutureBuilder<List>(
        future: getData(),
        builder: (context, snapshot) {
          if (snapshot.hasError) print(snapshot.error);

          return snapshot.hasData
              ? new ItemList(
                  list: snapshot.data,
                )
              : new Center(
                  child: new CircularProgressIndicator(),
                );
        },
      ),
    );
  }
}

class ItemList extends StatelessWidget {
  final List list;
  ItemList({this.list});

  @override
  Widget build(BuildContext context) {
    return new ListView.builder(
      itemCount: list == null ? 0 : list.length,
      itemBuilder: (context, i) {
        return new Container(
          padding: const EdgeInsets.all(10.0),
          child: new GestureDetector(
            onTap: () => Navigator.of(context).push(new MaterialPageRoute(
                builder: (BuildContext context) => new DetailBarang(
                      list: list,
                      index: i,
                    ))),
            child: new Card(
              color: Colors.grey,
              child: new ListTile(
                title: new Text(list[i]['nama_brg'], style: TextStyle(fontWeight: FontWeight.bold),),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    new Text("Stok : ${list[i]['stok']}"), 
                    new Text("Harga : ${list[i]['harga']}"),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
