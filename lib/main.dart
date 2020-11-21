import 'package:flutter/material.dart';

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

  String _getBMIValue(double value) {
    if (value < 18.6) return 'Abaixo do peso (${this._formatBMI(value)})';

    if (value >= 18.6 && value < 24.9)
      return 'Peso Ideal (${this._formatBMI(value)})';

    if (value >= 24.9 && value < 29.9)
      return 'Levemente acima do peso (${this._formatBMI(value)})';

    if (value >= 29.9 && value < 34.9)
      return 'Obesidade grau I (${this._formatBMI(value)})';

    if (value >= 34.9 && value < 39.9)
      return 'Obesidade grau II (${this._formatBMI(value)})';

    return 'Obesidade grau III (${this._formatBMI(value)})';
  }

  String _formatBMI(double value) => value.toStringAsPrecision(3);

  double _calculateBMI(double weight, double height) {
    return weight / (height * height);
  }

  void _calculate() {
    double weight = double.parse(this.weightController.text);
    double height = double.parse(this.heightController.text) / 100;
    double imc = this._calculateBMI(weight, height);
    setState(() => this._infoText = this._getBMIValue(imc));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Calculadora de IMC'),
        centerTitle: true,
        backgroundColor: Colors.green,
        actions: [
          IconButton(
            icon: Icon(Icons.refresh),
            onPressed: this._resetFields,
          )
        ],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: Form(
          key: this._formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Icon(Icons.person_outline, size: 120, color: Colors.green),
              TextFormField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: 'Peso (kg)',
                  labelStyle: TextStyle(color: Colors.green),
                ),
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 25),
                controller: this.weightController,
                validator: (value) => value.isEmpty ? 'Insira o peso' : null,
              ),
              TextFormField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: 'Altura (cm)',
                  labelStyle: TextStyle(color: Colors.green),
                ),
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 25),
                controller: this.heightController,
                validator: (value) => value.isEmpty ? 'Insira a altura' : null,
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 20),
                child: Container(
                  height: 50,
                  child: RaisedButton(
                    onPressed: () {
                      if (this._formKey.currentState.validate()) {
                        this._calculate();
                      }
                    },
                    child: Text(
                      'Calcular',
                      style: TextStyle(color: Colors.white, fontSize: 25),
                    ),
                    color: Colors.green,
                  ),
                ),
              ),
              Text(
                this._infoText,
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.green, fontSize: 25),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
