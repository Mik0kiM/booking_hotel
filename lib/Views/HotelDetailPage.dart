/*import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:booking_hotel/Controllers/auth_controller.dart';

import '../Controllers/HotelDetailController.dart';
import '../Models/HotelModel.dart';

class HotelDetailPage extends StatelessWidget {
  final AuthController _authController = Get.put(AuthController());
  final HotelModel model = Get.find();
  final HotelDetailController controller = Get.find();

  int jumlahOrang = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Detail Hotel"),
        actions: [
          IconButton(
            icon: Icon(Icons.exit_to_app),
            onPressed: () {
              _authController.logout();
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            ElevatedButton(
              onPressed: () {
                Get.toNamed('/profil'); // Navigasi ke halaman profil
              },
              child: Text('Buka Profil'),
            ),
            ElevatedButton(
              onPressed: () {
                Get.toNamed('/database'); // Navigasi ke halaman profil
              },
              child: Text('Buka data hotel'),
            ),

            Image.asset(
              'images/Screenshot 2023-10-14 081409.png',
              height: 200,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    model.name,
                    style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
                  ),
                  Text(model.location),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Harga: \$${model.pricePerNight.toStringAsFixed(2)}/malam",
                        style: TextStyle(fontSize: 18.0),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          controller.bookNow(context);
                        },
                        child: Text("Pesan Sekarang"),
                      ),
                    ],
                  ),
                  // Rating Bintang
                  Row(
                    children: [
                      Text(
                        "Rating: ",
                        style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                      ),
                      Row(
                        children: [
                          Icon(Icons.star, color: Colors.yellow, size: 24.0),
                          Icon(Icons.star, color: Colors.yellow, size: 24.0),
                          Icon(Icons.star, color: Colors.yellow, size: 24.0),
                          Icon(Icons.star, color: Colors.yellow, size: 24.0),
                          Icon(Icons.star_border, size: 24.0),
                        ],
                      ),
                      Text(" ${model.rating.toString()} (120 ulasan)"),
                    ],
                  ),

                  // Fasilitas
                  Text(
                    "Fasilitas",
                    style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                  ),
                  Text(model.facilities.join(', ')),

                  // Deskripsi
                  Text(
                    "Deskripsi Hotel",
                    style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                  ),
                  Text(model.description),

                  // Jarak antara deskripsi dan widget berikutnya
                  SizedBox(height: 16.0),

                  // Jumlah Orang
                  Text(
                    "Jumlah Orang: ${controller.jumlahOrang}", // Observe jumlahOrang from the controller
                    style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                  ),
                  Row(
                    children: [
                      IconButton(
                        onPressed: () {
                          controller.kurangOrang();
                        },
                        icon: Icon(Icons.remove),
                      ),
                      Obx(() => Text(controller.jumlahOrang.toString())), // Use Obx to observe jumlahOrang
                      IconButton(
                        onPressed: () {
                          controller.tambahOrang();
                        },
                        icon: Icon(Icons.add),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 18,
                horizontal: 10,
              ),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Nearby Location',
                    style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Get.toNamed('/webnearby');
                    },
                    child: Ink(
                      child: const Text(
                        'See All',
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w800,
                          fontSize: 13,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}*/