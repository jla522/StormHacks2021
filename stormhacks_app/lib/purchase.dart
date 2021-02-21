import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';


//enum ScanMode {QR, BARCODE, DEFAULT}

class Purchase extends StatefulWidget {
  Purchase({Key key}) : super(key: key);

  @override
  _PurchaseState createState() => _PurchaseState();
}

class _PurchaseState extends State<Purchase>{
  String qrCode = 'Unknown';

  @override
  Widget build(BuildContext context){
    return Dialog(
      insetPadding: EdgeInsets.fromLTRB(30,300,30,350),
      //shape: RoundedRectangleBorder(
      //  borderRadius: BorderRadius.all(Radius.circular(roundedEdges)),
      //),
      elevation: 2,
      backgroundColor: Color(0xFFC4C4C4),
      child: contentBox(context)
    );
  }

  contentBox(context){
    return Align(
      alignment: Alignment.center,
      child: Container(
        width: 300,
        height: 300,
        padding: EdgeInsets.fromLTRB(15,30,15,30),
        decoration: BoxDecoration(
          shape: BoxShape.rectangle,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget> [
            Text(
              "Order now or later?",
              style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget> [
                Container(
                  width:120,
                  height: 50,
                  child: TextButton(
                    child: Text('Order Ahead'),
                    style: TextButton.styleFrom(
                      primary: Colors.black,
                      backgroundColor: Color(0xFF21B7E6),
                      textStyle: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                      ),
                    ),
                    onPressed: () {
                    },
                  ),
                ),
                Container(
                  width:120,
                  height: 50,
                  child: TextButton(
                    child: Text('Pay Now (QR)'),
                    style: TextButton.styleFrom(
                      primary: Colors.black,
                      backgroundColor: Color(0xFF21B7E6),
                      textStyle: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                      ),
                    ),
                    onPressed: () => _scan(),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      
    );
  }

  Future<void> _scan() async{
    try{
      final qrCode = await FlutterBarcodeScanner.scanBarcode(
        '#ff6666',
        'Cancel',
        true,
        ScanMode.QR,
      );

      if (!mounted) return;

      setState((){
        this.qrCode = qrCode;
      });
    } on PlatformException  {
      qrCode = 'Failed to get platform version.';
    }
  }
    
}
