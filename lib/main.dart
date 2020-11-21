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

  TextEditingController weightController = TextEditingController();
  TextEditingController heightController = TextEditingController();

  void _resetFields() {
    this.weightController.text = '';
    this.heightController.text = '';
    setState(() {
      this._infoText = 'Informe seus dados.';
    });
  }

  void _calculate() {
    double weight = double.parse(this.weightController.text);
    double height = double.parse(this.heightController.text) / 100;
    double imc = weight / (height * height);
    setState(() {
      if (imc < 18.6) {
        return this._infoText =
            'Abaixo do peso (${imc.toStringAsPrecision(3)})';
      }

      if (imc >= 18.6 && imc < 24.9) {
        return this._infoText = 'Peso Ideal (${imc.toStringAsPrecision(3)})';
      }

      if (imc >= 24.9 && imc < 29.9) {
        return this._infoText =
            'Levemente acima do peso (${imc.toStringAsPrecision(3)})';
      }

      if (imc >= 29.9 && imc < 34.9) {
        return this._infoText =
            'Obesidade grau I (${imc.toStringAsPrecision(3)})';
      }

      if (imc >= 34.9 && imc < 39.9) {
        return this._infoText =
            'Obesidade grau II (${imc.toStringAsPrecision(3)})';
      }

      if (imc >= 40) {
        return this._infoText =
            'Obesidade grau III (${imc.toStringAsPrecision(3)})';
      }
    });
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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Icon(Icons.person_outline, size: 120, color: Colors.green),
            TextField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Peso (kg)',
                labelStyle: TextStyle(color: Colors.green),
              ),
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 25),
              controller: this.weightController,
            ),
            TextField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Altura (cm)',
                labelStyle: TextStyle(color: Colors.green),
              ),
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 25),
              controller: this.heightController,
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 20),
              child: Container(
                height: 50,
                child: RaisedButton(
                  onPressed: this._calculate,
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
    );
  }
}
