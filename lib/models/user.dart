import 'package:flutter/material.dart';
import 'package:project_db/models/address.dart';

import 'bank_card.dart';

class User {
  final int id;
  final String name;
  final String email;
  final String password;
  final String phone;
  final int age;
  final String gender;
  final int score;
  // final Adress? address1;
  // final Adress? address2;
  // final BankCard? card1;
  // final BankCard? card2;

  User({
    required this.id,
    required this.name,
    required this.email,
    required this.password,
    required this.phone,
    required this.age,
    required this.gender,
    required this.score,
    // this.address1,
    // this.address2,
    // this.card1,
    // this.card2,
  });

  User.fromJson(Map<String, dynamic> json)
      : id = json['ID'],
        name = json['Name'],
        email = json['Email'],
        password = json['Password'].toString(),
        phone = json['PhoneNumber'],
        age = json['Age'],
        gender = json['Gender'],
        score = json['Score'];
        // address1 = json['Address1'] != null
        //     ? Adress.fromJson(json['Address1'])
        //     : null,
        // address2 = json['Address2'] != null ? Adress.fromJson(json['Address2']) : null,
        // card1 = json['Card1'] != null ? BankCard.fromJson(json['Card1']) : null,
        // card2 = json['Card2'] != null ? BankCard.fromJson(json['Card2']) : null;


  toMap() {
    return {
      'ID': id,
      'Name': name,
      'Email': email,
      'Password': password,
      'PhoneNumber': phone,
      'Age': age,
      'Gender': gender,
      'Score': score,
      // 'Address1': address1,
      // 'Address2': address2,
      // 'Card1': card1,
      // 'Card2': card2,
    };
  }





}