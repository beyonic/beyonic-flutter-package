import 'package:http/http.dart' as http;
import 'package:http/http.dart';

import 'dart:async';
import 'dart:convert';

class Resource<T> {
  final String path;
  T Function(Response response) parse;

  Resource({this.path, this.parse});
}

class BeyonicService {
  String apiBaseUrl = "https://app.beyonic.com/api/";
  String apiKey;

  BeyonicService({this.apiKey});

  Future<T> load<T>(Resource<T> resource,
      {limit = 20, offset = 0, object_id}) async {
    Map<String, String> headers = {
      "Content-type": "application/json",
      "Authorization": "Token " + this.apiKey
    };
    String url;
    if (object_id == null) {
      // We are loading a list view
      url = apiBaseUrl +
          resource.path +
          "?limit=" +
          limit.toString() +
          "&offset=" +
          offset.toString();
    } else {
      // We are loading a read view
      url = apiBaseUrl + resource.path + "/" + object_id;
    }
    final response = await http.get(url, headers: headers);
    if (response.statusCode == 200) {
      return resource.parse(response);
    } else {
      throw Exception('Failed to load data!');
    }
  }

  Future<T> create<T>(Resource<T> resource, {params}) async {
    final http.Response response = await http.post(
      apiBaseUrl + resource.path,
      headers: {
        "Content-type": "application/json",
        "Authorization": "Token " + this.apiKey
      },
      body: jsonEncode(params),
    );
    if (response.statusCode == 201) {
      return resource.parse(response);
    } else {
      throw Exception('Failed to load data!');
    }
  }
}
