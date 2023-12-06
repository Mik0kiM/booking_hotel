/*import 'package:booking_hotel/Controllers/DatabaseController.dart';
import 'package:booking_hotel/Models/BookingModel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BookingPage extends StatefulWidget {
  @override
  _BookingPageState createState() => _BookingPageState();
}

class _BookingPageState extends State<BookingPage> {
  final nameController = TextEditingController();
  final emailController = TextEditingController();
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
                final name = nameController.text;
                final email = emailController.text;
                if (name.isNotEmpty && email.isNotEmpty) {
                final booking = Booking(
                  name: name,
                  email: email,
                );
                DatabaseController databaseController = Get.find<DatabaseController>();
                databaseController.addExpenseToAppwrite(booking);

                nameController.clear();
                emailController.clear();
                
                setState(() {});
                //Get.back();
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
*/