import 'dart:math';
import 'package:flutter/material.dart';

void main() => runApp(const CalculatorApp());

class CalculatorApp extends StatelessWidget {
  const CalculatorApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculator',
      color: const Color.fromRGBO(244, 233, 205, 100),
      theme: ThemeData(
          primarySwatch: Colors.indigo,
          canvasColor: const Color.fromARGB(255, 14, 39, 60)),
      home: const CalculatorScreen(),
    );
  }
}

class CalculatorScreen extends StatefulWidget {
  const CalculatorScreen({super.key});

  @override
  CalculatorScreenState createState() => CalculatorScreenState();
}

class CalculatorScreenState extends State<CalculatorScreen> {
  String _output = '0';
  double _num1 = 0.0;
  double _num2 = 0.0;
  String _operator = '';
  String _result = '';

  void _buttonPressed(String buttonText) {
    setState(() {
      if (buttonText == 'C') {
        //Clear Screen Logic
        _output = '0';
        _num1 = 0.0;
        _num2 = 0.0;
        _operator = '';
        _result = '';
      } else if (buttonText == '+' ||
          buttonText == '-' ||
          buttonText == '*' ||
          buttonText == '/' ||
          buttonText == 'M' ||
          buttonText == '^') {
        //operations parse
        _num1 = double.parse(_output);
        _operator = buttonText;
        _output = '0';
      } else if (buttonText == '.') {
        //decimal point logic
        _output += buttonText;
      } else if (buttonText == '=') {
        //output operations logic
        _num2 = double.parse(_output);
        switch (_operator) {
          case '+':
            _result = (_num1 + _num2).toString();
            break;

          case '-':
            _result = (_num1 - _num2).toString();
            break;

          case '*':
            _result = (_num1 * _num2).toString();
            break;

          case '/':
            _result = (_num1 / _num2).toString();
            break;

          case 'M':
            _result = (_num1 % _num2).toString();
            break;

          case '^':
            _result = pow(_num1, _num2).toString();
            break;
        }
        _num1 = 0.0;
        _num2 = 0.0;
        _operator = '';
        _output = _result;
      } else {
        if (_output == '0') {
          _output = buttonText;
        } else {
          //numbers entering logic
          if (!(_output.length > 13)) _output += buttonText;
        }
      }
    });
  }

  Widget _buildButton(
      String buttonText, Color buttonColor, double buttonHeight) {
    return TextButton(
        onPressed: () => _buttonPressed(buttonText),
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(buttonColor),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0),
                side: const BorderSide(color: Colors.transparent)),
          ),
        ),
        child: Text(
          buttonText,
          style: const TextStyle(
            fontFamily: 'SFProDisplay',
            fontSize: 30.0,
            fontWeight: FontWeight.normal,
            color: Colors.white,
          ),
        ));
  }

  Widget _buildEqualsButton(
      String buttonText, Color buttonColor, double buttonHeight) {
    return SizedBox(
      width: 130,
      child: TextButton(
          onPressed: () => _buttonPressed(buttonText),
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(buttonColor),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                  side: const BorderSide(color: Colors.transparent)),
            ),
          ),
          child: Text(
            buttonText,
            style: const TextStyle(
              fontFamily: 'SFProDisplay',
              fontSize: 30.0,
              fontWeight: FontWeight.normal,
              color: Colors.white,
            ),
          )),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Two Operand Calculator'),
        titleTextStyle: const TextStyle(
          fontFamily: 'SFProDisplay',
          fontSize: 20.0,
          color: Colors.white,
        ),
      ),
      body: Column(
        children: [
          Container(
            alignment: Alignment.centerRight,
            padding:
                const EdgeInsets.symmetric(horizontal: 12.0, vertical: 24.0),
            child: Text(
              _output,
              style: const TextStyle(
                  fontFamily: 'SFProDisplay',
                  fontSize: 48.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
          ),
          const Expanded(
            child: Padding(
              padding: EdgeInsets.all(20),
              child: Divider(color: Colors.blueAccent),
            ), //Expands the divider when numbers are big
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _buildButton('7', Colors.blueGrey, 1),
                  const SizedBox(
                    width: 6,
                  ),
                  _buildButton('8', Colors.blueGrey, 1),
                  const SizedBox(
                    width: 6,
                  ),
                  _buildButton('9', Colors.blueGrey, 1),
                  const SizedBox(
                    width: 6,
                  ),
                  _buildButton('/', Colors.indigo, 1),
                  const SizedBox(
                    width: 6,
                  ),
                  _buildButton('.', Colors.indigo, 1),
                ],
              ),
              const SizedBox(
                height: 6,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _buildButton('4', Colors.blueGrey, 1),
                  const SizedBox(
                    width: 6,
                  ),
                  _buildButton('5', Colors.blueGrey, 1),
                  const SizedBox(
                    width: 6,
                  ),
                  _buildButton('6', Colors.blueGrey, 1),
                  const SizedBox(
                    width: 6,
                  ),
                  _buildButton('*', Colors.indigo, 1),
                  const SizedBox(
                    width: 6,
                  ),
                  _buildButton('M', Colors.indigo, 1),
                ],
              ),
              const SizedBox(
                height: 6,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _buildButton('1', Colors.blueGrey, 1),
                  const SizedBox(
                    width: 6,
                  ),
                  _buildButton('2', Colors.blueGrey, 1),
                  const SizedBox(
                    width: 6,
                  ),
                  _buildButton('3', Colors.blueGrey, 1),
                  const SizedBox(
                    width: 6,
                  ),
                  _buildButton('-', Colors.indigo, 1),
                  const SizedBox(
                    width: 6,
                  ),
                  _buildButton('^', Colors.indigo, 1)
                ],
              ),
              const SizedBox(
                height: 6,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _buildButton('C', Colors.blueGrey, 1),
                  const SizedBox(
                    width: 6,
                  ),
                  _buildButton('0', Colors.blueGrey, 1),
                  const SizedBox(
                    width: 6,
                  ),
                  _buildEqualsButton('=', Colors.indigoAccent, 1),
                  const SizedBox(
                    width: 6,
                  ),
                  _buildButton('+', Colors.indigo, 1),
                ],
              ),
            ],
          ),
          const Padding(padding: EdgeInsets.all(6)),
          const SizedBox(height: 10)
        ],
      ),
    );
  }
}
