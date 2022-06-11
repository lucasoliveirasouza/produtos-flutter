import 'package:flutter/material.dart';
import 'package:produtos/models/produto.dart';

class ProdutoDetalhesView extends StatefulWidget {
  Produto produto;

  ProdutoDetalhesView({Key? key, required this.produto}) : super(key: key);

  @override
  _ProdutoDetalhesViewState createState() => _ProdutoDetalhesViewState();
}

class _ProdutoDetalhesViewState extends State<ProdutoDetalhesView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.produto.nome),
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: ListView(
          children: [
            Text(
              "Nome do produto: " + widget.produto.nome,
              style: TextStyle(
                fontSize: 20,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "Quantidade do produto: " + widget.produto.quantidade.toString(),
              style: TextStyle(
                  fontSize: 20,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "Valor do produto: RS " + widget.produto.valor.toString(),
              style: TextStyle(
                  fontSize: 20,
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Center(
              child: IconButton(
                icon: Icon(Icons.delete,
                size: 40,),
                onPressed: () {},
              ),
            )
          ],
        ),
      ),
    );
  }
}
