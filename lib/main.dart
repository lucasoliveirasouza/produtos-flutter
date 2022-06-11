import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:produtos/controllers/produto_controller.dart';
import 'package:produtos/views/produtos/produto_lista.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (context) => ProdutoController()),
    ],
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Produto Lista',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      home: ProdutoListaView(),
    );
  }
}





