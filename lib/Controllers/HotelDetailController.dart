import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Models/HotelModel.dart';
import '../Views/PaymentMethodPage.dart';

class HotelDetailController extends GetxController{
  final HotelModel model;

  var jumlahOrang = 1.obs;

  void tambahOrang() {
    jumlahOrang++;
    update(); // Memperbarui tampilan saat ada perubahan
  }

  void kurangOrang() {
    if (jumlahOrang > 1) {
      jumlahOrang--;
      update(); // Memperbarui tampilan saat ada perubahan
    }
  }


  HotelDetailController(this.model);


  void bookNow(BuildContext context) {
    PaymentModel paymentModel = PaymentModel(
      pricePerNight: model.pricePerNight,
      tax: 10.0, // Sesuaikan sesuai kebutuhan
    );

    PaymentMethodController paymentController = PaymentMethodController(paymentModel);

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => PaymentMethodPage(model: paymentModel, controller: paymentController,),
      ),
    );
  }

}

class PaymentMethodController {
  final PaymentModel model;

  PaymentMethodController(this.model);

  void changePaymentMethod(String method) {
    model.paymentMethod = method;
  }

  void confirmPayment() {
    // Tambahkan logika pembayaran di sini
  }
}
