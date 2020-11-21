class BMICalculator {
  static double calculateBMI(double weight, double height) {
    return weight / (height * height);
  }

  static String getCalculationMessage(double value) {
    if (value < 18.6) return 'Abaixo do peso (${value.toStringAsPrecision(3)})';

    if (value >= 18.6 && value < 24.9)
      return 'Peso Ideal (${value.toStringAsPrecision(3)})';

    if (value >= 24.9 && value < 29.9)
      return 'Levemente acima do peso (${value.toStringAsPrecision(3)})';

    if (value >= 29.9 && value < 34.9)
      return 'Obesidade grau I (${value.toStringAsPrecision(3)})';

    if (value >= 34.9 && value < 39.9)
      return 'Obesidade grau II (${value.toStringAsPrecision(3)})';

    return 'Obesidade grau III (${value.toStringAsPrecision(3)})';
  }
}
