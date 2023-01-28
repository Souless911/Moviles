import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SnackBar Demo',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Mc Flutter- Juan M'),
        ),
        body: const HomePage(),
      ),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool tap = false;
  bool tap2 = false;
  bool tap3 = false;
  bool tap4 = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Container(
        margin: EdgeInsets.all(10.0),
        padding: const EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          border: Border.all(width: 5),
        ),
        child: Container(
          child: ListView(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.account_circle,
                    size: 50,
                  ),
                  Column(
                    children: [
                      Text(
                        "Flutter McFlutter",
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          fontSize: 17,
                        ),
                      ),
                      Text("Experienced App Developer"),
                    ],
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      Text(
                        "123 Main Street",
                      )
                    ],
                  ),
                  Column(
                    children: [
                      Text(
                        "(415) 555-0198",
                      )
                    ],
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    children: [
                      IconButton(
                          iconSize: 30,
                          color: tap ? Colors.indigo : Colors.black,
                          onPressed: () {
                            final snackBar = SnackBar(
                              content: const Text('Soy el primer boton'),
                              action: SnackBarAction(
                                label: 'Undo',
                                onPressed: () {
                                  // Some code to undo the change.
                                },
                              ),
                            );
                            ScaffoldMessenger.of(context)
                                .showSnackBar(snackBar);

                            tap = !tap;
                            setState(() {});
                          },
                          icon: Icon(Icons.accessibility_new)),
                    ],
                  ),
                  Column(
                    children: [
                      IconButton(
                          iconSize: 30,
                          color: tap2 ? Colors.indigo : Colors.black,
                          onPressed: () {
                            final snackBar = SnackBar(
                              content: const Text('Soy el segundo boton'),
                              action: SnackBarAction(
                                label: 'Undo',
                                onPressed: () {
                                  // Some code to undo the change.
                                },
                              ),
                            );
                            ScaffoldMessenger.of(context)
                                .showSnackBar(snackBar);

                            tap2 = !tap2;
                            setState(() {});
                          },
                          icon: Icon(Icons.punch_clock)),
                    ],
                  ),
                  Column(
                    children: [
                      IconButton(
                          iconSize: 30,
                          color: tap3 ? Colors.indigo : Colors.black,
                          onPressed: () {
                            final snackBar = SnackBar(
                              content: const Text('Soy el tercer boton'),
                              action: SnackBarAction(
                                label: 'Undo',
                                onPressed: () {
                                  // Some code to undo the change.
                                },
                              ),
                            );
                            ScaffoldMessenger.of(context)
                                .showSnackBar(snackBar);

                            tap3 = !tap3;
                            setState(() {});
                          },
                          icon: Icon(Icons.phone)),
                    ],
                  ),
                  Column(
                    children: [
                      IconButton(
                          iconSize: 30,
                          color: tap4 ? Colors.indigo : Colors.black,
                          onPressed: () {
                            final snackBar = SnackBar(
                              content: const Text('Soy el ultimo boton'),
                              action: SnackBarAction(
                                label: 'Undo',
                                onPressed: () {
                                  // Some code to undo the change.
                                },
                              ),
                            );
                            ScaffoldMessenger.of(context)
                                .showSnackBar(snackBar);

                            tap4 = !tap4;
                            setState(() {});
                          },
                          icon: Icon(Icons.phone)),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
