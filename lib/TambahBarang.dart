import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class TambahBarang extends StatefulWidget {
  @override
  _TambahBarangState createState() => new _TambahBarangState();
}

class _TambahBarangState extends State<TambahBarang> {
  TextEditingController controlerNamaBrg = TextEditingController();
  TextEditingController controllerStok = TextEditingController();
  TextEditingController controllerHarga = TextEditingController();

  void tambah() {
    var url = "http://192.168.43.246/api-materialku/insert.php";

    http.post(Uri.parse(url), body: {
      "nama_brg": controlerNamaBrg.text,
      "stok": controllerStok.text,
      "harga": controllerHarga.text,
      
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        backgroundColor: Colors.black,

        automaticallyImplyLeading: false,
        title: new Text("Tambah Barang"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: ListView(
          children: <Widget>[
            new Column(
              children: <Widget>[
                new TextField(
                  controller: controlerNamaBrg,
                  decoration:
                      new InputDecoration(hintText: "Nama Barang", labelText: "Nama Barang"),
                ),
                new TextField(
                  controller: controllerStok,
                  decoration:
                      new InputDecoration(hintText: "Stok", labelText: "Stok"),
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
                  child: new Text("Tambah Data", style: TextStyle(color: Colors.white),),
                  color: Colors.black,
                  onPressed: () {
                    tambah();
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
