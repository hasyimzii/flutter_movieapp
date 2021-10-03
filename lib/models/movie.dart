// movie model
class Movie {
  final String poster;
  final String title;
  final String director;

  Movie(
    this.poster,
    this.title,
    this.director,
  );

  set poster(String newPoster) {
    poster = newPoster;
  }

  set title(String newTitle) {
    title = newTitle;
  }

  set director(String newDirector) {
    director = newDirector;
  }
}
