import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled1/app/pokemon/pokemon_bloc/pokemon_bloc.dart';
import 'package:untitled1/app/pokemon/pokemon_view/pokemon_view.dart';
import 'package:untitled1/app/shared/pokemon_repositories.dart';
import 'package:untitled1/core/theme/custom_theme.dart';

import 'app/pokemon_details/pokemon_details_bloc/pokemon_details_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: CustomTheme.lightTheme,
      home: MultiRepositoryProvider(
        providers: [
          RepositoryProvider(create: (context) => PokemonRepositories())
        ],
        child: MultiBlocProvider(providers: [
          BlocProvider<PokemonBloc>(
              create: (context) => PokemonBloc(
                  RepositoryProvider.of<PokemonRepositories>(context))
                ..add(LoadPokemonFromApiEvent())),
          BlocProvider<PokemonDetailsBloc>(
              create: (context) => PokemonDetailsBloc())
        ], child: const PokemonView()),
      ),
    );
  }
}
