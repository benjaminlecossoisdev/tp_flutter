import 'package:flutter/material.dart';
import 'dart:math';


class Game extends StatefulWidget{
  const Game({super.key, required this.title});

  final String title;

  @override
  State<Game> createState() => _GameState();
}

class _GameState extends State<Game>{

  final List<String>images=[
    'bar',
    'cerise',
    'cloche',
    'diamant',
    'fer-a-cheval',
    'pasteque',
    'sept'
  ];

  late int randomIndex1;
  late int randomIndex2;
  late int randomIndex3;

  String randomString1 = "";
  String randomString2 = "";
  String randomString3 = "";
  String message= "";

  @override
  void initState() {
    super.initState();
    randomString1;
    randomString2;
    randomString3;
    message;
    _randomImages();
  }

  void _randomImages(){
    final random = Random();
     randomIndex1= random.nextInt(images.length);
     randomIndex2= random.nextInt(images.length);
     randomIndex3= random.nextInt(images.length);
     if (randomIndex1==randomIndex2 && randomIndex2==randomIndex3);

    setState(() {
      randomString1 = images[randomIndex1];
      randomString2 = images[randomIndex2];
      randomString3 = images[randomIndex3];
      _showMessage();
    });
}

  String _showMessage(){
    if (randomString1== 'sept'&& randomString1==randomString2 && randomString2==randomString3){
      message= "JACKPOT !";
  }else if (randomString1==randomString2 && randomString2==randomString3){
      message= "Jackpot";
    }else{
      message="You lose... Try Again";
    }
    return message;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title,
        style: TextStyle(
          fontSize: 30,
          fontWeight: FontWeight.bold,
        ),
        ),
      ),

      backgroundColor: message == 'JACKPOT !' ? Colors.yellow : Colors.white70 ,

      body: Center(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                width:300,
                child:
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Flexible(child:
                    Image.asset('./assets/images/$randomString1.png'),
                    ),
                    Flexible(child:
                    Image.asset('./assets/images/$randomString2.png'),
                    ),
                    Flexible(child:
                    Image.asset('./assets/images/$randomString3.png'),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 100),
              Text(message,
                  style: TextStyle(
                    fontWeight: message == 'JACKPOT !' ? FontWeight.bold :FontWeight.normal,
                    fontSize: message == 'JACKPOT !' ? 50:30,
                  )
              ),
              SizedBox(height: 200),
            ],
          ),
      ),
      floatingActionButton:
        FloatingActionButton(
        onPressed: _randomImages,
        backgroundColor: Colors.orange,
        foregroundColor: Colors.white,
        child:
        const Icon(Icons.refresh),
      ),
    );
  }
}