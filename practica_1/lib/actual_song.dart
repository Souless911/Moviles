import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class actualSong extends StatefulWidget {
  final artist;
  final album;
  final image;
  final title;
  final g_link;
  final spotify;
  final apple;
  final release_date;
  final favorites;
  const actualSong({
    super.key,
    this.favorites,
    this.artist,
    this.album,
    this.image,
    this.title,
    this.apple,
    this.spotify,
    this.g_link,
    this.release_date,
  });

  @override
  State<actualSong> createState() => _actualSongState();
}

void _launchURL(_url) async {
  if (!await launch(_url)) throw 'No se pudo acceder a: $_url';
}

bool fav = false;

class _actualSongState extends State<actualSong> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              if (fav == false) {
                const snackBar = SnackBar(
                  content: Text("Agregado a Favoritos"),
                );
                ScaffoldMessenger.of(context)
                  ..hideCurrentSnackBar()
                  ..showSnackBar(snackBar);
              }
            },
            icon: Icon(
              Icons.favorite,
            ),
          )
        ],
      ),
      body: Container(
        child: Column(
          children: [
            Image.network(
              "${widget.image}",
            ),
            Expanded(
              child: Column(
                children: [
                  Text(
                    "${widget.title}",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    "${widget.album}",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    "${widget.artist}",
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey,
                    ),
                  ),
                  Text(
                    "${widget.release_date}",
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey,
                    ),
                  )
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(
                  iconSize: 40,
                  onPressed: () {
                    _launchURL("${widget.spotify}");
                  },
                  icon: Icon(Icons.music_note),
                  color: Colors.white,
                ),
                IconButton(
                  iconSize: 40,
                  onPressed: () {
                    _launchURL("${widget.g_link}");
                  },
                  icon: Icon(Icons.podcasts_rounded),
                  color: Colors.white,
                ),
                IconButton(
                  iconSize: 40,
                  onPressed: () {
                    _launchURL("${widget.apple}");
                  },
                  icon: Icon(Icons.apple),
                  color: Colors.white,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
