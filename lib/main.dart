import 'package:blod_pressure/InputScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Blood Pressure Classifier',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: InputScreen(),
    );
  }
}

class InputScreen extends StatelessWidget {
  final TextEditingController systolicController = TextEditingController();
  final TextEditingController diastolicController = TextEditingController();

  void validateAndNavigate(BuildContext context) {
    int? systolic = int.tryParse(systolicController.text);
    int? diastolic = int.tryParse(diastolicController.text);

    if (systolic == null ||
        diastolic == null ||
        systolic < 40 ||
        diastolic < 40) {
      Get.dialog(
        AlertDialog(
          title: Text('Invalid Input'),
          content: Text('Please enter valid blood pressure values'),
          actions: [
            TextButton(
              child: Text('OK'),
              onPressed: () {
                Get.back();
              },
            ),
          ],
        ),
      );
    } else {
      Get.to(InfoScreen(systolic: systolic, diastolic: diastolic));
    }
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromARGB(dart pub get),
          leading: IconButton(icon: Icon(Icons.menu), onPressed: () {}),
          actions: [
            IconButton(icon: Icon(Icons.more_vert), onPressed: () {}),
          ],
          title: Center(
            child: Text(
              'Blood Pressure Classifier',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 23,
                  color: Color.fromARGB(255, 115, 1, 1)),
            ),
          ),
        ),
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/images/img1.jpg'), fit: BoxFit.cover),
          ),
          child: Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 70,
                  width: 400,
                  clipBehavior: Clip.antiAlias,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    gradient: const LinearGradient(colors: [
                      Color.fromARGB(255, 178, 203, 232),
                      Color.fromARGB(255, 232, 195, 195),
                    ]),
                  ),
                  child: TextFormField(
                    textAlign: TextAlign.center,
                    textAlignVertical: TextAlignVertical.center,
                    controller: systolicController,
                    keyboardType: TextInputType.number,
                    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                    decoration:
                        const InputDecoration(labelText: 'Systolic (mm Hg)'),
                  ),
                ),
                SizedBox(height: 16.0),
                Container(
                  height: 70,
                  width: 400,
                  clipBehavior: Clip.antiAlias,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    gradient: const LinearGradient(colors: [
                      Color.fromARGB(255, 178, 203, 232),
                      Color.fromARGB(255, 232, 195, 195),
                    ]),
                  ),
                  child: TextFormField(
                    textAlign: TextAlign.center,
                    controller: diastolicController,
                    keyboardType: TextInputType.number,
                    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                    decoration:
                        const InputDecoration(labelText: 'Diastolic (mm Hg)'),
                  ),
                ),
                SizedBox(height: 25.0),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(fixedSize: Size(150, 50)),
                  onPressed: () => validateAndNavigate(context),
                  child: Text('Show Info'),
                ),
              ],
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
