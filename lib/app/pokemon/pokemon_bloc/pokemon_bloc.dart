import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:untitled1/app/pokemon_details/pokemon_details_model/pokemon_details.dart';
import 'package:untitled1/app/pokemon/pokemon_model/pokemon_model.dart';
import 'package:untitled1/app/shared/pokemon_repositories.dart';
import 'package:untitled1/core/exceptions/exceptions.dart';
import 'package:untitled1/core/widgets/toast.dart';

part 'pokemon_event.dart';
part 'pokemon_state.dart';

class PokemonBloc extends Bloc<PokemonEvent, PokemonState> {
  final PokemonRepositories pokemonRepositories;

  List<Result> pokemons = [];
  List<PokemonDetails> pokemonDetails = [];
  List colors = [
    Colors.red,
    Colors.green,
    Colors.yellow,
    Colors.amber,
    Colors.blue,
    Colors.deepOrange,
    Colors.pink
  ];
  final RefreshController refreshController =
      RefreshController(initialRefresh: false);
  int offset = 0;

  PokemonBloc(this.pokemonRepositories) : super(PokemonInitial()) {
    on<LoadPokemonFromApiEvent>((event, emit) async {
      try {
        emit(PokemonLoading());
        pokemons = await pokemonRepositories.getPokemons(0);
        for (Result pokemon in pokemons) {
          pokemonDetails
              .add(await pokemonRepositories.getDetailsPokemon(pokemon.url));
        }
        offset = 20;
        refreshController.refreshCompleted();
        emit(PokemonLoaded(pokemons: pokemons));
      } on CustomException catch (e) {
        emit(PokemonError());
        CustomToast.showError(e.error);
      }
    });

    on<LoadPokemonFromApiRefreshEvent>((event, emit) async {
      try {
        pokemons.clear();
        pokemons = await pokemonRepositories.getPokemons(0);
        for (Result pokemon in pokemons) {
          pokemonDetails
              .add(await pokemonRepositories.getDetailsPokemon(pokemon.url));
        }
        offset = 20;
        refreshController.refreshCompleted();
        emit(PokemonLoaded(pokemons: pokemons));
      } on CustomException catch (e) {
        emit(PokemonError());
        CustomToast.showError(e.error);
      }
    });

    on<LoadPokemonFromApiPaginationEvent>((event, emit) async {
      try {
        pokemons.addAll(await pokemonRepositories.getPokemons(offset));
        for (int i = 0; i < pokemons.length - offset; i++) {
          pokemonDetails.add(await pokemonRepositories
              .getDetailsPokemon(pokemons[offset + i].url));
        }
        offset = offset + 20;
        refreshController.loadComplete();
        emit(PokemonLoaded(pokemons: pokemons));
      } on CustomException catch (e) {
        emit(PokemonError());
        CustomToast.showError(e.error);
      }
    });
  }
}
