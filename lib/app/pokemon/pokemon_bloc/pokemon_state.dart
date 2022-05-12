part of 'pokemon_bloc.dart';

abstract class PokemonState {}

class PokemonInitial extends PokemonState {}

class PokemonLoaded extends PokemonState {
  List<Result> pokemons = [];
  PokemonLoaded({required this.pokemons});
}

class PokemonLoading extends PokemonState {}

class PokemonError extends PokemonState {}
