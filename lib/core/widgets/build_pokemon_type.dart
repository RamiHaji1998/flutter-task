import 'dart:math';
import 'package:flutter/material.dart';
import 'package:untitled1/app/pokemon_details/pokemon_details_model/pokemon_details.dart';

//ignore: must_be_immutable
class PokemonTypeWidget extends StatelessWidget {
  PokemonTypeWidget({required this.pokemonDetails, Key? key}) : super(key: key);

  final PokemonDetails pokemonDetails;
  List colors = [
    Colors.red,
    Colors.green,
    Colors.yellow,
    Colors.amber,
    Colors.blue,
    Colors.deepOrange,
    Colors.pink
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      child: ListView.separated(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) => Container(
            height: 40,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: colors[Random().nextInt(7)]),
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: Text(pokemonDetails.types[index].type.name,
                  textAlign: TextAlign.center),
            )),
        itemCount: pokemonDetails.types.length,
        separatorBuilder: (context, index) => const SizedBox(width: 10),
      ),
    );
  }
}
