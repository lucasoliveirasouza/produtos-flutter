import 'package:flutter/material.dart';
import 'package:produtos/views/produtos/produto_lista.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Produto Lista',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: ProdutoListaView(),
    );
  }
}





