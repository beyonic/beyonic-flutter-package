import 'dart:convert';
import 'package:beyonic_flutter/beyonicservice.dart';

class Contact {
  int id;
  int organization;
  String first_name;
  String last_name;
  String full_name;
  String email;
  String phone_number;
  String type;
  bool status;

  Contact(
      {this.id,
      this.organization,
      this.first_name,
      this.last_name,
      this.full_name,
      this.email,
      this.phone_number,
      this.type,
      this.status});

  factory Contact.fromJson(Map<String, dynamic> json) {
    return Contact(
      id: json['id'],
      organization: json['organization'],
      first_name: json['first_name'],
      last_name: json['last_name'],
      full_name: "${json['first_name']} ${json['last_name']}",
      email: json['email'],
      phone_number: json['phone_number'],
      type: json['type'],
      status: json['status'] == 'active',
    );
  }

  static Resource<List<Contact>> get all {
    return Resource(
        path: "contacts",
        parse: (response) {
          final result = json.decode(response.body);
          Iterable list = result['results'];
          return list.map((model) => Contact.fromJson(model)).toList();
        });
  }


  static Resource<Contact> get single {
    return Resource(
      path: "contacts",
      parse: (response) {
        final result = json.decode(response.body);
        return Contact.fromJson(result);
      },
    );
  }

  static Resource<Contact> get create {
    return Resource(
        path: "contacts",
        parse: (response) {
          final result = json.decode(response.body);
          dynamic model = result['results'][0];
          return Contact.fromJson(model);
        });
  }
}
