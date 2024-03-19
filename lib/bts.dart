import "package:flutter/material.dart";
import "mrt.dart";
import "main.dart";

class BTSPage extends StatefulWidget {
  const BTSPage({Key? key}) : super(key: key);

  @override
  _BTSPageState createState() => _BTSPageState();
}

class _BTSPageState extends State<BTSPage> {
  TextEditingController _distanceController = TextEditingController();
  String _inputStation = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("คำนวณราคารถไฟฟ้า (BTS)"),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "คำนวณราคารถไฟฟ้า (BTS)",
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
                    int sukhumvitLine;
                    int silomLine;
                    int goldLine;
                    int yellowLine;
                    var pinkLine = "";

                    if (station == 1) {
                      sukhumvitLine = 16;
                      silomLine = 16;
                      yellowLine = 15;
                      pinkLine = "17-21";
                    } else if (station == 2) {
                      sukhumvitLine = 23;
                      silomLine = 23;
                      yellowLine = 19;
                      pinkLine = "17-21";
                    } else if (station == 3) {
                      sukhumvitLine = 26;
                      silomLine = 26;
                      yellowLine = 23;
                      pinkLine = "21-25";
                    } else if (station == 4) {
                      sukhumvitLine = 30;
                      silomLine = 30;
                      yellowLine = 27;
                      pinkLine = "23-29";
                    } else if (station == 5) {
                      sukhumvitLine = 33;
                      silomLine = 33;
                      yellowLine = 31;
                      pinkLine = "26-32";
                    } else if (station == 6) {
                      sukhumvitLine = 37;
                      silomLine = 37;
                      yellowLine = 35;
                      pinkLine = "28-36";
                    } else if (station == 7) {
                      sukhumvitLine = 40;
                      silomLine = 40;
                      yellowLine = 39;
                      pinkLine = "30-39";
                    } else if (station == 8) {
                      sukhumvitLine = 44;
                      silomLine = 44;
                      yellowLine = 43;
                      pinkLine = "36-42";
                    } else if (station == 9) {
                      sukhumvitLine = 44;
                      silomLine = 44;
                      yellowLine = 43;
                      pinkLine = "39-45";
                    } else if (station == 10) {
                      sukhumvitLine = 44;
                      silomLine = 44;
                      yellowLine = 43;
                      pinkLine = "41-45";
                    } else if (station == 11) {
                      sukhumvitLine = 44;
                      silomLine = 44;
                      yellowLine = 43;
                      pinkLine = "41-45";
                    } else if (station == 12) {
                      sukhumvitLine = 44;
                      silomLine = 44;
                      yellowLine = 43;
                      pinkLine = "44-45";
                    } else if (station >= 13 && station <= 15) {
                      sukhumvitLine = 44;
                      silomLine = 44;
                      yellowLine = 43;
                      pinkLine = "45";
                    } else {
                      sukhumvitLine = 59;
                      silomLine = 59;
                      yellowLine = 45;
                      pinkLine = "45";
                    }

                    goldLine = 15;

                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: Text("ราคารถไฟฟ้า BTS"),
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
                                      "สายสุขุมวิท: ${sukhumvitLine.toStringAsFixed(0)} บาท",
                                      style: TextStyle(fontSize: 16)),
                                  Text(
                                      "สายสีลม: ${silomLine.toStringAsFixed(0)} บาท",
                                      style: TextStyle(fontSize: 16)),
                                  Text(
                                      "สายสีทอง: ${goldLine.toStringAsFixed(0)} บาท",
                                      style: TextStyle(fontSize: 16)),
                                  Text(
                                      "สายสีเหลือง: ${yellowLine.toStringAsFixed(0)} บาท",
                                      style: TextStyle(fontSize: 16)),
                                  Text("สายสีชมพู: $pinkLine บาท",
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
                      MaterialPageRoute(builder: (context) => MRTPage()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFF4400D5),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: Text("MRT",
                      style: TextStyle(
                          fontSize: 20,
                          color: Color.fromARGB(255, 255, 255, 255))),
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
