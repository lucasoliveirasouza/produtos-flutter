
import 'dart:collection';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:produtos/models/produto.dart';

class ProdutoController extends ChangeNotifier{
  List<Produto> _produtos= [];

  UnmodifiableListView<Produto> get produtos => UnmodifiableListView(_produtos);

  ProdutoController() {
    _buscarProdutos();
  }
  _buscarProdutos() async {
    String uri = 'https://produtos-api-lucas.herokuapp.com/api/produtos';
    final response = await http.get(Uri.parse(uri), headers: {
      'Content-Type': 'application/json'
    });

    if (response.statusCode == 200) {
      final json = jsonDecode(response.body);

      List<dynamic> listaProdutos = json;

      listaProdutos.forEach((produto) {
        Produto c = Produto(produto["id"], produto["nome"], produto["quantidade"], produto["valor"]);
        _produtos.add(c);
      });
      notifyListeners();
    }

    print(_produtos.length);
  }
}