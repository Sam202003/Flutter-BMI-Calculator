import 'package:flutter/material.dart';

void main() {
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BMICalculator(),
    );
  }
}

class BMICalculator extends StatefulWidget {
  @override
  _BMICalculatorState createState() => _BMICalculatorState();
}

class _BMICalculatorState extends State<BMICalculator> {


  TextEditingController wtController = TextEditingController();
  TextEditingController ftController = TextEditingController();
  TextEditingController inController = TextEditingController();


  Color bgColor = Colors.indigo.shade200;
  String result = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("BMI Calculator"),
      ),
      body: Container(
        color: bgColor,
        child: Center(
          child: Container(
            width: 380,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'BMI',
                  style: TextStyle(fontSize: 34, fontWeight: FontWeight.w500),
                ),
                SizedBox(height: 11),
                TextField(
                  controller: wtController,
                  decoration: const InputDecoration(
                    labelText: 'Enter your Weight',
                    prefixIcon: Icon(Icons.line_weight),
                  ),
                  keyboardType: TextInputType.number,
                ),
                SizedBox(height: 11),
                TextField(
                  controller: ftController,
                  decoration: const InputDecoration(
                    labelText: 'Enter your Height in feet',
                    prefixIcon: Icon(Icons.height),
                  ),
                  keyboardType: TextInputType.number,
                ),
                SizedBox(height: 11),
                TextField(
                  controller: inController,
                  decoration: const InputDecoration(
                    labelText: 'Enter your Height in inches',
                    prefixIcon: Icon(Icons.height),
                  ),
                  keyboardType: TextInputType.number,
                ),
                SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () {
                    calculateBMI();
                  },
                  child: Text("Calculate"),
                ),
                Text(
                  result,
                  style: TextStyle(fontSize: 19),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void calculateBMI() {
    var wt = wtController.text.toString();
    var ft = ftController.text.toString();
    var inch = inController.text.toString();

    if (wt.isNotEmpty && ft.isNotEmpty && inch.isNotEmpty) {


      var iWt = int.parse(wt);
      var iFt = int.parse(ft);
      var iInch = int.parse(inch);

      var tInch = (iFt * 12) + iInch;
      var tCm = tInch * 2.54;
      var tM = tCm / 100;

      var bmi = iWt / (tM * tM);

      var msg = "";

      setState(() {

        if (bmi > 25) {
          msg = "You're Overweight";
          result = "$msg\nYour BMI is: ${bmi.toStringAsFixed(2)}";
          bgColor = Colors.orange.shade200;

        } else if (bmi < 18.5) {
          msg = "You're Underweight";
          result = "$msg\nYour BMI is: ${bmi.toStringAsFixed(2)}";
          bgColor = Colors.red.shade200;

        } else {
          msg = "You're Healthy!";
          result = "$msg\nYour BMI is: ${bmi.toStringAsFixed(2)}";
          bgColor = Colors.green.shade200;

        }
      });
      
    } else {
      setState(() {
        result = "Please fill all the required fields!";
      });
    }
  }
}
