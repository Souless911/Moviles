import 'package:flutter/material.dart';

class ItemActividad extends StatelessWidget {
  final String image;
  final String titulo;
  final String descripcion;
  ItemActividad(
      {super.key,
      required this.image,
      required this.titulo,
      required this.descripcion});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
              height: 120,
              width: 120,
              child: Image.network(
                "$image",
                fit: BoxFit.fill,
              )),
          Text("${titulo}", style: TextStyle(fontSize: 11)),
          Text("${descripcion}"),
        ],
      ),
    );
  }
}
