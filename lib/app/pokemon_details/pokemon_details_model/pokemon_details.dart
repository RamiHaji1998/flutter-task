class PokemonDetails {
  const PokemonDetails({
    required this.name,
    required this.stats,
    required this.types,
  });
  final String name;
  final List<Stat> stats;
  final List<Type> types;

  factory PokemonDetails.fromJson(Map<String, dynamic> json) => PokemonDetails(
    name: json["name"],
    stats: List<Stat>.from(json["stats"].map((x) => Stat.fromJson(x))),
    types: List<Type>.from(json["types"].map((x) => Type.fromJson(x))),
  );

}

class Stat{
  const Stat({
    required this.baseStat,
    required this.effort,
    required this.stat,
  });

  final int baseStat;
  final int effort;
  final Species stat;

  factory Stat.fromJson(Map<String, dynamic> json) => Stat(
    baseStat: json["base_stat"],
    effort: json["effort"],
    stat: Species.fromJson(json["stat"]),
  );

}

class Species{
  const Species({
    required this.name,
    required this.url,
  });

  final String name;
  final String url;

  factory Species.fromJson(Map<String, dynamic> json) => Species(
    name: json["name"],
    url: json["url"],
  );

}

class Type{
  const Type({
    required this.slot,
    required this.type,
  });

  final int slot;
  final Species type;

  factory Type.fromJson(Map<String, dynamic> json) => Type(
    slot: json["slot"],
    type: Species.fromJson(json["type"]),
  );

}