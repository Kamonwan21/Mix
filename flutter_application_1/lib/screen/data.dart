import 'package:flutter/material.dart';

class Data extends StatefulWidget {
  const Data({super.key});

  @override
  State<Data> createState() => _DataState();
}

class _DataState extends State<Data> {
  TextEditingController fullNameController = TextEditingController();
  TextEditingController buildingNameController = TextEditingController();
  TextEditingController bedNumberController = TextEditingController();
  TextEditingController foodTypeController = TextEditingController();
  TextEditingController timeController = TextEditingController();

  String name = "";
  String building = "";
  String roomNumber = "";
  String bedNumber = "";
  String type = "";
  String time = "";

  @override
  void dispose() {
    fullNameController.dispose();
    buildingNameController.dispose();
    bedNumberController.dispose();
    foodTypeController.dispose();
    timeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 182, 253, 223),
      body: Container(
        padding: EdgeInsets.only(top: 10),
        child: Column(
          children: [
            Transform.translate(
              offset: Offset(130, 20),
              child: Padding(
                padding: const EdgeInsets.only(right: 1.0),
                child: IconButton(
                  icon: Icon(Icons.home_rounded),
                  onPressed: () {},
                ),
              ),
            ),
            Transform.translate(
              offset: Offset(-130, 0),
              child: Text(
                'Prom Moh',
                style: TextStyle(
                  fontSize: 30.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: 20.0),
            Center(
              child: Container(
                width: 400,
                height: 590,
                decoration: ShapeDecoration(
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                padding: EdgeInsets.only(top: 30),
                child: Column(
                  children: [
                    Transform.translate(
                      offset: Offset(10, 2.0),
                      child: Text(
                        'ระบุข้อมูล',
                        style: TextStyle(
                          fontSize: 25.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextField(
                        controller: fullNameController,
                        decoration: InputDecoration(
                          labelText: 'ชื่อ-สกุล',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextField(
                        controller: buildingNameController,
                        decoration: InputDecoration(
                          labelText: 'ชื่อตึก',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextField(
                        controller: bedNumberController,
                        decoration: InputDecoration(
                          labelText: 'เลขเตียง',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextField(
                        controller: foodTypeController,
                        decoration: InputDecoration(
                          labelText: 'ประเภทอาหาร',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextField(
                        controller: timeController,
                        decoration: InputDecoration(
                          labelText: 'เวลา',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 30.0),
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        primary: Color(0xFF2DFCBE),
                        padding:
                            EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                      ),
                      child: Text(
                        'บันทึกข้อมูล',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment(1, 3),
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: IconButton(
                          icon: Icon(Icons.delete_outline),
                          onPressed: () {},
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
