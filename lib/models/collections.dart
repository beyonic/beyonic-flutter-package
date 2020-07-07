import 'dart:convert';

import 'package:beyonic_flutter_library/webservice.dart';

class Collection {
  final String id;
  final String remoteTransactionId;
  final String amount;
  final String currency;
  final String status;
  final String paymentDate;
  final String reference;
  final String phoneNumber;

  Collection({this.id, this.remoteTransactionId, this.amount, this.currency, this.status,
    this.paymentDate, this.reference, this.phoneNumber});

  factory Collection.fromJson(Map<String, dynamic> payment) {
    return Collection(
      id: payment['id'].toString(),
      remoteTransactionId: payment['remote_transaction_id'],
      amount: payment['amount'],
      currency: payment['currency'],
      paymentDate: payment['payment_date'],
      status: payment['status'],
      phoneNumber: payment['phonenumber'],
      reference: payment['reference'].toString()
    );
  }

  static Resource<List<Collection>> get all {
    return Resource(
        path: "collections",
        parse: (response) {
          final result = json.decode(response.body);
          Iterable list = result['results'];
          return list.map((model) => Collection.fromJson(model)).toList();
        }
    );
  }

  static Resource<Collection> get single {
    return Resource(
        path: "collections",
        parse: (response) {
          final result = json.decode(response.body);
          return Collection.fromJson(result);
        },
    );
  }

}