import 'package:appwrite/appwrite.dart';
import 'package:flutter/material.dart';

class Booking {
  String name = "";
  String email = "";

  Booking({
    required this.name, 
    required this.email
  });
}

class ExpenseModel with ChangeNotifier {
  List<Booking> bookings = [];
  late final Databases database;

  void addExpense(Booking booking) async{
    bookings.add(booking);
    notifyListeners();
  }
}