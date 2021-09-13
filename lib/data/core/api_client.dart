import 'dart:convert';

import 'package:http/http.dart';
import 'package:my_movie_app/data/core/api_constants.dart';

class ApiClient {
  final Client _client;

  ApiClient(this._client);

  dynamic get(String path) async {
    final response = await _client.get(Uri.parse(
        '${ApiConstants.Base_URL}$path?api_key=${ApiConstants.API_KEY}'),
        headers: {
          'Content-type': 'application/json'
        });

    print('${ApiConstants.Base_URL}$path?api_key=${ApiConstants.API_KEY}');

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception(response.reasonPhrase);
    }
  }
}