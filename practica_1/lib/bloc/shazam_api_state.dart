//part of 'shazam_api_bloc.dart';

abstract class ShazamApiState {
  const ShazamApiState();

  List<Object?> get props => [];
}

class ShazamApiInitialState extends ShazamApiState {}

class ShazamListeningState extends ShazamApiState {}

class ShazamFindedState extends ShazamApiState {
  final title;
  final album;
  final artist;
  final image;
  final apple;
  final spotify;
  final g_link;
  final release_date;
  final List<Map<String, dynamic>> favorites;
  ShazamFindedState({
    required this.favorites,
    required this.title,
    required this.album,
    required this.artist,
    required this.image,
    required this.apple,
    required this.spotify,
    required this.g_link,
    required this.release_date,
  });

  @override
  List<Object?> get props => [
        title,
        album,
        artist,
        image,
        apple,
        spotify,
        g_link,
        release_date,
      ];
}

class ShazamFailedListening extends ShazamApiState {}
