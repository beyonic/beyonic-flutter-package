import 'package:http/http.dart' as http;
import 'package:http/http.dart';

class Resource<T> {
  final String path;
  T Function(Response response) parse;

  Resource({this.path,this.parse});
}

class Webservice {
  Future<T> load<T>(Resource<T> resource, {apiKey, limit=0, offset=0}) async {
    Map<String, String> headers = {"Content-type": "application/json", "Authorization": "Token " + apiKey};
    final response = await http.get("https://app.beyonic.com/api/" + resource.path+"?limit=" + apiKey+ "&offset=" + offset.toString(), headers: headers);
    if(response.statusCode == 200) {
      return resource.parse(response);
    } else {
      throw Exception('Failed to load data!');
    }
  }

}