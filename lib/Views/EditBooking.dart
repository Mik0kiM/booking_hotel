import 'package:booking_hotel/Models/BookingModel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BookingEdit extends StatefulWidget {
  late final Function(Booking) onBookingAdded;
  late final Booking existingBooking; // New property to store existing expense data

  BookingEdit({required this.onBookingAdded, required this.existingBooking});

  @override
  _ExpenseEditState createState() => _ExpenseEditState();
}

class _ExpenseEditState extends State<BookingEdit> {
  late TextEditingController _nameController;
  late TextEditingController _emailController;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController(text: widget.existingBooking.name);
    _emailController = TextEditingController(text: widget.existingBooking.email);
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(10),
      child: Column(
        children: [
          ListTile(
            title: Text('Edit Expense'),
          ),
          ListTile(
            leading: Icon(Icons.edit),
            title: TextField(
              controller: _nameController,
              decoration: InputDecoration(labelText: 'Name'),
            ),
          ),
          ListTile(
            leading: Icon(Icons.alternate_email),
            title: TextField(
              controller: _emailController,
              decoration: InputDecoration(labelText: 'Email'),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              final editedBooking = Booking(
                name: _nameController.text,
                email: _emailController.text,
              );
              widget.onBookingAdded(editedBooking);
            },
            child: Text('Edit Expense'),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    super.dispose();
  }
}