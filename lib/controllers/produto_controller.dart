
import 'dart:collection';
import 'dart:convert';
import 'package:flutter/cupertino.dart';
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
  }

  Future<http.Response> cadastrarProduto(String nome, String quantidade,String valor) async{
    final http.Response response = await http.post(
      Uri.parse('https://produtos-api-lucas.herokuapp.com/api/produto'),
      headers: <String, String>{
        'Content-Type': 'application/json',
      },
      body: jsonEncode(<String, String>{
        'nome': nome,
        'quantidade': quantidade,
        'valor': valor,
      }),
    );

    _produtos.add(Produto(0, nome, double.parse(quantidade), double.parse(valor)));
    notifyListeners();

    return response;
  }

  Future<http.Response> editarProduto(String id, String nome, String quantidade,String valor) async{
    final http.Response response = await http.put(
      Uri.parse('https://produtos-api-lucas.herokuapp.com/api/produto'),
      headers: <String, String>{
        'Content-Type': 'application/json',
      },
      body: jsonEncode(<String, String>{
        'id': id,
        'nome': nome,
        'quantidade': quantidade,
        'valor': valor,
      }),
    );

    _produtos.forEach((element) {
      if (element.id.toString() == id) {
        element.nome = nome;
        element.quantidade = double.parse(quantidade);
        element.valor = double.parse(valor);

      }
    });
    notifyListeners();

    return response;
  }

  Future<http.Response> deletarProduto(String id,String nome, String quantidade,String valor) async {
    final http.Response response = await http.delete(
      Uri.parse('https://produtos-api-lucas.herokuapp.com/api/produto'),
      headers: <String, String>{
        'Content-Type': 'application/json',
      },
      body: jsonEncode(<String, String>{
        'id': id,
        'nome': nome,
        'quantidade': quantidade,
        'valor': valor,
      }),
    );
    _produtos.removeWhere((element) => element.nome == nome);
    notifyListeners();
    return response;
  }
}