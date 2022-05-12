import 'package:dio/dio.dart';
import 'package:untitled1/app/pokemon_details/pokemon_details_model/pokemon_details.dart';
import 'package:untitled1/app/pokemon/pokemon_model/pokemon_model.dart';
import 'package:untitled1/core/constants/request_routes.dart';
import 'package:untitled1/core/dio/factory.dart';
import 'package:untitled1/core/exceptions/exceptions.dart';
import '../../core/dio/request_interceptor.dart';

class PokemonRepositories {
  final Dio dio = DioFactory.dioSetUp();

  Future<List<Result>> getPokemons(int lastId) async {
    try {
      final Response response = await dio.get(RequestRoutes.getPokemons,
          queryParameters: {'offset': lastId, 'limit': 20});
      return Result.myPokemon(response.data['results']);
    } catch (e) {
      throw ExceptionHandler(e);
    }
  }

  Future<PokemonDetails> getDetailsPokemon(String url)async{
    try {
      final BaseOptions options = BaseOptions(
        sendTimeout: 20000,
        connectTimeout: 20000,
        receiveTimeout: 40000,
        contentType: "application/json",
      );
      final Dio dioTemp = Dio(options);
      dioTemp.interceptors.addAll([
        RequestInterceptor(),
      ]);
      final Response response = await dioTemp.get(url);
      return PokemonDetails.fromJson(response.data);
    } catch (e) {
      throw ExceptionHandler(e);
    }
  }
}
