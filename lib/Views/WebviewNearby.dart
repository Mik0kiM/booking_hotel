import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:booking_hotel/Controllers/WebController.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebviewNearby extends GetView<WebviewhotelController> {
  const WebviewNearby({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Hotel Nearby"),
        centerTitle: true,
        backgroundColor: Colors.amber,
      ),
      body: WebViewWidget(controller: controller.webviewhotelnearby),
    );
  }
}