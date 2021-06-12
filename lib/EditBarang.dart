import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class EditBarang extends StatefulWidget {
  final List list;
  final int index;

  EditBarang({this.list, this.index});

  @override
  _EditBarangState createState() => new _EditBarangState();
}

class _EditBarangState extends State<EditBarang> {
  TextEditingController controllerNamaBrg;
  TextEditingController controllerStok;
  TextEditingController controllerHarga;

  void editData() {
    var url = "http://192.168.43.246/api-materialku/edit.php";

    http.post(Uri.parse(url), body: {
      "id_brg": widget.list[widget.index]['id_brg'],
      "nama_brg": controllerNamaBrg.text,
      "stok": controllerStok.text,
      "harga": controllerHarga.text,
    });
  }

  @override
  void initState() {
    controllerNamaBrg =
        new TextEditingController(text: widget.list[widget.index]['nama_brg']);
    controllerStok = new TextEditingController(
        text: widget.list[widget.index]['stok']);
    controllerHarga =
        new TextEditingController(text: widget.list[widget.index]['harga']);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(backgroundColor: Colors.black,
        title: new Text("EDIT DATA"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: ListView(
          children: <Widget>[
            new Column(
              children: <Widget>[
                new TextField(
                  controller: controllerNamaBrg,
                  decoration:
                      new InputDecoration(hintText: "Nama Barang", labelText: "Nama Barang"),
                ),
                new TextField(
                  controller: controllerStok,
                  decoration: new InputDecoration(
                      hintText: "Stok", labelText: "Stok"),
                ),
                new TextField(
                  controller: controllerHarga,
                  decoration: new InputDecoration(
                      hintText: "Harga", labelText: "Harga"),
                ),
                new Padding(
                  padding: const EdgeInsets.all(10.0),
                ),
                new RaisedButton(
                  child: new Text("Edit", style: TextStyle(color: Colors.white),),
                  color: Colors.black,
                  onPressed: () {
                    editData();
                    Navigator.pushReplacementNamed(context, '/Home');
                  },
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
