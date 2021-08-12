import 'package:flutter_bloc_example/data/network/RestClient.dart';
import 'package:flutter_bloc_example/models/PlayerDataModel.dart';

class RestRequest {
  RestClient _playerApiProvider = RestClient();

  Future<List<Players>?> fetchPlayersByCountry(String ?countryId) =>
      _playerApiProvider.fetchPlayersByCountry(countryId);

  Future<List<Players>?> fetchPlayersByName(String name) =>
      _playerApiProvider.fetchPlayersByName(name);
}
