import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class GoogleMaps extends StatefulWidget {
  @override
  State<GoogleMaps> createState() => _GoogleMapsState();
}

class _GoogleMapsState extends State<GoogleMaps> {
  final webViewController = WebViewController()
    ..loadRequest(Uri.parse('https://goo.gl/maps/5Y82b1Pn7JXMm2V4A'));

  @override
  Widget build(BuildContext context) {
    return WebViewWidget(controller: webViewController);
  }
}
