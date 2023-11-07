import 'package:flutter/material.dart';
import 'choice.dart';
import 'data.dart';
import '../models/user.dart';

class VIP_Room extends StatefulWidget {
  const VIP_Room({super.key});

  @override
  State<VIP_Room> createState() => _VIP_RoomState();
}

class _VIP_RoomState extends State<VIP_Room> {
  List<User> savedData = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 182, 253, 223),
      body: Container(
        padding: EdgeInsets.only(top: 10),
        child: Column(
          children: [
            Transform.translate(
              offset: Offset(150, 40),
              child: Padding(
                padding: const EdgeInsets.only(right: 1.0),
                child: IconButton(
                  icon: Icon(Icons.home_rounded),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Choice()));
                  },
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
            SizedBox(height: 30.0),
            Center(
              child: Container(
                  width: 250,
                  height: 85,
                  decoration: ShapeDecoration(
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  padding: EdgeInsets.only(top: 30),
                  child: Column(children: [
                    Transform.translate(
                      offset: Offset(10, 2.0),
                      child: Text(
                        'ห้องพิเศษ',
                        style: TextStyle(
                          fontSize: 40.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ])),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final result = await Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => Data()),
          );

          if (result != null && result is List<User>) {
            setState(() {
              savedData = result;
            });
          }
        },
        child: Icon(Icons.add),
        backgroundColor: Colors.black,
      ),
    );
  }
}
