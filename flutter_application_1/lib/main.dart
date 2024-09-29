import 'package:flutter/material.dart';

void main() {
  runApp(const TemperatureConverterApp());
}

class TemperatureConverterApp extends StatelessWidget {
  const TemperatureConverterApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Temperature Converter',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const TemperatureConverterScreen(),
    );
  }
}

class TemperatureConverterScreen extends StatefulWidget {
  const TemperatureConverterScreen({super.key});

  @override

  _TemperatureConverterScreenState createState() => _TemperatureConverterScreenState();
}

class _TemperatureConverterScreenState extends State<TemperatureConverterScreen> {
  String? selectedConversion;
  final TextEditingController tempController = TextEditingController();
  String conversionHistory = '';
  String result = '';

  void convertTemperature() {
    double inputTemp = double.tryParse(tempController.text) ?? 0.0;
    double convertedTemp;

    if (selectedConversion == 'FtoC') {
      convertedTemp = (inputTemp - 32) * 5 / 9;
      result = '${inputTemp.toStringAsFixed(1)} °F => ${convertedTemp.toStringAsFixed(2)} °C';
    } else if (selectedConversion == 'CtoF') {
      convertedTemp = (inputTemp * 9 / 5) + 32;
      result = '${inputTemp.toStringAsFixed(1)} °C => ${convertedTemp.toStringAsFixed(2)} °F';
    }

    setState(() {
      conversionHistory += '$result\n';
      tempController.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Temperature Converter'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: tempController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: 'Enter Temperature'),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Radio<String>(
                  value: 'FtoC',
                  groupValue: selectedConversion,
                  onChanged: (value) {
                    setState(() {
                      selectedConversion = value;
                    });
                  },
                ),
                const Text('Fahrenheit to Celsius'),
                Radio<String>(
                  value: 'CtoF',
                  groupValue: selectedConversion,
                  onChanged: (value) {
                    setState(() {
                      selectedConversion = value;
                    });
                  },
                ),
                const Text('Celsius to Fahrenheit'),
              ],
            ),
            ElevatedButton(
              onPressed: convertTemperature,
              child: const Text('Convert'),
            ),
            const SizedBox(height: 20),
            Text(
              'Result: $result',
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            Text(
              'History:\n$conversionHistory',
              style: const TextStyle(fontSize: 14),
            ),
          ],
        ),
      ),
    );
  }
}