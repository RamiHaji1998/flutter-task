part of 'pokemon_details_bloc.dart';


abstract class PokemonDetailsState {}

class PokemonDetailsInitial extends PokemonDetailsState {}

class PokemonDetailsLoading extends PokemonDetailsState {}

class PokemonDetailsSuccess extends PokemonDetailsState {
  String name;
  List<Stat> stats = [];
  List<Type> types = [];

  PokemonDetailsSuccess({required this.name , required this.types , required this.stats});
}

class PokemonDetailsError extends PokemonDetailsState {}
