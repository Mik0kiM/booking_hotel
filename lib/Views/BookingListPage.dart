import 'package:appwrite/models.dart';
import 'package:booking_hotel/Controllers/DatabaseController.dart';
import 'package:booking_hotel/Models/BookingModel.dart';
import 'package:booking_hotel/Views/EditBooking.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BookingListPage extends StatefulWidget {
  final List<Booking> bookings;
  final DatabaseController databaseController = Get.find<DatabaseController>();

  BookingListPage({required this.bookings});

  @override
  _BookingListPageState createState() => _BookingListPageState();
}

class _BookingListPageState extends State<BookingListPage> {
  late List<Document> appwriteBooking;
  final DatabaseController databaseController = Get.find<DatabaseController>();

  @override
  void initState() {
    super.initState();
    appwriteBooking = [];
    fetchDataFromAppwrite();
  }

  // Fetch data from Appwrite
  void fetchDataFromAppwrite() async {
    appwriteBooking = await widget.databaseController.getBookingFromAppwrite();
  }

  Future<void> refreshExpenses() async {
    final expenses = await widget.databaseController.getBookingFromAppwrite();
    setState(() {
      appwriteBooking = expenses;
    });
  }

  // In BookingListPage.dart
  void _editBooking(BuildContext context, Document document) {
    final booking = Booking(
      name: document.data['Name'],
      email: document.data['Email'],
      // Add other properties if needed
    );

    

    Get.to(
      BookingEdit(
        onBookingAdded: (editedBooking) async {
          await widget.databaseController.updateBookingInAppwrite(document.$id, editedBooking);
          // Refresh the UI or fetch the updated data
          // For simplicity, you can pop the context to go back to the list page
          Navigator.pop(context);
          fetchDataFromAppwrite();
        },
        existingBooking: booking,
      ),
    );
  }

Future<void> _deleteBooking(Document document) async {
    await databaseController.deleteBookingFromAppwrite(document.$id);
    setState(() {
      appwriteBooking.remove(document);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Booking List'),
      ),
      body: ListView.builder(
        itemCount: widget.bookings.length,
        itemBuilder: (context, index) {
          final booking = widget.bookings[index];

          return ListTile(
            title: Text(booking.name),
            subtitle: Text('Email: ${booking.email}'),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  icon: Icon(Icons.edit),
                  onPressed: () {
                    // Handle edit action
                    // You can navigate to an edit page or show a dialog
                    _editBooking(context, appwriteBooking[index]);
                  },
                ),
                IconButton(
                  icon: Icon(Icons.delete),
                  onPressed: () {
                    // Handle delete action
                    // You can show a confirmation dialog and delete the item if confirmed
                    _deleteBooking(appwriteBooking[index]);
                  },
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
