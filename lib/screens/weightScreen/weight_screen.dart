import 'package:flutter/material.dart';
import 'package:phone_auth/controllers/auth_service_email.dart';

class WeightWidget extends StatefulWidget {
  @override
  _WeightWidgetState createState() => _WeightWidgetState();
}

class _WeightWidgetState extends State<WeightWidget> {
  int selectedWeight = 50; // Initial weight value
  AuthService authService = AuthService();
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Center(
        child: Container(
          width: screenWidth,
          height: screenHeight,
          decoration: const BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Color.fromRGBO(0, 0, 0, 0.25),
                offset: Offset(0, 4),
                blurRadius: 4,
              ),
            ],
            color: Color.fromRGBO(28, 28, 30, 1),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                width: screenWidth * 0.8,
                height: screenHeight * 0.1,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'WHAT IS YOUR WEIGHT?',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Color.fromRGBO(255, 255, 255, 1),
                        fontFamily: 'Roboto',
                        fontSize: 25,
                        letterSpacing: 0,
                        fontWeight: FontWeight.bold,
                        height: 1.6,
                      ),
                    ),
                    Text(
                      'YOU CAN ALWAYS CHANGE THIS LATER',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Color.fromRGBO(255, 255, 255, 1),
                        fontFamily: 'Integral CF',
                        fontSize: 10,
                        letterSpacing: 0,
                        fontWeight: FontWeight.normal,
                        height: 1.5,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: screenHeight * 0.05),
              Container(
                width: screenWidth * 0.4,
                height: screenHeight * 0.4, // Adjust the height of the wheel
                child: ListWheelScrollView(
                  itemExtent:
                      screenHeight * 0.1, // Adjust the item extent as needed
                  physics: FixedExtentScrollPhysics(),
                  children: List.generate(
                    150, // Number of weight options
                    (index) => Center(
                      child: Text(
                        (index + 40).toString(),
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 35,
                        ),
                      ),
                    ),
                  ),
                  onSelectedItemChanged: (index) {
                    setState(() {
                      selectedWeight = index + 1;
                    });
                  },
                ),
              ),
              SizedBox(height: screenHeight * 0.05),
              Container(
                alignment: Alignment.bottomRight,
                padding: EdgeInsets.only(
                    top: screenHeight * 0.2, right: screenWidth * 0.05),
                child: ElevatedButton(
                  onPressed: () async {
                    // Handle the "Next" button press with the selectedWeight
                    Navigator.pushNamedAndRemoveUntil(
                        context, '/height', ((route) => false));
                    String? user =
                        await authService.weightEntered(selectedWeight);
                    print("Next button pressed with weight: $selectedWeight");
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 15),
                    child: Text(
                      'Next',
                      style: TextStyle(
                        color: Colors.black,
                        fontFamily: 'Open Sans',
                        fontSize: 20, // Adjust the font size as needed
                        letterSpacing: 0,
                        fontWeight: FontWeight.normal,
                        height: 1,
                      ),
                    ),
                  ),
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(
                      Color.fromRGBO(208, 253, 62, 1),
                    ),
                    shape: MaterialStateProperty.all<OutlinedBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(48),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
