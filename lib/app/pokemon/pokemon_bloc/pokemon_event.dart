part of 'pokemon_bloc.dart';


abstract class PokemonEvent {}

class LoadPokemonFromApiEvent extends PokemonEvent {}

class LoadPokemonFromApiRefreshEvent extends PokemonEvent {}

class LoadPokemonFromApiPaginationEvent extends PokemonEvent {}

