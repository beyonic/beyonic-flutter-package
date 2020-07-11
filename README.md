# Beyonic Flutter Library

Flutter package for using the Beyonic APIs

## Using this package

You can call the various objects as outlined below:

```dart
// load list of payments
Future List<Payment> _payments =  Webservice(apiKey: your_api_key).load(Payment.all, offset: 0);

// load single payment
Future Payment _payment =  Webservice(apiKey: your_api_key).load(Payment.single);

// create payment
Future Payment _payment =  Webservice(apiKey: your_api_key).create(Payment.create, params);

```