class Recipient {
  final String amount;
  final String phoneNumber;
  final String description;
  final String state;

  Recipient({this.amount, this.phoneNumber, this.description, this.state});

  factory Recipient.fromJson(Map<String, dynamic> json) {
    return Recipient(
      amount: json['amount'].toString(),
      phoneNumber: json['phonenumber'],
      description: json['description'],
      state: json['state'],
    );
  }
}
