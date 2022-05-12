import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled1/app/pokemon/pokemon_model/pokemon_model.dart';
import 'package:untitled1/app/pokemon_details/pokemon_details_model/pokemon_details.dart';
import '../../../core/widgets/build_pokemon_type.dart';
import '../../pokemon_details/pokemon_details_bloc/pokemon_details_bloc.dart';
import '../../pokemon_details/pokemon_details_view/pokemon_details_view.dart';

class PokemonItems extends StatelessWidget {
  const PokemonItems(
      {required this.pokemon,
      required this.pokemonDetails,
      required this.colorContainer,
      Key? key})
      : super(key: key);

  final Result pokemon;
  final PokemonDetails pokemonDetails;
  final Color colorContainer;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height / 8,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20), color: colorContainer),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListTile(
          title: Padding(
            padding: const EdgeInsets.only(left: 8.0, bottom: 8.0),
            child: Text(pokemon.name,
                style: Theme.of(context)
                    .textTheme
                    .bodyText1!
                    .copyWith(color: Colors.white)),
          ),
          subtitle: PokemonTypeWidget(pokemonDetails: pokemonDetails),
          trailing: Padding(
            padding: const EdgeInsets.only(bottom: 2),
            child: Image.asset('assets/images/pokeball.png'),
          ),
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => BlocProvider.value(
                      value: PokemonDetailsBloc()
                        ..add(LoadOnePokemonEvent(url: pokemon.url)),
                      child: PokemonDetailsView(url: pokemon.url)),
                ));
          },
        ),
      ),
    );
  }
}
