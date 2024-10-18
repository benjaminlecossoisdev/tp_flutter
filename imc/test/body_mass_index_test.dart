import 'package:flutter/cupertino.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:imc/body_mass_index.dart';

void main() {
  group('Test start, calculateBmi , getCategoryFromBMI', () {

  test('BMI doit avoir une valeur de 24.61810377477591, pour une taille de 178cm et un poids de 78Kg', () {

   final bmi =  BodyMassIndex.calculateBMI(178,78);

    expect(bmi, 24.61810377477591);
  });

  test('Category devrait être "normal" pour un BMI qui vaut 24.61810377477591', () {

    final category =  BodyMassIndex.getCategoryFromBMI(24.61810377477591);

    expect(category, 'normal');
  });

});
}