class Pokemon{
  const Pokemon({
    required this.count,
    required this.next,
    required this.previous,
    required this.results,
  });

  final int count;
  final String next;
  final String previous;
  final List<Result> results;

  factory Pokemon.fromJson(Map<String, dynamic> json) => Pokemon(
    count: json["count"],
    next: json["next"],
    previous: json["previous"],
    results: List<Result>.from(json["results"].map((x) => Result.fromJson(x))),
  );

  static List<Pokemon> myPokemon(List list) =>
      List<Pokemon>.from(list.map((x) => Pokemon.fromJson(x)));

}

class Result{
  const Result({
    required this.name,
    required this.url,
  });

  final String name;
  final String url;

  factory Result.fromJson(Map<String, dynamic> json) => Result(
    name: json["name"],
    url: json["url"],
  );

  static List<Result> myPokemon(List list) =>
      List<Result>.from(list.map((x) => Result.fromJson(x)));
}
