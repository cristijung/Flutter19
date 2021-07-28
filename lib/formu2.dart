import 'package:flutter/material.dart';
import 'produto.dart';

void main() => runApp(FormularioDois());

class FormularioDois extends StatelessWidget {
  final TextEditingController _controladorNome = TextEditingController();
  final TextEditingController _controladorQuantidade = TextEditingController();
  final TextEditingController _controladorValor = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: Text('Cadastrando produtos'),
          ),
          body: Column(
            children: <Widget>[
              //campo de texto
              TextField(
                //controlador de edição de texto
                //declarado nos atributos da classe
                controller: _controladorNome,
                //inserção do label-placeholder
                decoration: InputDecoration(labelText: 'Produto'),
                //keyboard type recurso q permite o 'autocorretor'
                //busca os recursos do teclado
                keyboardType: TextInputType.text,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 16.0),
              ),
              TextField(
                controller: _controladorQuantidade,
                decoration: InputDecoration(labelText: 'Quantidade'),
                keyboardType: TextInputType.number,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 16.0),
              ),
              TextField(
                controller: _controladorValor,
                decoration: InputDecoration(labelText: 'Valor'),
                keyboardType: TextInputType.number,
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
              ),
              RaisedButton(
                child: Text('Cadastrar'),
                onPressed: () {
                  final String nome = _controladorNome.text;
                  final int? quantidade =
                      int.tryParse(_controladorQuantidade.text);
                  final double? valor = double.tryParse(_controladorValor.text);
                },
              )
            ],
          )),
    );
  }
}

////Classe
class Produto {
  final String nome;
  final int quantidade;
  final double valor;

  Produto(
    this.nome,
    this.quantidade,
    this.valor,
  );

  @override
  String toString() {
    return 'Produto{Nome: $nome, Quantidade: $quantidade, Valor: $valor}';
  }
}
