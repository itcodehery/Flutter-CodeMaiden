import 'package:flutter/material.dart';

void main() => runApp(const CalculatorApp());

class CalculatorApp extends StatelessWidget {
  const CalculatorApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculator',
      theme: ThemeData(primarySwatch: Colors.blue),
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
        _output = '0';
        _num1 = 0.0;
        _num2 = 0.0;
        _operator = '';
        _result = '';
      } else if (buttonText == '+' ||
          buttonText == '-' ||
          buttonText == '*' ||
          buttonText == '/') {
        _num1 = double.parse(_output);
        _operator = buttonText;
        _output = '0';
      } else if (buttonText == '.') {
        _output += buttonText;
      } else if (buttonText == '=') {
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
        }
        _num1 = 0.0;
        _num2 = 0.0;
        _operator = '';
        _output = _result;
      } else {
        if (_output == '0') {
          _output = buttonText;
        } else {
          _output += buttonText;
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
        ),
        child: Text(
          buttonText,
          style: const TextStyle(
            fontSize: 30.0,
            fontWeight: FontWeight.normal,
            color: Colors.white,
          ),
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Calculator')),
      body: Column(
        children: [
          Container(
            alignment: Alignment.centerRight,
            padding:
                const EdgeInsets.symmetric(horizontal: 12.0, vertical: 24.0),
            child: Text(
              _output,
              style:
                  const TextStyle(fontSize: 48.0, fontWeight: FontWeight.bold),
            ),
          ),
          const Expanded(
            child: Divider(), //Expands the divider when numbers are big
          ),
          Column(
            children: [
              Row(
                children: [
                  _buildButton('7', Colors.grey, 1),
                  _buildButton('8', Colors.grey, 1),
                  _buildButton('9', Colors.grey, 1),
                  _buildButton('/', Colors.orange, 1),
                  _buildButton('.', Colors.grey, 1),
                ],
              ),
              Row(
                children: [
                  _buildButton('4', Colors.grey, 1),
                  _buildButton('5', Colors.grey, 1),
                  _buildButton('6', Colors.grey, 1),
                  _buildButton('*', Colors.orange, 1),
                ],
              ),
              Row(
                children: [
                  _buildButton('1', Colors.grey, 1),
                  _buildButton('2', Colors.grey, 1),
                  _buildButton('3', Colors.grey, 1),
                  _buildButton('-', Colors.orange, 1),
                ],
              ),
              Row(
                children: [
                  _buildButton('C', Colors.grey, 1),
                  _buildButton('0', Colors.grey, 1),
                  _buildButton('=', Colors.orange, 1),
                  _buildButton('+', Colors.orange, 1),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
