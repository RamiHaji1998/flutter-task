import 'package:bloc/bloc.dart';
import '../../../core/exceptions/exceptions.dart';
import '../../../core/widgets/toast.dart';
import '../../shared/pokemon_repositories.dart';
import '../pokemon_details_model/pokemon_details.dart';

part 'pokemon_details_event.dart';
part 'pokemon_details_state.dart';

class PokemonDetailsBloc extends Bloc<PokemonDetailsEvent, PokemonDetailsState> {
  final PokemonRepositories pokemonRepositories = PokemonRepositories();

  PokemonDetails? pokemonDetails;

  PokemonDetailsBloc() : super(PokemonDetailsInitial()) {
    on<LoadOnePokemonEvent>((event, emit) async {
      try {
        emit(PokemonDetailsLoading());
        pokemonDetails = await pokemonRepositories.getDetailsPokemon(event.url);
        emit(PokemonDetailsSuccess(
            name: pokemonDetails!.name,
            stats: pokemonDetails!.stats,
            types: pokemonDetails!.types));
      } on CustomException catch (e) {
        emit(PokemonDetailsError());
        CustomToast.showError(e.error);
      }
    });
  }
}
