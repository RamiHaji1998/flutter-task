import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled1/app/pokemon_details/pokemon_details_model/pokemon_details.dart';
import 'package:untitled1/core/constants/colors.dart';
import 'package:untitled1/core/widgets/custom_appbar.dart';
import '../../../core/widgets/build_pokemon_type.dart';
import '../../../core/widgets/no_internet.dart';
import '../pokemon_details_bloc/pokemon_details_bloc.dart';

class PokemonDetailsView extends StatelessWidget {
  const PokemonDetailsView({
    required this.url,
    Key? key,
  }) : super(key: key);
  final String url;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(color: ConstColors.disagreeColor),
      body: BlocBuilder<PokemonDetailsBloc, PokemonDetailsState>(
          builder: (context, state) {
        PokemonDetailsBloc bloc = BlocProvider.of<PokemonDetailsBloc>(context);
        if (state is PokemonDetailsLoading) {
          return Center(
              child: CircularProgressIndicator(
            color: ConstColors.primaryColor,
          ));
        } else if (state is PokemonDetailsSuccess) {
          return Stack(
            children: [
              Positioned(
                top: 0,
                left: 0,
                right: 0,
                child: Container(
                  height: MediaQuery.of(context).size.height / 4,
                  decoration: BoxDecoration(
                      color: ConstColors.disagreeColor,
                      borderRadius: const BorderRadius.only(
                          bottomLeft: Radius.circular(10),
                          bottomRight: Radius.circular(10))),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.asset('assets/images/pokeball.png',
                          height: 150, width: 60),
                      const SizedBox(
                        width: 20,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            state.name,
                            style: Theme.of(context).textTheme.bodyText2,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          PokemonTypeWidget(
                            pokemonDetails: PokemonDetails(
                                name: state.name,
                                stats: state.stats,
                                types: state.types),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
              Positioned(
                  top: 200,
                  left: 0,
                  right: 0,
                  child: Column(
                    children: [
                      const Text('Pokemon Base State:'),
                      const SizedBox(
                        height: 5,
                      ),
                      buildBaseState(state),
                    ],
                  ))
            ],
          );
        } else if (state is PokemonDetailsError) {
          return NoInternetConnection(
              onRetryFunction: () => bloc.add(LoadOnePokemonEvent(url: url)));
        }
        return const Center(child: Text('No Results'));
      }),
    );
  }

  Widget buildBaseState(PokemonDetailsSuccess state){
    return ListView.separated(
      shrinkWrap: true,
      itemBuilder: (context, index) {
        return SizedBox(
          height: 50,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Text(state.stats[index].stat.name,
                    textAlign: TextAlign.center),
                const SizedBox(
                  width: 10,
                ),
                Text(state.stats[index].baseStat.toString(),
                    textAlign: TextAlign.center),
                const SizedBox(
                  width: 10,
                ),
                Container(
                  width:
                  MediaQuery.of(context).size.width / 3,
                  height: 10,
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50)
                  ),
                  child: LinearProgressIndicator(
                    backgroundColor: Colors.grey,
                    valueColor: AlwaysStoppedAnimation(ConstColors.primaryColor),
                    value: state.stats[index].baseStat / 100,
                  ),
                )
              ],
            ),
          ),
        );
      },
      itemCount: state.stats.length,
      separatorBuilder: (BuildContext context, int index) {
        return const SizedBox(
          width: 10,
        );
      },
    );
  }
}
