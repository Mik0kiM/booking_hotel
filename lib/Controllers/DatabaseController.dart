import 'package:appwrite/appwrite.dart';
import 'package:appwrite/models.dart';
import 'package:booking_hotel/Controllers/ClientController.dart';
import 'package:booking_hotel/Models/BookingModel.dart';


class DatabaseController extends ClientController {
  late final Databases database;
  late Function() refreshCallback;

  void setRefreshCallback(Function() callback) {
    refreshCallback = callback; // Atur fungsi callback
  }

  @override
  void onInit() {
    super.onInit();
    // Inisialisasi koneksi ke Appwrite di sini
    database = Databases(client);
  }

  Future<void> addBookingToAppwrite(Booking booking) async {
    try {
      final data = {
        'Name': booking.name,
        'Email': booking.email,
      };

      final response = await database.createDocument(
        collectionId: '65701b6af15b6882bb75',
        data: data,
        databaseId: '65701b29620d89aeadb0',
        documentId: ID.unique(),
      );

      print('Expense added to Appwrite: ${response.data}');
    } catch (e) {
      print('Error adding expense to Appwrite: $e');
    }
  }

  Future<List<Document>> getBookingFromAppwrite() async {
    try {
      final response = await database.listDocuments(
        collectionId: "65701b6af15b6882bb75",
        databaseId: '65701b29620d89aeadb0',
      );

      return response.documents;
    } catch (error) {
      print("Error retrieving expenses: $error");
      return [];
    }
  }


  Future<void> updateBookingInAppwrite(String documentId,
      Booking booking) async {
    try {
      final data = {
        'Name': booking.name,
        'Email': booking.email,
      };
      final response = await database.updateDocument(
        collectionId: '65701b6af15b6882bb75',
        databaseId: '65701b29620d89aeadb0',
        documentId: documentId,
        // ID dokumen yang akan diperbarui
        data: data,
      );

      print('Expense updated in Appwrite: ${response.data}');
    } catch (e) {
      print('Error updating expense in Appwrite: $e');
    }
  }

  Future<void> deleteBookingFromAppwrite(String documentId) async {
    try {
      final response = await database.deleteDocument(
        collectionId: '65701b6af15b6882bb75',
        // Ganti dengan ID koleksi di Appwrite
        databaseId: '65701b29620d89aeadb0',
        documentId: documentId, // ID dokumen yang akan dihapus
      );

      print('Expense deleted from Appwrite: ${response.data}');
    } catch (e) {
      print('Error deleting expense from Appwrite: $e');
    }
  }
}