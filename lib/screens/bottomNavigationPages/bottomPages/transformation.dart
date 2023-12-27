import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:phone_auth/screens/bottomNavigationPages/bottomPages/image.dart';
import 'package:phone_auth/shared/customWidgets/Custom_buttom.dart';

class TransformationPage extends StatefulWidget {
  @override
  _TransformationState createState() => _TransformationState();
}

class _TransformationState extends State<TransformationPage> {
  List<double> bmiProgress = [];
  List<DateTime> dates = [];

  TextEditingController heightController = TextEditingController();
  TextEditingController weightController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text(
          'BMI Progress',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.black,
        leading: CustomButtom(
          buttonIcon: Icon(Icons.chevron_left),
          width: 50,
          pressed: () {
            Navigator.pushNamedAndRemoveUntil(
              context,
              '/home',
              (route) => false,
            );
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextField(
                controller: heightController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: 'Enter height (cm)',
                  labelStyle: TextStyle(color: Colors.white),
                ),
                style: TextStyle(color: Colors.white),
              ),
              SizedBox(height: 16.0),
              TextField(
                controller: weightController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: 'Enter weight (kg)',
                  labelStyle: TextStyle(color: Colors.white),
                ),
                style: TextStyle(color: Colors.white),
              ),
              SizedBox(height: 16.0),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Color.fromARGB(255, 156, 176, 21),
                ),
                onPressed: () {
                  calculateBMI();
                },
                child: Text(
                  'Calculate BMI',
                  style: TextStyle(
                      color: Color.fromARGB(255, 0, 0, 0),
                      fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(height: 16.0),
              Text(
                'BMI: ${bmiProgress.isNotEmpty ? bmiProgress.last.toStringAsFixed(2) : "N/A"}',
                style: TextStyle(fontSize: 20.0, color: Colors.white),
              ),
              SizedBox(height: 16.0),
              Text(
                'Calories Burned: ${bmiProgress.isNotEmpty ? calculateCaloriesBurned(bmiProgress.last) : "N/A"}',
                style: TextStyle(fontSize: 20.0, color: Colors.white),
              ),
              SizedBox(height: 16.0),
              Container(
                height: 300,
                child: BarChart(
                  BarChartData(
                    gridData: FlGridData(show: false),
                    titlesData: FlTitlesData(
                      leftTitles: SideTitles(
                        showTitles: true,
                        getTextStyles: (context, value) => const TextStyle(
                          color: Color.fromARGB(255, 255, 255, 255),
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                        ),
                      ),
                      rightTitles: SideTitles(
                        showTitles: true,
                        getTextStyles: (context, value) => const TextStyle(
                          color: Color.fromARGB(255, 255, 255, 255),
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                        ),
                      ),
                      bottomTitles: SideTitles(
                        showTitles: true,
                        getTextStyles: (context, value) => const TextStyle(
                          color: Color.fromARGB(255, 255, 255, 255),
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                        ),
                        getTitles: (value) {
                          if (value.toInt() >= 0 &&
                              value.toInt() < dates.length) {
                            final date = dates[value.toInt()];
                            return '${date.day}/${date.month}/${date.year}';
                          }
                          return '';
                        },
                      ),
                      topTitles: SideTitles(
                        showTitles: false,
                      ),
                    ),
                    borderData: FlBorderData(
                      show: true,
                      border: Border.all(
                        color: Color.fromARGB(255, 255, 255, 255),
                        width: 1,
                      ),
                    ),
                    barGroups: [
                      BarChartGroupData(
                        x: 0,
                        barsSpace: 4,
                        barRods: List.generate(
                          bmiProgress.length,
                          (index) {
                            return BarChartRodData(
                              y: bmiProgress[index],
                              colors: [Color.fromARGB(255, 156, 176, 21)],
                              width: 16,
                            );
                          },
                        ),
                      ),
                    ],
                    maxY: 35,
                  ),
                ),
              ),
              SizedBox(height: 7.0),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Color.fromARGB(255, 156, 176, 21),
                ),
                onPressed: () {
                  Navigator.pushNamedAndRemoveUntil(
                    context,
                    '/image',
                    (route) => false,
                  );
                },
                child: Text(
                  'Transformation',
                  style: TextStyle(
                      color: Color.fromARGB(255, 0, 0, 0),
                      fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void calculateBMI() {
    double height = double.parse(heightController.text);
    double weight = double.parse(weightController.text);

    double heightInMeters = height / 100;
    double bmi = weight / (heightInMeters * heightInMeters);

    setState(() {
      bmiProgress.add(bmi);
      dates.add(DateTime.now());
    });
  }

  double calculateCaloriesBurned(double bmi) {
    // Use a simple formula to estimate calories burned based on BMI
    // You can replace this with a more accurate formula based on your requirements
    return bmi * 100;
  }
}
