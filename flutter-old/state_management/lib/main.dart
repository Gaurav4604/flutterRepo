import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: EligiblityScreen(),
    );
  }
}

class EligiblityScreen extends StatelessWidget {
  EligiblityScreen({Key? key}) : super(key: key);
  final ageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => EligibilityScreenProvider(),
      child: Builder(
        builder: (context) {
          return Scaffold(
            body: Container(
              padding: EdgeInsets.all(10),
              child: Form(child: Consumer<EligibilityScreenProvider>(
                  builder: (context, provider, child) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: (!provider._dataEntered)
                              ? Colors.orangeAccent
                              : provider.isEligible
                                  ? Colors.green
                                  : Colors.redAccent),
                      height: 50,
                      width: 50,
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    TextFormField(
                      controller: ageController,
                      decoration: InputDecoration(
                        hintText: 'Enter Age',
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Container(
                      width: double.infinity,
                      height: 30,
                      child: TextButton(
                        onPressed: () {
                          final int age = int.parse(ageController.text.trim());
                          provider.checkEligibility(age);
                        },
                        child: Text(
                          'Check',
                          style: TextStyle(color: Colors.white),
                        ),
                        style:
                            TextButton.styleFrom(backgroundColor: Colors.blue),
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Text(provider.eligibilityMessage)
                  ],
                );
              })),
            ),
          );
        },
      ),
    );
  }
}

class EligibilityScreenProvider extends ChangeNotifier {
  String _eligibilityMessage = "";
  bool _dataEntered = false;
  bool _isEligible = false;

  void checkEligibility(int age) {
    _dataEntered = true;
    age >= 18 ? eligibleForLicence() : notEligibleForLicence();
  }

  void eligibleForLicence() {
    _eligibilityMessage = "Eligible for licence";
    _isEligible = true;
    notifyListeners();
  }

  void notEligibleForLicence() {
    _eligibilityMessage = "Not Eligible for licence";
    _isEligible = false;
    notifyListeners();
  }

  String get eligibilityMessage => _eligibilityMessage;

  bool get isEligible => _isEligible;
}
