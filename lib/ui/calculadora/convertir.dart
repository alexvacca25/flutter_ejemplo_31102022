import 'dart:html';

import 'package:flutter/material.dart';

class Convertir extends StatefulWidget {
  const Convertir({super.key});

  @override
  State<Convertir> createState() => _ConvertirState();
}

class _ConvertirState extends State<Convertir> {
/*
        0-COP      1-USD      2-EUR

0-COP     1       4000        5000 


1-USD  0.00025      1         1.25
 

2-EUR  0.0002      0.8           1 

 */

  List<List<double>> factor = [
    [1, 4000, 5000],
    [0.00025, 1, 1.25],
    [0.0002, 0.8, 1]
  ];

  bool pesoO = false;
  bool dolarO = false;
  bool euroO = false;

  bool pesoD = false;
  bool dolarD = false;
  bool euroD = false;

  TextEditingController divA = TextEditingController(text: "0.0");
  TextEditingController divB = TextEditingController(text: "0.0");

  int indO = 0;
  int indD = 0;

  void cambiarestadoO(String moneda) {
    if (moneda == 'P') {
      pesoO = pesoO ? false : true;
      if (pesoO == true) {
        dolarO = false;
        euroO = false;
        indO = 0;
      }
    } else if (moneda == 'D') {
      dolarO = dolarO ? false : true;
      if (dolarO == true) {
        pesoO = false;
        euroO = false;
        indO = 1;
      }
    } else if (moneda == 'E') {
      euroO = euroO ? false : true;
      if (euroO == true) {
        pesoO = false;
        dolarO = false;
        indO = 2;
      }
    }

    conversion();
    print(pesoO);
    setState(() {});
  }

  void cambiarestadoD(String moneda) {
    if (moneda == 'P') {
      pesoD = pesoD ? false : true;
      if (pesoD == true) {
        dolarD = false;
        euroD = false;
        indD = 0;
      }
    } else if (moneda == 'D') {
      dolarD = dolarD ? false : true;
      if (dolarD == true) {
        pesoD = false;
        euroD = false;
        indD = 1;
      }
    } else if (moneda == 'E') {
      euroD = euroD ? false : true;
      if (euroD == true) {
        pesoD = false;
        dolarD = false;
        indD = 2;
      }
    }

    conversion();

    print(pesoD);
    setState(() {});
  }

  void valores(String p) {
    if (divA.text == "0.0") divA.clear();
    divA.text = divA.text + p;
    conversion();
  }

  void conversion() {
    double valorO = double.parse(divA.text);
    print(factor[indD][indO]);
    divB.text = (valorO * factor[indD][indO]).toString();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Convertir Divisas'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('Moneda Origen '),
                GestureDetector(
                  onTap: () => cambiarestadoO('P'),
                  child: Monedas(
                    moneda: pesoO,
                    texto: 'P',
                  ),
                ),
                GestureDetector(
                  onTap: () => cambiarestadoO('D'),
                  child: Monedas(
                    moneda: dolarO,
                    texto: 'D',
                  ),
                ),
                GestureDetector(
                  onTap: () => cambiarestadoO('E'),
                  child: Monedas(
                    moneda: euroO,
                    texto: 'E',
                  ),
                ),
              ],
            ),
            TextField(
              readOnly: true,
              textAlign: TextAlign.center,
              controller: divA,
              decoration: const InputDecoration(hintText: '0.0'),
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('Convertir '),
                GestureDetector(
                  onTap: () => cambiarestadoD('P'),
                  child: Monedas(
                    moneda: pesoD,
                    texto: 'P',
                  ),
                ),
                GestureDetector(
                  onTap: () => cambiarestadoD('D'),
                  child: Monedas(
                    moneda: dolarD,
                    texto: 'D',
                  ),
                ),
                GestureDetector(
                  onTap: () => cambiarestadoD('E'),
                  child: Monedas(
                    moneda: euroD,
                    texto: 'E',
                  ),
                ),
              ],
            ),
            TextField(
              readOnly: true,
              controller: divB,
              textAlign: TextAlign.center,
              decoration: const InputDecoration(hintText: '0.0'),
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                    onTap: () {
                      valores('7');
                    },
                    child: const Botones(valor: '7')),
                GestureDetector(
                    onTap: () => valores('8'),
                    child: const Botones(valor: '8')),
                GestureDetector(
                    onTap: () => valores('9'),
                    child: const Botones(valor: '9')),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                    onTap: () => valores('4'),
                    child: const Botones(valor: '4')),
                GestureDetector(
                    onTap: () => valores('5'),
                    child: const Botones(valor: '5')),
                GestureDetector(
                    onTap: () => valores('6'),
                    child: const Botones(valor: '6')),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                    onTap: () => valores('1'),
                    child: const Botones(valor: '1')),
                GestureDetector(
                    onTap: () => valores('2'),
                    child: const Botones(valor: '2')),
                GestureDetector(
                    onTap: () => valores('3'),
                    child: const Botones(valor: '3')),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Botones(valor: '.'),
                GestureDetector(
                    onTap: () => valores('0'),
                    child: const Botones(valor: '0')),
                GestureDetector(
                    onTap: () {
                      divA.text = "0.0";
                      divB.text = "0.0";
                    },
                    child: const Botones(valor: 'C')),
                //Botones1(valor: 'RESET'),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class Monedas extends StatelessWidget {
  const Monedas({Key? key, required this.moneda, required this.texto})
      : super(key: key);

  final bool moneda;
  final String texto;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: CircleAvatar(
        radius: 15,
        backgroundColor: moneda ? Colors.blue : Colors.amber,
        child: Text(
          texto,
          style: const TextStyle(color: Colors.white, fontSize: 20),
        ),
      ),
    );
  }
}

class Botones extends StatelessWidget {
  final String valor;
  const Botones({Key? key, required this.valor}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: 70,
        height: 70,
        color: Colors.amber,
        child: Center(
          child: Text(
            valor,
            style: const TextStyle(fontSize: 30, color: Colors.white),
          ),
        ),
      ),
    );
  }
}

class Botones1 extends StatelessWidget {
  final String valor;
  const Botones1({Key? key, required this.valor}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: 107,
        height: 70,
        color: Colors.blueGrey,
        child: Center(
          child: Text(
            valor,
            style: const TextStyle(fontSize: 30, color: Colors.white),
          ),
        ),
      ),
    );
  }
}
