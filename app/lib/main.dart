import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Calculadora(),
    );
  }
}

class Calculadora extends StatefulWidget {
  const Calculadora({super.key});

  @override
  State<Calculadora> createState() => _CalculadoraState();
}

class _CalculadoraState extends State<Calculadora> {
  final numero = TextEditingController();
  final porcertagem = TextEditingController();

  String resultado = '';

  void calcular() {
    setState(() {
      if (numero.text.isNotEmpty && porcertagem.text.isNotEmpty) {
        double num = double.parse(numero.text);
        double porcer = double.parse(porcertagem.text) / 100;

        resultado = 'Vc deve pagar R\$${(num * porcer).toString()}';
      } else {
        resultado = 'Digite um numero';
        return;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Calculadora de Gorjeta'),
        backgroundColor: Colors.amber,
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.amber,
                shape: BoxShape.circle,
              ),
              child: Text('💵', style: TextStyle(fontSize: 80)),
            ),

            SizedBox(height: 10),
            TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
                hintText: 'Digite o valor da conta',
                labelText: 'Valor da Conta',
                labelStyle: TextStyle(fontSize: 15),
              ),
              controller: numero,
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 20),
            TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
                hintText: 'Digite quantos % de gorjeta deseja dar: EX 10',
                labelText: '% da Gorjeta',
                labelStyle: TextStyle(fontSize: 15),
              ),
              controller: porcertagem,
              keyboardType: TextInputType.number,
            ),

            SizedBox(height: 20),
            ElevatedButton(
              onPressed: calcular,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.amber,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: Text(
                'Calcular',
                style: TextStyle(fontSize: 20, color: Colors.black),
              ),
            ),
            SizedBox(height: 20),
            Text(resultado, style: TextStyle(fontSize: 20)),
          ],
        ),
      ),
    );
  }
}
