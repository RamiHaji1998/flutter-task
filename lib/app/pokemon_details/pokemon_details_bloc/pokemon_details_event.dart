part of 'pokemon_details_bloc.dart';


abstract class PokemonDetailsEvent {}

class LoadOnePokemonEvent extends PokemonDetailsEvent {
  String url;
  LoadOnePokemonEvent({required this.url});
}
