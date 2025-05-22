// lib/models/filme.dart
class Filme {
  final int? tmdbId; // Adicione este campo
  final String titulo;
  final String ano;
  final String? posterUrl;
  String? imdbId; // Torne mutável para poder atualizar depois
  final String? notaImdb;
  final String? sinopse;
  final String? diretor;
  final String? elenco;
  final String? genero;
  final String? rottenTomatoes;
  final String? originalTitle;

  Filme({
    this.tmdbId,
    required this.titulo,
    required this.ano,
    this.posterUrl,
    this.imdbId,
    this.notaImdb,
    this.sinopse,
    this.diretor,
    this.elenco,
    this.genero,
    this.rottenTomatoes,
    this.originalTitle,
  });

  // Factory para TMDB
  factory Filme.fromTmdbJson(Map<String, dynamic> json) {
    return Filme(
      tmdbId: json['id'], // Pegue o id do TMDB
      titulo: json['title'] ?? json['original_title'] ??'',
      ano: (json['release_date'] ?? '').split('-').first,
      posterUrl: json['poster_path'] != null
          ? 'https://image.tmdb.org/t/p/w500${json['poster_path']}'
          : null,
      imdbId: null, // Será preenchido depois
      originalTitle: json['original_title'],
    );
  }

  // Factory para OMDB
  factory Filme.fromOmdbJson(Map<String, dynamic> json) {
    String? rotten;
    if (json['Ratings'] is List) {
      for (final rating in json['Ratings']) {
        if (rating['Source'] == 'Rotten Tomatoes') {
          rotten = rating['Value'];
        }
      }
    }
    return Filme(
      titulo: json['Title'] ?? '',
      ano: json['Year'] ?? '',
      posterUrl: json['Poster'],
      imdbId: json['imdbID'],
      notaImdb: json['imdbRating'], // Só preencha aqui!
      sinopse: json['Plot'],
      diretor: json['Director'],
      elenco: json['Actors'],
      genero: json['Genre'],
      rottenTomatoes: rotten,
      originalTitle: json['Title'], // OMDB não tem original_title, mas preenche com Title
    );
  }

  Filme copyWith({
    int? tmdbId,
    String? titulo,
    String? ano,
    String? posterUrl,
    String? imdbId,
    String? notaImdb,
    String? sinopse,
    String? diretor,
    String? elenco,
    String? genero,
    String? rottenTomatoes,
    String? originalTitle,
  }) {
    return Filme(
      tmdbId: tmdbId ?? this.tmdbId,
      titulo: titulo ?? this.titulo,
      ano: ano ?? this.ano,
      posterUrl: posterUrl ?? this.posterUrl,
      imdbId: imdbId ?? this.imdbId,
      notaImdb: notaImdb ?? this.notaImdb,
      sinopse: sinopse ?? this.sinopse,
      diretor: diretor ?? this.diretor,
      elenco: elenco ?? this.elenco,
      genero: genero ?? this.genero,
      rottenTomatoes: rottenTomatoes ?? this.rottenTomatoes,
      originalTitle: originalTitle ?? this.originalTitle,
    );
  }
}