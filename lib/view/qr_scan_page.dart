import 'package:flutter/material.dart';
import 'package:barcode_scan/barcode_scan.dart';
import 'package:flutter_qr/view/webview.dart';
import 'package:string_validator/string_validator.dart';

class QrScanPage extends StatefulWidget {
  @override
  _QrScanPageState createState() => _QrScanPageState();
}

class _QrScanPageState extends State<QrScanPage> {
  String _barcode = '';

  void _showContent(String barcodeContent) {
    bool isUrl = isURL(barcodeContent);

    if (isUrl) {
      Navigator.push(context, MaterialPageRoute(builder: (_) => WebviewPage(url: barcodeContent,)));
    }
    else {
      setState(() {
        _barcode = barcodeContent;
      });
    }
  }

  void _main() async {
    var result = await BarcodeScanner.scan();

    switch (result.type) {
      case ResultType.Barcode:
        _showContent(result.rawContent);
        break;
      case ResultType.Cancelled:
        break;
      case ResultType.Error:
        break;
    }
  }

  @override
  void initState() {
    super.initState();
    _main();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Scanner')
      ),
      body: Container(
        child: Container(
          child: Text(_barcode ?? ''),
        ),
      )
    );
  }
}