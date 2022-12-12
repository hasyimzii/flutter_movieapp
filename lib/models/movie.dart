class Movie {
    Movie({
        required this.data,
    });

    final List<MovieData> data;

    factory Movie.fromJson(Map<String, dynamic> json) => Movie(
        data: List<MovieData>.from(json["data"].map((x) => MovieData.fromJson(x))),
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
        required this.description,
        required this.url,
        required this.image,
    });

    final int id;
    final String title;
    final String director;
    final String year;
    final double rating;
    final String runtime;
    final String age;
    final String genre;
    final String description;
    final String url;
    final String image;

    factory MovieData.fromJson(Map<String, dynamic> json) => MovieData(
        id: json["id"],
        title: json["title"],
        director: json["director"],
        year: json["year"],
        rating: double.parse(json["rating"]),
        runtime: json["runtime"],
        age: json["age"],
        genre: json["genre"],
        description: json["description"],
        url: json["url"],
        image: json["image"],
    );
}
