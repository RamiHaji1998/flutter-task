import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:untitled1/app/pokemon/pokemon_bloc/pokemon_bloc.dart';
import 'package:untitled1/core/constants/colors.dart';
import 'package:untitled1/core/widgets/custom_appbar.dart';
import 'package:untitled1/core/widgets/no_internet.dart';
import '../widgets/pokemon_items.dart';

class PokemonView extends StatelessWidget {
  const PokemonView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(color: ConstColors.backgroundColor,),
      body: BlocBuilder<PokemonBloc, PokemonState>(builder: (context, state) {
        PokemonBloc bloc = BlocProvider.of<PokemonBloc>(context);
        if (state is PokemonLoading) {
          return Center(
            child: CircularProgressIndicator(color: ConstColors.primaryColor),
          );
        } else if (state is PokemonError) {
          return NoInternetConnection(
              onRetryFunction: () => bloc.add(LoadPokemonFromApiEvent()));
        }
        return Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Pokemon',
                style: Theme.of(context).textTheme.bodyText2,
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                decoration: BoxDecoration(
                    color: Colors.grey.shade300,
                    borderRadius: BorderRadius.circular(10)),
                child: TextFormField(
                  decoration: const InputDecoration(
                    contentPadding: EdgeInsets.symmetric(horizontal: 8 , vertical: 15),
                      hintText: 'Which pokemon are you thinking of ?',
                      suffixIcon: Icon(Icons.search),
                      border: InputBorder.none,)
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Expanded(
                child: SmartRefresher(
                  enablePullDown: true,
                  enablePullUp: true,
                  header: const WaterDropHeader(),
                  footer: CustomFooter(
                    builder: (BuildContext context, LoadStatus? mode) {
                      Widget body;
                      if (mode == LoadStatus.idle) {
                        body = const Text("pull up load");
                      } else if (mode == LoadStatus.loading) {
                        body = CircularProgressIndicator(
                            color: ConstColors.primaryColor);
                      } else if (mode == LoadStatus.failed) {
                        body = const Text("Load Failed!Click retry!");
                      } else if (mode == LoadStatus.canLoading) {
                        body = const Text("release to load more");
                      } else {
                        body = const Text("No more Data");
                      }
                      return SizedBox(
                        height: 55.0,
                        child: Center(child: body),
                      );
                    },
                  ),
                  controller: bloc.refreshController,
                  onRefresh: () => bloc.add(LoadPokemonFromApiRefreshEvent()),
                  onLoading: () => bloc.add(LoadPokemonFromApiPaginationEvent()),
                  child: ListView.separated(
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return PokemonItems(
                        pokemon: bloc.pokemons[index],
                        pokemonDetails: bloc.pokemonDetails[index],
                        colorContainer: bloc.colors[Random().nextInt(7)],
                      );
                    },
                    itemCount: bloc.pokemons.length,
                    separatorBuilder: (context, index) {
                      return const SizedBox(
                        height: 20,
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        );
      }),
    );
  }
}
