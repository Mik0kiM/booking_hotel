import 'package:booking_hotel/Models/HotelModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:booking_hotel/Controllers/HotelDetailController.dart';
import 'package:booking_hotel/Views/PaymentMethodPage.dart';

void main() {
  testWidgets('PaymentMethodPage UI Test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    final PaymentModel paymentModel = PaymentModel(
      pricePerNight: 100.0,
      tax: 10.0,
    );

    final PaymentMethodController paymentController = PaymentMethodController(paymentModel);

    await tester.pumpWidget(
      MaterialApp(
        home: PaymentMethodPage(model: paymentModel, controller: paymentController),
      ),
    );

    // Verify the UI elements.
    expect(find.text('Metode Pembayaran'), findsOneWidget);
    expect(find.text('Pilih Metode Pembayaran'), findsOneWidget);

    // Simulate user interaction, e.g., tap on a button.
    await tester.tap(find.text('Confirm'));
    await tester.pump();

    // You can add more test cases as needed.

  });
}
