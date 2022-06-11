import 'package:flutter/material.dart';

class ProdutoListaView extends StatefulWidget {
  const ProdutoListaView({Key? key}) : super(key: key);

  @override
  _ProdutoListaViewState createState() => _ProdutoListaViewState();
}

class _ProdutoListaViewState extends State<ProdutoListaView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Lista de Produtos"),
      ),
    );
  }
}
