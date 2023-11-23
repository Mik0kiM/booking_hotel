import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../Controllers/HotelDetailController.dart';
import '../Models/HotelModel.dart';

class PaymentMethodPage extends StatelessWidget {
  final PaymentModel model;
  final PaymentMethodController controller;

  PaymentMethodPage({required this.model, required this.controller});

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
            children: model.metodePembayaranList
                .map((metode) => RadioListTile(
              title: Text(metode),
              value: metode,
              groupValue: model.paymentMethod,
              onChanged: (String? selectedMetode) {
                controller.changePaymentMethod(selectedMetode!);
              },
            ))
                .toList(),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Harga per malam:"),
              Text("\$${model.pricePerNight.toStringAsFixed(2)}"),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Pajak:"),
              Text("\$${model.tax.toStringAsFixed(2)}"),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Jumlah Orang:"),
              Text("${model.numberOfPeople}"),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Total:"),
              Text("\$${model.total.toStringAsFixed(2)}"),
            ],
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              controller.confirmPayment();
            },
            child: Text("Confirm"),
          ),
        ],
      ),
    );
  }
}