import 'dart:convert';
import 'package:beyonic_flutter/beyonicservice.dart';


class CollectionRequest {
  final String id;
  final String organization;
  final String amount;
  final String reason;
  final String currency;
  final String phonenumber;
  final String collection;
  final String success_message;
  final bool send_instructions;
  final String instructions;
  final String status;
  final String error_message;
  final String expiry_date;

  CollectionRequest({
      this.id,
      this.organization,
      this.amount,
      this.reason,
      this.currency,
      this.collection,
      this.phonenumber,
      this.success_message,
      this.send_instructions,
      this.instructions,
      this.status,
      this.error_message,
      this.expiry_date,
      });

  factory CollectionRequest.fromJson(Map<String, dynamic> collection_request) {
    return CollectionRequest(
      id: collection_request['id'].toString(),
      organization: collection_request['organization'].toString(),
      amount: collection_request['amount'],
      reason: collection_request['reason'],
      currency: collection_request['currency'],
      phonenumber: collection_request['phonenumber'],
      success_message: collection_request['success_message'],
      send_instructions: collection_request['send_instructions'],
      instructions: collection_request['instructions'],
      status: collection_request['status'],
      error_message: collection_request['error_message'],
      expiry_date: collection_request['expiry_date'],
    );
  }

  static Resource<List<CollectionRequest>> get all {
    return Resource(
        path: "collectionrequests",
        parse: (response) {
          final result = json.decode(response.body);
          Iterable list = result['results'];
          return list.map((model) => CollectionRequest.fromJson(model)).toList();
        });
  }

  static Resource<CollectionRequest> get single {
    return Resource(
      path: "collectionrequests",
      parse: (response) {
        final result = json.decode(response.body);
        return CollectionRequest.fromJson(result);
      },
    );
  }

  static Resource<CollectionRequest> get create {
    return Resource(
        path: "collectionrequests",
        parse: (response) {
          final model = json.decode(response.body);
          return CollectionRequest.fromJson(model);
        });
  }
}
