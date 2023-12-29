import 'package:flutter_test/flutter_test.dart';
import 'package:booking_hotel/Models/BookingModel.dart';

void main() {
  testWidgets('PaymentMethodPage ...', (tester) async {
    final expenseModel  = ExpenseModel();
    final initialExpensesLength = expenseModel.bookings.length;
    final booking = Booking(
      name: 'Rere',
      email: 'rere123@gmail.com'
    );

    expenseModel.addExpense(booking);

    expect(expenseModel.bookings.length, initialExpensesLength + 1);
    expect(expenseModel.bookings.last.name, 'Rere');
    expect(expenseModel.bookings.last.email, 'rere123@gmail.com');
  });
}