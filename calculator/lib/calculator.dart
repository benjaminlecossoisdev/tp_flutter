import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Calculator extends StatefulWidget {
  const Calculator({super.key, required this.title});

  final String title;

  @override
  State<Calculator> createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {

  int _result= 2;
  int _counter= 0;
  int _increment= 2;
  int _click=0;
  String _dropdownvalue = 'add';
  final List<String> operators = <String>['add', 'multiply', 'substract', 'divide'];

  void _newIncrement( int newIncrement){
    setState(() {
      if(newIncrement<1) {
       _showAlert();
       newIncrement =1;
      }
      _increment = newIncrement;
    });
  }

  void _incrementCounter() {
    setState(() {
      _counter+= _increment;
      _result += _increment;
      _click ++;
    });
  }

  Future<void> _showAlert() async {
    return showDialog<void>(
        context: context,
        builder: (BuildContext context){
          return AlertDialog(
            title:const Text('Erreur'),
            content: const SingleChildScrollView(
              child: ListBody(
                children: <Widget>[
                  Text("La valeur de l'incrément ne doit pas être inférieur à 1."),
                ]
              )
            ),
             actions: <Widget>[
               TextButton(
                 child: const Text ('Ok'),
                 onPressed: () {
                   Navigator.of(context).pop();
                 },
               ),
            ],
          );
        }
    );
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(

        child: Column(

          mainAxisAlignment: MainAxisAlignment.center,

          children: <Widget>[
            DropdownButton(
                value: _dropdownvalue,
                items: operators.map((String operator){
                  return DropdownMenuItem(
                      value: operator,
                      child: Text(operator),
                  );
                }).toList(),
                  onChanged:(String? newOperator){
                  setState(() {
                    _dropdownvalue = newOperator!;
                  });
                  },
                ),
            SizedBox(
              width:300,
              child:
              TextFormField(
                decoration:  InputDecoration(
                  labelText : 'Incrément = $_increment',
                  border: const OutlineInputBorder(),
                  hintText: 'Entrez un nombre',
                ),
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly
                ],
                style: const TextStyle( height: 3.0),

                  onFieldSubmitted: (String value) {
                    int intValue = int.parse(value);
                    _newIncrement(intValue);
                },
              ),
            ),

          if(_click>0)
          Text('Vous avez cliqué $_click fois '),

          Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
          Text(
          '$_counter + $_increment  = ',
          ),
          Text(
          '$_result',
          style: Theme.of(context).textTheme.headlineMedium,
          ),
          ],
          ),
          ],
          ),
          ),
          floatingActionButton: FloatingActionButton(
          onPressed: _incrementCounter,
          tooltip: 'Increment',
          child: Text('+ $_increment'),
            ),
      );
   }
  }
