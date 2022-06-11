import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:produtos/controllers/produto_controller.dart';
import 'package:produtos/models/produto.dart';
import 'package:produtos/views/produtos/produto_cadastro.dart';
import 'package:produtos/views/produtos/produto_detalhes.dart';
import 'package:provider/provider.dart';

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
      body: Consumer<ProdutoController>(
        builder: (context, repositorio, child) {
          return ListView.separated(
            itemCount: repositorio.produtos.length,
            itemBuilder: (BuildContext contexto, int produto) {
              final List<Produto> lista = repositorio.produtos;
              return Card(
                child: ListTile(
                  trailing: Text(lista[produto].quantidade.toString()),
                  title: Text(lista[produto].nome),
                  subtitle: Text("RS " + lista[produto].valor.toString()),
                  onTap: (){
                    Get.to(() => ProdutoDetalhesView(produto: lista[produto]));
                  },
                ),
              );
            },
            separatorBuilder: (_, __) => Container(),
            padding: EdgeInsets.all(16),
          );
        },
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Get.to(() => ProdutoCadastroView());
        },
        child: Icon(Icons.add),
      ),

    );
  }
}
