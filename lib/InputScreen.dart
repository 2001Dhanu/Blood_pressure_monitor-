import 'package:flutter/material.dart';

class InfoScreen extends StatelessWidget {
  final int systolic;
  final int diastolic;

  InfoScreen({required this.systolic, required this.diastolic});

  String getCategory() {
    if (systolic < 120 && diastolic < 80) {
      return 'Normal';
    } else if (systolic >= 120 && systolic <= 129 && diastolic < 80) {
      return 'Elevated';
    } else if (systolic >= 130 &&
        systolic <= 139 &&
        diastolic >= 80 &&
        diastolic <= 89) {
      return 'Hypertension Stage 1';
    } else if (systolic >= 140 || diastolic >= 90) {
      return 'Hypertension Stage 2';
    } else {
      return 'Hypertensive crisis';
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 105, 173, 233),
          actions: [
            IconButton(icon: Icon(Icons.more_vert), onPressed: () {}),
          ],
          title: Center(
            child: Text(
              'Blood Pressure Info',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 23,
                  color: Color.fromARGB(255, 115, 1, 1)),
            ),
          ),
        ),
        body: Center(
          child: Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/images/img1.jpg'),
                  fit: BoxFit.cover),
            ),
            child: Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Center(
                    child: Text(
                      'Category: ${getCategory()}',
                      style: TextStyle(
                          fontSize: 25,
                          color: Colors.red,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  SizedBox(height: 45.0),
                  Text(
                    'Systolic: $systolic mm Hg',
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    'Diastolic: $diastolic mm Hg',
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ),
        ),
        bottomNavigationBar: SizedBox(
          height: 60,
          child: BottomAppBar(
            color: const Color.fromARGB(255, 105, 173, 233),
            elevation: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                IconButton(
                  icon: const Icon(Icons.search), // bottom icon left
                  color: const Color.fromARGB(255, 0, 0, 0),
                  iconSize: 35,
                  onPressed: () {},
                ),
                IconButton(
                  icon: const Icon(Icons.home_outlined), // bottom icon right
                  color: const Color.fromARGB(255, 0, 0, 0),
                  iconSize: 35,
                  onPressed: () {},
                ),
                IconButton(
                  icon: const Icon(Icons.history), // bottom icon left120
                  color: const Color.fromARGB(255, 0, 0, 0),
                  iconSize: 35,
                  onPressed: () {},
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
