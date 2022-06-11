
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:produtos/controllers/produto_controller.dart';
import 'package:provider/provider.dart';

class ProdutoCadastroView extends StatefulWidget {
  const ProdutoCadastroView({Key? key}) : super(key: key);

  @override
  _ProdutoCadastroViewState createState() => _ProdutoCadastroViewState();
}

class _ProdutoCadastroViewState extends State<ProdutoCadastroView> {
  final nome = TextEditingController();
  final quantidade = TextEditingController();
  final valor = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cadastrar produto"),
      ),

      body: Form(
        key: formKey,
        child: Container(
          padding: EdgeInsets.only(right: 20, top: 20, left: 20),
          child: ListView(
            children: [
              TextFormField(
                controller: nome,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  label: Text("Nome"),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      new Radius.circular(10.0),
                    ),
                  ),
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Informe o nome do produto";
                  }
                  return null;
                },
              ),
              SizedBox(
                height: 15,
              ),
              TextFormField(
                controller: quantidade,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  label: Text("Quantidade"),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      new Radius.circular(10.0),
                    ),
                  ),
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Informe a quantidade do produto";
                  }
                  return null;
                },
              ),
              SizedBox(
                height: 15,
              ),
              TextFormField(
                controller: valor,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  label: Text("Valor"),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      new Radius.circular(10.0),
                    ),
                  ),
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Informe o valor do produto ";
                  }
                  return null;
                },
              ),

              SizedBox(
                height: 20,
              ),

              Container(
                height: 50,
                child: ElevatedButton(
                  onPressed: (){
                    if (formKey.currentState!.validate()) {
                      Provider.of<ProdutoController>(context, listen: false)
                          .cadastrarProduto(nome.text, quantidade.text, valor.text);
                      Get.back();
                    }

                  },
                  child: Text("Salvar"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
