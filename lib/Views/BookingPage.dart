// BookingPage.dart
import 'package:booking_hotel/Models/BookingModel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BookingPage extends StatefulWidget {
  @override
  _BookingPageState createState() => _BookingPageState();
}

class _BookingPageState extends State<BookingPage> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  int numberOfGuests = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Book Hotel'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Enter Your Information:'),
            SizedBox(height: 16.0),
            TextField(
              controller: nameController,
              decoration: InputDecoration(labelText: 'Name'),
            ),
            TextField(
              controller: emailController,
              decoration: InputDecoration(labelText: 'Email'),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                // Validate and save the booking information
                if (validateInputs()) {
                  BookingModel bookingModel = BookingModel(
                    name: nameController.text,
                    email: emailController.text,
                  );
                  // Handle the booking logic, you can pass the bookingModel to your controller
                  // or use it as needed.
                  // For simplicity, we'll print the data for now.
                  print("Booking Information: $bookingModel");

                  // Close the booking page
                  Get.back();
                }
              },
              child: Text('Book Now'),
            ),
          ],
        ),
      ),
    );
  }

  bool validateInputs() {
    if (nameController.text.isEmpty || emailController.text.isEmpty) {
      // Show an error message if name or email is empty
      Get.snackbar('Error', 'Name and email are required');
      return false;
    }
    return true;
  }
}
