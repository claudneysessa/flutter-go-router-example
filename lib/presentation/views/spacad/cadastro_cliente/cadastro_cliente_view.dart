import 'package:flutter/material.dart';

class CadastroClienteView extends StatefulWidget {
  final String title = 'CadastroClienteView';

  const CadastroClienteView({Key? key}) : super(key: key);

  @override
  CadastroClienteViewState createState() => CadastroClienteViewState();
}

class CadastroClienteViewState extends State<CadastroClienteView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        centerTitle: true,
      ),
      body: Container(),
    );
  }
}
