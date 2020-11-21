import 'package:flutter/material.dart';

import 'package:bmi_calculator/bmi_calculator.dart';

import 'package:bmi_calculator/bmi_input.dart';
import 'package:bmi_calculator/bmi_button.dart';
import 'package:bmi_calculator/result_text.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String _infoText = 'Informe seus dados.';
  GlobalKey<FormState> _formKey = GlobalKey();
  TextEditingController weightController = TextEditingController();
  TextEditingController heightController = TextEditingController();

  void _resetFields() {
    this.weightController.text = '';
    this.heightController.text = '';
    setState(() => this._infoText = 'Informe seus dados.');
  }

  void _calculate() {
    if (!this._formKey.currentState.validate()) return;
    double weight = double.parse(this.weightController.text);
    double height = double.parse(this.heightController.text) / 100;
    double imc = BMICalculator.calculateBMI(weight, height);
    setState(() => this._infoText = BMICalculator.getCalculationMessage(imc));
  }

  String _notEmpty(String value) => value.isEmpty ? 'Insira um valor' : null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: this._buildAppBar(), body: this._buildContent());
  }

  AppBar _buildAppBar() {
    return AppBar(
      title: Text('Calculadora de IMC'),
      centerTitle: true,
      backgroundColor: Colors.green,
      actions: [
        IconButton(
          icon: Icon(Icons.refresh),
          onPressed: this._resetFields,
        )
      ],
    );
  }

  SingleChildScrollView _buildContent() {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: _buildBMIForm(),
    );
  }

  Form _buildBMIForm() {
    return Form(
      key: this._formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Icon(Icons.person_outline, size: 120, color: Colors.green),
          BMIInput(
            label: 'Peso (kg)',
            controller: this.weightController,
            validator: this._notEmpty,
          ),
          BMIInput(
            label: 'Altura (cm)',
            controller: this.heightController,
            validator: this._notEmpty,
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 20),
            child: BMIButton(text: 'Calcular', onTap: this._calculate),
          ),
          ResultText(value: this._infoText),
        ],
      ),
    );
  }
}
