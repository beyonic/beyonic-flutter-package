import 'dart:convert';

import 'package:beyonic_flutter/beyonicservice.dart';

class Webhook {
  final String id;
  final String target;
  final bool active;
  final String updated;
  final String event;

  Webhook(
      {this.id,
      this.target,
      this.active,
      this.updated,
      this.event
      });

  factory Webhook.fromJson(Map<String, dynamic> webhook) {
    return Webhook(
        id: webhook['id'].toString(),
        target: webhook['target'],
        active: webhook['active'],
        updated: webhook['updated'],
        event: webhook['event']
    );
  }

  static Resource<List<Webhook>> get all {
    return Resource(
        path: "webhooks",
        parse: (response) {
          final result = json.decode(response.body);
          Iterable list = result['results'];
          return list.map((model) => Webhook.fromJson(model)).toList();
        });
  }

  static Resource<Webhook> get single {
    return Resource(
      path: "webhooks",
      parse: (response) {
        final result = json.decode(response.body);
        return Webhook.fromJson(result);
      },
    );
  }
}
