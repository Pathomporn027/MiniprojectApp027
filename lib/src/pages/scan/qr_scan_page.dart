import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';

class QRCodeScanPage extends StatefulWidget {
  @override
  _QRCodeScanPageState createState() => _QRCodeScanPageState();
}

class _QRCodeScanPageState extends State<QRCodeScanPage> {
  String qrCode = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Scan QR')),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
          ),
          SizedBox(height: 100),
          Image.asset('assets/images/qr-scan.png', height: 200,width: 200),
          SizedBox(height: 50),
          Text('Scan Result', style: TextStyle(
              fontSize: 16, color: Colors.red, fontWeight: FontWeight.bold),),
          SizedBox(height: 10,),
          Text('$qrCode', style: TextStyle(
              fontSize: 16, color: Colors.red, fontWeight: FontWeight.bold),),
          SizedBox(height: 10,),
          ElevatedButton(
            child: Text('Start QR Scan'),
            onPressed: () {
              scanQR();
            },
            style: ElevatedButton.styleFrom(
                primary: Colors.teal,
                padding: EdgeInsets.symmetric(horizontal: 40, vertical: 10),
                textStyle: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold)),
          ),
        ],
      ),
    );
  }

  Future<void> scanQR() async {
    String barcodeScanRes;
    try {
      barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
          '#ff6666', 'Cancel', true, ScanMode.QR);
      print(barcodeScanRes);
    } on PlatformException {
      barcodeScanRes = 'Failed to get platform version.';
    }

    if (!mounted) return;

    setState(() {
      this.qrCode = barcodeScanRes;
    });
  }
}//end class
