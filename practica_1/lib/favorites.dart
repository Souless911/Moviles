import 'package:Fake_spotify/bloc/shazam_api_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'actual_song.dart';

class favoriteList extends StatefulWidget {
  const favoriteList({super.key});

  @override
  State<favoriteList> createState() => _favoriteListState();
}

class _favoriteListState extends State<favoriteList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Favorite List"),
      ),
      body: ListView.builder(
        itemCount: context.watch<ShazamApiBloc>().lista.length,
        itemBuilder: (BuildContext context, int index) {
          var favoritos = context.watch<ShazamApiBloc>().lista[index];
          print(favoritos);
          print(favoritos["artista"]);
          return GestureDetector(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => actualSong(
                  image: favoritos['imagen'],
                  artist: favoritos['artista'],
                  album: favoritos['album'],
                  title: favoritos['title'],
                  apple: favoritos['apple'],
                  spotify: favoritos['spotify'],
                  g_link: favoritos['g_link'],
                  release_date: favoritos['release_date'],
                ),
              ));
            },
            child: Card(
                child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                AspectRatio(
                  aspectRatio: 16 / 9,
                  child: Image.network(
                    "${favoritos["imagen"]}",
                    fit: BoxFit.cover,
                  ),
                ),
                Text("${favoritos["album"]}"),
                Text("${favoritos["artista"]}")
              ],
            )),
          );
        },
      ),
    );
  }
}
