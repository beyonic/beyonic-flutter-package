import 'dart:convert';
import 'package:beyonic_flutter_library/beyonicservice.dart';

import 'recipient.dart';

class Payment {
  final String id;
  final String description;
  final String amount;
  final String currency;
  final String state;
  final String lastError;
  final String pausedReason;
  final String modified;
  final String paymentType;
  final String chargedFee;
  final Iterable phoneNos;
  final String path = "payments";

  Payment(
      {this.id,
      this.description,
      this.amount,
      this.currency,
      this.state,
      this.lastError,
      this.pausedReason,
      this.modified,
      this.paymentType,
      this.chargedFee,
      this.phoneNos});

  factory Payment.fromJson(Map<String, dynamic> payment) {
    return Payment(
      id: payment['id'].toString(),
      description: payment['description'],
      amount: payment['amount'],
      currency: payment['currency'],
      state: payment['state'],
      lastError: payment['last_error'],
      pausedReason: payment['paused_reason'],
      modified: payment['modified'],
      paymentType: payment['payment_type'],
      chargedFee: payment['charged_fee'].toString(),
      phoneNos: json
          .decode(payment['phone_nos'].toString())
          .map((model) => Recipient.fromJson(model))
          .toList(),
    );
  }

  Resource<List<Payment>> get all {
    return Resource(
        path: this.path,
        parse: (response) {
          final result = json.decode(response.body);
          Iterable list = result['results'];
          return list.map((model) => Payment.fromJson(model)).toList();
        });
  }

  Resource<Payment> get single {
    return Resource(
      path: this.path,
      parse: (response) {
        final result = json.decode(response.body);
        return Payment.fromJson(result);
      },
    );
  }

  Resource<Payment> get create {
    return Resource(
        path: this.path,
        parse: (response) {
          final model = json.decode(response.body);
          return Payment.fromJson(model);
        });
  }
}
