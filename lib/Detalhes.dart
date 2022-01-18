import 'package:flutter/material.dart';

class Detalhes extends StatefulWidget {
  final String fruta;
  const Detalhes({Key? key, required this.fruta}) : super(key: key);

  @override
  _DetalhesState createState() => _DetalhesState();
}

class _DetalhesState extends State<Detalhes> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.fruta),
      ),
    );
  }
}
