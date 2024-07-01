import 'package:flutter/material.dart';
import 'package:flutter_application_1/components/button_com.dart';
import 'package:flutter_application_1/components/textField_com.dart';
import 'package:flutter_application_1/screens/Api/api_manager.dart';

class DrugInfoScreen extends StatefulWidget {
  static const String routeName = 'Drage';
  @override
  State<DrugInfoScreen> createState() => _DrugInfoScreenState();
}

class _DrugInfoScreenState extends State<DrugInfoScreen> {
  TextEditingController drugNameController = TextEditingController();
  TextEditingController drugIDController = TextEditingController();
  TextEditingController purposeController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController durationController = TextEditingController();
  TextEditingController timesPerDayController = TextEditingController();
  TextEditingController typeController = TextEditingController();
  TextEditingController expireDateController = TextEditingController();
  TextEditingController pillsNumController = TextEditingController();

  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('lib/assets/login.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Form(
            key: formKey,
            child: ListView(
              children: [
                const SizedBox(height: 100),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    SizedBox(height: 125),
                    Text(
                      'Drug Information',
                      style: TextStyle(
                        fontSize: 29,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 50),
                TextFieldComponent(
                  controlleR: drugNameController,
                  validate: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter the Drug Name';
                    }
                    return null;
                  },
                  labelText: 'Drug Name',
                  inputType: TextInputType.text,
                  preIcon: Icons.medication,
                ),
                const SizedBox(height: 10),
                TextFieldComponent(
                  controlleR: purposeController,
                  validate: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter the Purpose of Use';
                    }
                    return null;
                  },
                  labelText: 'Purpose of Use',
                  inputType: TextInputType.text,
                  preIcon: Icons.info,
                ),
                const SizedBox(height: 10),
                TextFieldComponent(
                  controlleR: descriptionController,
                  validate: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter the Description';
                    }
                    return null;
                  },
                  labelText: 'Description',
                  inputType: TextInputType.text,
                  preIcon: Icons.description,
                ),
                const SizedBox(height: 10),
                TextFieldComponent(
                  controlleR: durationController,
                  validate: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter the Duration of Use';
                    }
                    return null;
                  },
                  labelText: 'Duration of Use',
                  inputType: TextInputType.datetime,
                  preIcon: Icons.schedule,
                ),
                const SizedBox(height: 10),
                TextFieldComponent(
                  controlleR: timesPerDayController,
                  validate: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter the Number of Times per Day';
                    }
                    return null;
                  },
                  labelText: 'Number of Times per Day',
                  inputType: TextInputType.number,
                  preIcon: Icons.repeat,
                ),
                const SizedBox(height: 10),
                TextFieldComponent(
                  controlleR: typeController,
                  validate: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter the Type';
                    }
                    return null;
                  },
                  labelText: 'Type',
                  inputType: TextInputType.text,
                  preIcon: Icons.category,
                ),
                const SizedBox(height: 10),
                TextFieldComponent(
                  controlleR: expireDateController,
                  validate: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter the Expire Date';
                    }
                    return null;
                  },
                  labelText: 'Expire Date',
                  inputType: TextInputType.datetime,
                  preIcon: Icons.date_range,
                ),
                const SizedBox(height: 10),
                TextFieldComponent(
                  controlleR: pillsNumController,
                  validate: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter the Number of Pills';
                    }
                    return null;
                  },
                  labelText: 'Number of Pills',
                  inputType: TextInputType.number,
                  preIcon: Icons.confirmation_number,
                ),
                const SizedBox(height: 10),
                ButtonComponent(
                      () {
                        addMedicine();
                  },
                  buttonName: 'Submit',
                ),
                const SizedBox(height: 10),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void addMedicine() {
    Api_manager.Drage(
        drugNameController.text,
        purposeController.text,
        descriptionController.text,
        durationController.text,
        timesPerDayController.text as int,
        typeController.text,
        expireDateController.text,
        pillsNumController.text as int,
        context);
  }

}
