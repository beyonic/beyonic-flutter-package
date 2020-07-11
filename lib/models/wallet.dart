import 'dart:convert';

import 'package:beyonic_flutter_library/beyonicservice.dart';

class Wallet {
  final String currency;
  final String balance;
  final String modified;

  Wallet({this.currency, this.balance, this.modified});

  factory Wallet.fromJson(Map<String, dynamic> json) {
    return Wallet(
      currency: json['currency'],
      balance: json['balance'].toString(),
      modified: json['modified'],
    );
  }

  static Resource<List<Wallet>> get all {

    return Resource(
        path: "accounts",
        parse: (response) {
          final result = json.decode(response.body);
          Iterable list = result['results'];
          return list.map((model) => Wallet.fromJson(model)).toList();
        }
    );

  }

  static Resource<Wallet> get single {
    return Resource(
      path: "accounts",
      parse: (response) {
        final result = json.decode(response.body);
        return Wallet.fromJson(result);
      },
    );
  }

}