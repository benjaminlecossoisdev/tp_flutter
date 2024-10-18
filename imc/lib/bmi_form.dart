import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import './body_mass_index.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';


class BMIform extends StatefulWidget{
  const BMIform({super.key});

  @override
  State<BMIform> createState() => _BMIformState();
}

class _BMIformState extends State<BMIform>{

    int _taille=0;
    int _poids=0;
    num _bmi = 0;
    String _bmiCategory="";

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body:Form(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextFormField(
              decoration: const InputDecoration(
              labelText: "Taille en cm",
              ),
              inputFormatters: [
                FilteringTextInputFormatter.digitsOnly
              ],
              onChanged: (String inputTaille){
                setState(() {
                  _taille = int.tryParse(inputTaille)!;
                });

              },
            ),
            TextFormField(
              decoration: const InputDecoration(
                labelText: "Poids en Kg",
              ),
              inputFormatters: [
                FilteringTextInputFormatter.digitsOnly
              ],
              onChanged: (String inputPoids){
                setState(() {
                  _poids = int.tryParse(inputPoids)!;
                });
              },
            ),
            FloatingActionButton(
              onPressed: (){
                setState(() {
                  _bmi = BodyMassIndex.calculateBMI(_taille, _poids);
                  _bmiCategory = BodyMassIndex.getCategoryFromBMI(_bmi);
                });
              },
              child: const Text('Calculer'),
            ),
             Text(
                 "BMI Category: $_bmiCategory"
             ),
            SfRadialGauge(
             axes: <RadialAxis>[
              RadialAxis(minimum:16.5, maximum: 50,
              ranges: <GaugeRange>[
                GaugeRange(startValue:16.5,endValue: 18.5,color: Colors.blueAccent),
                GaugeRange(startValue: 18.5,endValue: 25,color: Colors.green),
                GaugeRange(startValue:25 ,endValue: 30,color: Colors.orange),
                GaugeRange(startValue:30 ,endValue: 50,color: Colors.red)],
                pointers: <GaugePointer>[
                  NeedlePointer(value:double.parse(_bmi.toStringAsFixed(3)))],
                annotations: <GaugeAnnotation>[
                 GaugeAnnotation(widget: Text('$_bmi',style: const TextStyle(fontSize: 25,fontWeight: FontWeight.bold)),
                angle: 90, positionFactor: 0.5
    )]
    )])
          ],
        ),
      ),);
  }
}