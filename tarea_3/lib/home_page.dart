import 'package:flutter/material.dart';
import 'package:info_lugar/info_lugar.dart';
import 'package:info_lugar/item_actividad.dart';

class HomePage extends StatelessWidget {
  final List<Map<String, String>> _listElements = [
    {
      "title": "Day 1",
      "description": "Ground Round",
      "image": "https://i.imgur.com/s5tic4a.jpeg",
    },
    {
      "title": "Day 2",
      "description": "Grand Canyon",
      "image": "https://i.imgur.com/oVB4Li3.jpeg",
    },
    {
      "title": "Day 3",
      "description": "NYC",
      "image": "https://i.imgur.com/tX8VIEy.jpeg",
    },
    {
      "title": "Day 4",
      "description": "NYU",
      "image": "https://i.imgur.com/LdUGjv3.jpeg",
    },
    {
      "title": "Day 5",
      "description": "Seattle",
      "image": "https://i.imgur.com/8rHBl2P.jpeg",
    },
  ];
  HomePage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Reserva tu hotel'),
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          return Stack(
            fit: StackFit.expand,
            children: [
              Align(
                alignment: Alignment.topCenter,
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      image: new DecorationImage(
                          image: NetworkImage(
                              "https://images.pexels.com/photos/1525041/pexels-photo-1525041.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500"))),
                  height: MediaQuery.of(context).size.height / 4,
                  width: MediaQuery.of(context).size.width,
                ),
              ),
              // para poder poner column o listview en stack hay que encerrarlas en positioned y anclarla a todos lados
              Positioned(
                top: 64,
                bottom: 0,
                left: 0,
                right: 0,
                child: ListView(
                  children: [
                    InfoLugar(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ElevatedButton(
                          onPressed: () {},
                          child: Text("Details"),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.red,
                            foregroundColor: Colors.grey[200],
                          ),
                        ),
                        Text("Walkthrough Flight Detail"),
                      ],
                    ),
                    Container(
                      height: 200,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: 5,
                        itemBuilder: (BuildContext context, int index) {
                          return ItemActividad(
                            titulo: _listElements[index]["title"]!,
                            descripcion: _listElements[index]["description"]!,
                            image: _listElements[index]["image"]!,
                          );
                        },
                      ),
                    ),
                    MaterialButton(
                      onPressed: () {
                        final snackBar = SnackBar(
                          content: const Text('Reservacion en proceso'),
                          action: SnackBarAction(
                            label: 'Undo',
                            onPressed: () {
                              // Some code to undo the change.
                            },
                          ),
                        );
                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
                      },
                      child: Text(
                        "Start booking",
                        style: TextStyle(
                          color: Colors.grey,
                        ),
                      ),
                      color: Colors.red,
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
