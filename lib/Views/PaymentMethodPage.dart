import 'package:appwrite/models.dart';
import 'package:booking_hotel/Controllers/DatabaseController.dart';
import 'package:booking_hotel/Controllers/HotelDetailController.dart';
import 'package:booking_hotel/Models/BookingModel.dart';
import 'package:booking_hotel/Models/HotelModel.dart';
import 'package:booking_hotel/Views/BookingListPage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PaymentMethodPage extends StatefulWidget {
  final PaymentModel model;
  final PaymentMethodController controller;

  PaymentMethodPage({required this.model, required this.controller});

  @override
  _PaymentMethodPageState createState() => _PaymentMethodPageState();
}

class _PaymentMethodPageState extends State<PaymentMethodPage> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Metode Pembayaran"),
      ),
      body: ListView(
        padding: EdgeInsets.all(16.0),
        children: [
          Text("Pilih Metode Pembayaran"),
          Column(
            children: widget.model.metodePembayaranList
                .map((metode) => RadioListTile(
                      title: Text(metode),
                      value: metode,
                      groupValue: widget.model.paymentMethod,
                      onChanged: (String? selectedMetode) {
                        setState(() {
                          widget.controller.changePaymentMethod(selectedMetode!);
                        });
                      },
                    ))
                .toList(),
          ),
          Column(
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
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Harga per malam:"),
              Text("\$${widget.model.pricePerNight.toStringAsFixed(2)}"),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Pajak:"),
              Text("\$${widget.model.tax.toStringAsFixed(2)}"),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Jumlah Orang:"),
              Text("${widget.model.numberOfPeople}"),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Total:"),
              Text("\$${widget.model.total.toStringAsFixed(2)}"),
            ],
          ),
          SizedBox(height: 20),
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
              databaseController.addBookingToAppwrite(booking);

              nameController.clear();
              emailController.clear();
              
              setState(() {});
              }
            },
            child: Text("Confirm"),
          ),
          ElevatedButton(
            onPressed: () async {
              try {
                DatabaseController databaseController = Get.find<DatabaseController>();
                List<Document> expenses = await databaseController.getBookingFromAppwrite();

                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => BookingListPage(bookings: mapDocumentsToBookings(expenses)),
                  ),
                );
              } catch (error) {
                print("Error fetching expenses: $error");
              }
            },
            child: Text("See List"),
          )

        ],
      ),
    );
  }

  List<Booking> mapDocumentsToBookings(List<Document> documents) {
  return documents.map((document) {
    final data = document.data;
    return Booking(
      name: data['Name'] ?? '',
      email: data['Email'] ?? '',
    );
  }).toList();
}

}
