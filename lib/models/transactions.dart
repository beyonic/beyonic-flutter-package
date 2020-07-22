import 'dart:convert';

import 'package:beyonic_flutter/beyonicservice.dart';

class Transaction {
  final String id;
  final String account;
  final String amount;
  final String description;
  final String created;
  final String type;

  Transaction({this.id,
    this.account,
    this.amount,
    this.description,
    this.created,
    this.type
  });

  factory Transaction.fromJson(Map<String, dynamic> payment) {
    return Transaction(
        id: payment['id'].toString(),
        account: payment['account'].toString(),
        amount: payment['amount'].toString(),
        description: payment['description'],
        created: payment['created'],
        type: payment['type']
    );
  }

  static Resource<List<Transaction>> get all {
    return Resource(
        path: "transactions",
        parse: (response) {
          final result = json.decode(response.body);
          Iterable list = result['results'];
          return list.map((model) => Transaction.fromJson(model)).toList();
        });
  }

  static Resource<Transaction> get single {
    return Resource(
      path: "transactions",
      parse: (response) {
        final result = json.decode(response.body);
        return Transaction.fromJson(result);
      },
    );
  }
}
