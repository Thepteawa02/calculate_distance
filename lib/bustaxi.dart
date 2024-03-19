import "package:flutter/material.dart";
import "main.dart";
import "btsmrt.dart";

class BusTaxiPage extends StatefulWidget {
  const BusTaxiPage({Key? key}) : super(key: key);

  @override
  _BusTaxiPageState createState() => _BusTaxiPageState();
}

class _BusTaxiPageState extends State<BusTaxiPage> {
  TextEditingController _distanceController = TextEditingController();
  String _inputDistance = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("คำนวณราคารถโดยสารรวม"),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "คำนวณราคารถโดยสารรวม",
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
                height: 50,
                child: TextField(
                  controller: _distanceController,
                  onChanged: (value) {
                    setState(() {
                      _inputDistance = value;
                    });
                  },
                  decoration: InputDecoration(
                    labelText: "ใส่ระยะทาง (กม.)",
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
                    if (_inputDistance.isEmpty ||
                        int.tryParse(_inputDistance) == null) {
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

                    int distance = int.tryParse(_inputDistance) ?? 0;
                    int redBus;
                    int blueBus;
                    int orangeBus;
                    int newblueBus;

                    if (distance <= 4) {
                      redBus = 8;
                      blueBus = 12;
                      orangeBus = 13;
                      newblueBus = 15;
                    } else if (distance > 4 && distance <= 8) {
                      redBus = 8;
                      blueBus = 12;
                      orangeBus = 15;
                      newblueBus = 20;
                    } else if (distance > 8 && distance <= 12) {
                      redBus = 8;
                      blueBus = 14;
                      orangeBus = 17;
                      newblueBus = 20;
                    } else if (distance > 12 && distance <= 16) {
                      redBus = 8;
                      blueBus = 16;
                      orangeBus = 19;
                      newblueBus = 20;
                    } else if (distance > 16 && distance <= 20) {
                      redBus = 8;
                      blueBus = 18;
                      orangeBus = 21;
                      newblueBus = 25;
                    } else if (distance > 20 && distance <= 24) {
                      redBus = 8;
                      blueBus = 20;
                      orangeBus = 23;
                      newblueBus = 25;
                    } else {
                      redBus = 8;
                      blueBus = 20;
                      orangeBus = 25;
                      newblueBus = 25;
                    }

                    int oldTaxiFare;
                    int newTaxiFare;

                    if (distance <= 1) {
                      oldTaxiFare = 35;
                    } else if (distance > 1 && distance <= 10) {
                      oldTaxiFare = 35 + ((distance - 1) * 6.50).ceil();
                    } else if (distance > 10 && distance <= 20) {
                      oldTaxiFare = 35 +
                          (9 * 6.50).ceil() +
                          ((distance - 10) * 7.00).ceil();
                    } else if (distance > 20 && distance <= 40) {
                      oldTaxiFare = 35 +
                          (9 * 6.50).ceil() +
                          (10 * 7.00).ceil() +
                          ((distance - 20) * 8.00).ceil();
                    } else if (distance > 40 && distance <= 60) {
                      oldTaxiFare = 35 +
                          (9 * 6.50).ceil() +
                          (10 * 7.00).ceil() +
                          (20 * 8.00).ceil() +
                          ((distance - 40) * 8.50).ceil();
                    } else if (distance > 60 && distance <= 80) {
                      oldTaxiFare = 35 +
                          (9 * 6.50).ceil() +
                          (10 * 7.00).ceil() +
                          (20 * 8.00).ceil() +
                          (20 * 8.50).ceil() +
                          ((distance - 60) * 9.00).ceil();
                    } else {
                      oldTaxiFare = 35 +
                          (9 * 6.50).ceil() +
                          (10 * 7.00).ceil() +
                          (20 * 8.00).ceil() +
                          (20 * 8.50).ceil() +
                          (20 * 9.00).ceil() +
                          ((distance - 80) * 10.50).ceil();
                    }

                    if (distance <= 1) {
                      newTaxiFare = 40;
                    } else if (distance > 1 && distance <= 10) {
                      newTaxiFare = 40 + ((distance - 1) * 6.50).ceil();
                    } else if (distance > 10 && distance <= 20) {
                      newTaxiFare = 40 +
                          (9 * 6.50).ceil() +
                          ((distance - 10) * 7.00).ceil();
                    } else if (distance > 20 && distance <= 40) {
                      newTaxiFare = 40 +
                          (9 * 6.50).ceil() +
                          (10 * 7.00).ceil() +
                          ((distance - 20) * 8.00).ceil();
                    } else if (distance > 40 && distance <= 60) {
                      newTaxiFare = 40 +
                          (9 * 6.50).ceil() +
                          (10 * 7.00).ceil() +
                          (20 * 8.00).ceil() +
                          ((distance - 40) * 8.50).ceil();
                    } else if (distance > 60 && distance <= 80) {
                      newTaxiFare = 40 +
                          (9 * 6.50).ceil() +
                          (10 * 7.00).ceil() +
                          (20 * 8.00).ceil() +
                          (20 * 8.50).ceil() +
                          ((distance - 60) * 9.00).ceil();
                    } else {
                      newTaxiFare = 40 +
                          (9 * 6.50).ceil() +
                          (10 * 7.00).ceil() +
                          (20 * 8.00).ceil() +
                          (20 * 8.50).ceil() +
                          (20 * 9.00).ceil() +
                          ((distance - 80) * 10.50).ceil();
                    }

                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: Text("ราคารถโดยสารรวม"),
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
                                  const Text("ราคารถโดยสารประจำทาง (รถเมล์)",
                                      style: TextStyle(fontSize: 22)),
                                  Text(
                                      "รถธรรมดา(ครีม-แดง): ${redBus.toString()} บาท",
                                      style: TextStyle(fontSize: 16)),
                                  Text(
                                      "รถปรับอากาศ(ครีม-น้ำเงิน): ${blueBus.toString()} บาท",
                                      style: TextStyle(fontSize: 16)),
                                  Text(
                                      "รถปรับอากาศ(ยูโรทู ส้ม): ${orangeBus.toString()} บาท",
                                      style: TextStyle(fontSize: 16)),
                                  Text(
                                      "รถปรับอากาศ(ฟ้า): ${newblueBus.toString()} บาท\n",
                                      style: TextStyle(fontSize: 16)),
                                  const Text("ราคารถรับจ้างประจำทาง (แท๊กซี่)",
                                      style: TextStyle(fontSize: 22)),
                                  Text("ราคาเดิม(35 บาท): $oldTaxiFare บาท",
                                      style: TextStyle(fontSize: 16)),
                                  Text("ราคาใหม่(40 บาท): $newTaxiFare บาท",
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
                  Text(
                    "ระยะทาง $_inputDistance กม.",
                    style: TextStyle(fontSize: 20),
                  ),
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
                      MaterialPageRoute(builder: (context) => BTSMRTPage()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFF4400D5),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: Text("รถไฟฟ้า",
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
