import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:materialku/EditBarang.dart';

class DetailBarang extends StatefulWidget {
  List list;

  int index;

  DetailBarang({this.index, this.list});

  @override
  _DetailBarangState createState() => new _DetailBarangState();
}

class _DetailBarangState extends State<DetailBarang> {
  void deleteData() {
    var url = "http://192.168.43.246/api-materialku/delete.php";

    http.post(Uri.parse(url), body: {'id_brg': widget.list[widget.index]['id_brg']});
  }

  void confirm() {
    AlertDialog alertDialog = new AlertDialog(
      content: new Text(
          "Apakah akan menghapus data ${widget.list[widget.index]['nama_brg']} ?"),
      actions: <Widget>[
        new RaisedButton(
          child: new Text("Batal", style: new TextStyle(color: Colors.black)),
          color: Colors.grey,
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        new RaisedButton(
          child: new Text(
            "Ya",
            style: new TextStyle(color: Colors.white),
          ),
          color: Colors.black,
          onPressed: () {
            deleteData();

            Navigator.pushReplacementNamed(context, '/Home');
          },
        ),
      ],
    );

    showDialog(context: context, builder: (_) => alertDialog);
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar:
            new AppBar(backgroundColor: Colors.black,title: new Text("${widget.list[widget.index]['nama_brg']}")),
        body: Padding(
          padding: const EdgeInsets.all(40.0),
          child: ListView(
            children: [
              Text(
                "Nama Barang : ${widget.list[widget.index]['nama_brg']}",
                style: new TextStyle(fontSize: 20.0),
              ),
              Text(
                "Stok : ${widget.list[widget.index]['stok']}",
                style: new TextStyle(fontSize: 20.0),
              ),
              Text(
                "Harga : ${widget.list[widget.index]['harga']}",
                style: new TextStyle(fontSize: 20.0),
              ),
              SizedBox(
                width: 50,
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  new RaisedButton(
                    child: new Text("EDIT", style: TextStyle(color: Colors.white),),
                    color: Colors.black,
                    onPressed: () =>
                        Navigator.of(context).push(new MaterialPageRoute(
                      builder: (BuildContext context) => new EditBarang(
                        list: widget.list,
                        index: widget.index,
                      ),
                    )),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  new RaisedButton(
                    child: new Text("HAPUS"),
                    color: Colors.grey,
                    onPressed: () => confirm(),
                  ),
                ],
              )
            ],
          ),
        ));
  }
}
