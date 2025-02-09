import 'package:flutter/material.dart';

class VendasView extends StatefulWidget {
  final String title = 'VendasView';

  const VendasView({Key? key}) : super(key: key);

  @override
  VendasViewState createState() => VendasViewState();
}

class VendasViewState extends State<VendasView> {
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
