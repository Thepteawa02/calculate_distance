import "package:flutter/material.dart";
import "bus.dart";
import "taxi.dart";
import "bts.dart";
import "bustaxi.dart";

void main() {
  runApp(
    MaterialApp(
      home: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "เลือกประเภทรถโดยสาร\nที่ต้องการคำนวณ",
              style: TextStyle(color: Colors.deepPurple, fontSize: 35),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => BusPage()),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFF4400D5),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                fixedSize: Size(300, 80),
              ),
              child: Text(
                "รถโดยสารประจำทาง (รถเมล์)",
                style: TextStyle(fontSize: 20, color: Colors.white),
              ),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => TaxiPage()),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFF4400D5),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                fixedSize: Size(300, 80),
              ),
              child: Text(
                "รถรับจ้างประจำทาง (แท็กซี่)",
                style: TextStyle(fontSize: 20, color: Colors.white),
              ),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => BTSPage()),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFF4400D5),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                fixedSize: Size(300, 80),
              ),
              child: Text(
                "รถไฟฟ้า (BTS, MRT)",
                style: TextStyle(fontSize: 20, color: Colors.white),
              ),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => BusTaxiPage()),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFF4400D5),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                fixedSize: Size(300, 80),
              ),
              child: Text(
                "เช็คระยะทาง/ราคา โดยรวม",
                style: TextStyle(fontSize: 20, color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
