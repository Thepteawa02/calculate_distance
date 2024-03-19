import "package:flutter/material.dart";
import "bts.dart";
import "main.dart";

class MRTPage extends StatefulWidget {
  const MRTPage({Key? key}) : super(key: key);

  @override
  _MRTPageState createState() => _MRTPageState();
}

class _MRTPageState extends State<MRTPage> {
  TextEditingController _distanceController = TextEditingController();
  String _inputStation = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("คำนวณราคารถไฟฟ้า (MRT)"),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "คำนวณราคารถไฟฟ้า (MRT)",
                style: TextStyle(
                  fontSize: 35,
                  fontWeight: FontWeight.bold,
                  color: Colors.deepPurple,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 20),
              SizedBox(
                width: 300,
                height: 40,
                child: TextField(
                  controller: _distanceController,
                  onChanged: (value) {
                    setState(() {
                      _inputStation = value;
                    });
                  },
                  decoration: InputDecoration(
                    labelText: "ใส่ระยะทาง (สถานี)",
                    border: OutlineInputBorder(),
                    contentPadding: EdgeInsets.all(10),
                  ),
                  keyboardType: TextInputType.number,
                ),
              ),
              SizedBox(height: 20),
              SizedBox(
                width: 300,
                height: 40,
                child: ElevatedButton(
                  onPressed: () {
                    if (_inputStation.isEmpty ||
                        int.tryParse(_inputStation) == null) {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: Text("แจ้งเตือน"),
                            content: Text(
                                "กรุณาใส่ข้อมูลเฉพาะตัวเลขที่เป็นจำนวนเต็มเท่านั้น"),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                child: Text("ตกลง"),
                              ),
                            ],
                          );
                        },
                      );
                      return;
                    }

                    int station = int.tryParse(_inputStation) ?? 0;
                    int BlueLine;
                    int PurpleLine;

                    if (station == 1) {
                      BlueLine = 17;
                      PurpleLine = 14;
                    } else if (station == 2) {
                      BlueLine = 19;
                      PurpleLine = 16;
                    } else if (station == 3) {
                      BlueLine = 21;
                      PurpleLine = 18;
                    } else if (station == 4) {
                      BlueLine = 24;
                      PurpleLine = 20;
                    } else if (station == 5) {
                      BlueLine = 26;
                      PurpleLine = 20;
                    } else if (station == 6) {
                      BlueLine = 29;
                      PurpleLine = 20;
                    } else if (station == 7) {
                      BlueLine = 31;
                      PurpleLine = 20;
                    } else if (station == 8) {
                      BlueLine = 33;
                      PurpleLine = 20;
                    } else if (station == 9) {
                      BlueLine = 36;
                      PurpleLine = 20;
                    } else if (station == 10) {
                      BlueLine = 38;
                      PurpleLine = 20;
                    } else if (station == 11) {
                      BlueLine = 41;
                      PurpleLine = 20;
                    } else if (station == 12) {
                      BlueLine = 43;
                      PurpleLine = 20;
                    } else {
                      BlueLine = 43;
                      PurpleLine = 20;
                    }

                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: Text("ราคารถไฟฟ้า MRT"),
                          content: SizedBox(
                            width: double.infinity,
                            child: Container(
                              padding: EdgeInsets.all(20),
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.black),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(
                                      "สายสีน้ำเงิน: ${BlueLine.toStringAsFixed(0)} บาท",
                                      style: TextStyle(fontSize: 16)),
                                  Text(
                                      "สายสีม่วง: ${PurpleLine.toStringAsFixed(0)} บาท",
                                      style: TextStyle(fontSize: 16)),
                                ],
                              ),
                            ),
                          ),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: Text("ตกลง"),
                            ),
                          ],
                        );
                      },
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFF4400D5),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: Text("คำนวณ",
                      style: TextStyle(fontSize: 20, color: Colors.white)),
                ),
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("ระยะทาง $_inputStation สถานี",
                      style: TextStyle(fontSize: 20)),
                ],
              ),
              SizedBox(height: 10),
              SizedBox(
                width: 300,
                height: 40,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              BTSPage()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFF4400D5),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: Text(
                    "BTS",
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                ),
              ),
              SizedBox(height: 10),
              SizedBox(
                width: 300,
                height: 40,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => MyApp()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFF4400D5),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: Text("หน้าหลัก",
                      style: TextStyle(fontSize: 20, color: Colors.white)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
