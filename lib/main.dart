import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  return runApp(
    MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.blue,
        appBar: AppBar(
          title: Text('Dicee'),
          backgroundColor: Colors.blue,
        ),
        body: DicePage(),
      ),
    ),
  );
}


class DicePage extends StatefulWidget {
  const DicePage({Key? key}) : super(key: key);

  @override
  State<DicePage> createState() => _DicePageState();
}

class _DicePageState extends State<DicePage> {

  var leftDiceNum = 1;
  var rightDiceNum = 1;

  void change(){

    //sum of each dices combination can't be bigger than 7

    do {
      (leftDiceNum=Random().nextInt(6) + 1);
      (rightDiceNum=Random().nextInt(6) + 1);
    } while ((leftDiceNum+rightDiceNum)>7);
  }

  @override
  Widget build(BuildContext context) {

    return Center(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Expanded(
              child: TextButton(
                onPressed: () {
                  setState((){
                    change();
                  });
                },
                child: Image.asset("images/dice$leftDiceNum.png"),
              ),
            ),
            SizedBox(width: 10),
            Expanded(
              child: TextButton(
                onPressed: () {
                  setState((){
                    change();
                  });
                },
                child: Image.asset(
                  ("images/dice$rightDiceNum.png"),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
