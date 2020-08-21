# Beyonic Flutter Library

Flutter package for using the Beyonic APIs

## Using this package

You can call the various objects as outlined below:

```dart
import 'package:beyonic_flutter/beyonicservice.dart';

// load list of payments
Future List<Payment> _payments =  BeyonicService(apiKey: your_api_key).load(Payment.all, offset: 0);

// load single payment
Future <Payment> _payment =  BeyonicService(apiKey: your_api_key).load(Payment.single);

// create payment
Future <Payment> _payment =  BeyonicService(apiKey: your_api_key).create(Payment.create, params);


// load list of contacts
Future <Contact> _contacts =  BeyonicService(apiKey: your_api_key).load(Contact.all, offset: 0);

// load single contact
Future <Contact> _contact =  BeyonicService(apiKey: your_api_key).load(Contact.single);

// create contact
Future <Contact> _contact =  BeyonicService(apiKey: your_api_key).create(Contact.create, params);


```