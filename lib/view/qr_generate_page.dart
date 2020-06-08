import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

class QrGeneratePage extends StatefulWidget {
  @override
  _QrGeneratePageState createState() => _QrGeneratePageState();
}

class _QrGeneratePageState extends State<QrGeneratePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('QR')
      ),
      body: Container(
        child: Center(
          child: QrImage(
            data: "Panda",
            version: QrVersions.auto,
            size: 250.0,
            embeddedImage: AssetImage('assets/images/panda.png'),
            embeddedImageStyle: QrEmbeddedImageStyle(
              size: Size(30, 30),
            ),
          ),
        ),
      ),
    );
  }
}