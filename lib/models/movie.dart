class Movie {
    Movie({
        required this.data,
        required this.message,
    });

    final List<MovieData> data;
    final String message;

    factory Movie.fromJson(Map<String, dynamic> json) => Movie(
        data: List<MovieData>.from(json["data"].map((x) => MovieData.fromJson(x))),
        message: json["message"],
    );
}

class MovieData {
    MovieData({
        required this.id,
        required this.title,
        required this.director,
        required this.year,
        required this.rating,
        required this.runtime,
        required this.age,
        required this.genre,
        required this.cast,
        required this.description,
        required this.image,
    });

    final String id;
    final String title;
    final String director;
    final String year;
    final String rating;
    final String runtime;
    final String age;
    final String genre;
    final String cast;
    final String description;
    final String image;

    factory MovieData.fromJson(Map<String, dynamic> json) => MovieData(
        id: json["id"],
        title: json["title"],
        director: json["director"],
        year: json["year"],
        rating: json["rating"],
        runtime: json["runtime"],
        age: json["age"],
        genre: json["genre"],
        cast: json["cast"],
        description: json["description"],
        image: json["image"],
    );
}
