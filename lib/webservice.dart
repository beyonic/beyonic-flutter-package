import 'package:http/http.dart' as http;
import 'package:http/http.dart';

class Resource<T> {
  final String path;
  T Function(Response response) parse;

  Resource({this.path,this.parse});
}

class Webservice {
  String apiBaseUrl = "https://app.beyonic.com/api/";

  Future<T> load<T>(Resource<T> resource, {apiKey, limit=20, offset=0, object_id}) async {
    Map<String, String> headers = {"Content-type": "application/json", "Authorization": "Token " + apiKey};
    String url;
    if (object_id == null){
      // We are loading a list view
      url = apiBaseUrl + resource.path + "?limit=" + limit.toString()+ "&offset=" + offset.toString();
    }else{
      // We are loading a read view
      url = apiBaseUrl + resource.path + "/" + object_id;
    }
    final response = await http.get(url, headers: headers);
    if(response.statusCode == 200) {
      return resource.parse(response);
    } else {
      throw Exception('Failed to load data!');
    }
  }

}