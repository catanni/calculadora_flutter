import 'package:flutter/material.dart';

class Calculadora extends StatefulWidget {
  const Calculadora({super.key});

  @override
  State<Calculadora> createState() => _CalculadoraState();
}

class _CalculadoraState extends State<Calculadora> {
  String numero = '0';
  double num1 = 0.0;
  String op = '';

  teclaPressionada(String tecla) {
    switch (tecla) {
      case 'c':
        setState(() {
          numero = '0';
        });
        break;
      case 'del':
        op = tecla;
        setState(() {
          if (numero.length > 0) {
            numero = numero.substring(0, numero.length - 1);
          }
        });

        break;
      case '/':
      case '*':
      case '+':
      case '-':
      case '%':
        op = tecla;
        num1 = double.parse(numero);
        numero = '0';
        break;

      case '=':
        double resultado = 0.0;
        if (op == '/') {
          if (double.parse(numero) == 0) {
            print('Error');
            return;
          } else {
            resultado = num1 / double.parse(numero);
          }
        }

        if (op == '+') {
          resultado = num1 + double.parse(numero);
        }

        if (op == '-') {
          resultado = num1 - double.parse(numero);
        }

        if (op == '*') {
          resultado = num1 * double.parse(numero);
        }

        if (op == '%') {
          resultado = num1 % double.parse(numero);
        }

        String resultadoStr = resultado.toString();
        List<String> resultados = resultadoStr.split('.');

        if (int.parse(resultados[1]) * 1 == 0) {
          setState(() {
            numero = int.parse(resultados[0]).toString();
          });
        } else {
          setState(() {
            numero = resultado.toString();
          });
        }
        break;

      case '.':
      case '1':
      case '2':
      case '3':
      case '4':
      case '5':
      case '6':
      case '7':
      case '8':
      case '9':
      case '0':
        setState(() {
          numero += tecla;
          if (numero.contains('.')) {
            return;
          } else {
            int numIt = int.parse(numero);
            numero = numIt.toString();
          }
        });
        break;
      default:
        numero += tecla;
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: MediaQuery.of(context).size.height * 1.0,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: Container(
                alignment: Alignment.bottomRight,
                padding: const EdgeInsets.all(10.0),
                child: Text(
                  numero,
                  style: const TextStyle(
                      fontSize: 50,
                      color: Colors.white,
                      decoration: TextDecoration.none),
                ),
              ),
            ),
            Row(children: [
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  side: const BorderSide(color: Colors.white),
                  backgroundColor: const Color.fromARGB(255, 200, 0, 0),
                  minimumSize:
                      Size(MediaQuery.of(context).size.width * 0.25, 0),
                ),
                child: const Text('C', style: TextStyle(fontSize: 40.0)),
                onPressed: () {
                  setState(() {
                    teclaPressionada('c');
                  });
                },
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  side: const BorderSide(color: Colors.white),
                  backgroundColor: const Color.fromARGB(255, 200, 0, 0),
                  minimumSize:
                      Size(MediaQuery.of(context).size.width * 0.25, 0),
                ),
                onPressed: () {
                  setState(() {
                    teclaPressionada('%');
                  });
                },
                child: const Text("%", style: TextStyle(fontSize: 40.0)),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    side: const BorderSide(color: Colors.white),
                    backgroundColor: const Color.fromARGB(255, 200, 0, 0),
                    minimumSize:
                        Size(MediaQuery.of(context).size.width * 0.25, 0)),
                onPressed: () {
                  setState(() {
                    teclaPressionada('del');
                  });
                },
                child: const Text("<-", style: TextStyle(fontSize: 40.0)),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    side: const BorderSide(color: Colors.white),
                    backgroundColor: const Color.fromARGB(255, 200, 0, 0),
                    minimumSize:
                        Size(MediaQuery.of(context).size.width * 0.25, 0)),
                onPressed: () {
                  setState(() {
                    teclaPressionada('*');
                  });
                },
                child: const Text('*', style: TextStyle(fontSize: 40.0)),
              ),
            ]),
            Row(
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      side: const BorderSide(color: Colors.white),
                      backgroundColor: const Color.fromARGB(255, 92, 91, 86),
                      minimumSize:
                          Size(MediaQuery.of(context).size.width * 0.25, 0)),
                  onPressed: () {
                    setState(() {
                      teclaPressionada('7');
                    });
                  },
                  child: const Text('7', style: TextStyle(fontSize: 40.0)),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    side: const BorderSide(color: Colors.white),
                    backgroundColor: const Color.fromARGB(255, 92, 91, 86),
                    minimumSize:
                        Size(MediaQuery.of(context).size.width * 0.25, 0),
                  ),
                  onPressed: () {
                    setState(() {
                      teclaPressionada('8');
                    });
                  },
                  child: const Text('8', style: TextStyle(fontSize: 40.0)),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      side: const BorderSide(color: Colors.white),
                      backgroundColor: const Color.fromARGB(255, 92, 91, 86),
                      minimumSize:
                          Size(MediaQuery.of(context).size.width * 0.25, 0)),
                  onPressed: () {
                    setState(() {
                      teclaPressionada('9');
                    });
                  },
                  child: const Text('9', style: TextStyle(fontSize: 40.0)),
                ),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      side: const BorderSide(color: Colors.white),
                      backgroundColor: const Color.fromARGB(255, 200, 0, 0),
                      minimumSize:
                          Size(MediaQuery.of(context).size.width * 0.25, 0),
                    ),
                    child: const Text("/", style: TextStyle(fontSize: 40.0)),
                    onPressed: () {
                      setState(() {
                        teclaPressionada('/');
                      });
                    }),
              ],
            ),
            Row(
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      side: const BorderSide(color: Colors.white),
                      backgroundColor: const Color.fromARGB(255, 92, 91, 86),
                      minimumSize:
                          Size(MediaQuery.of(context).size.width * 0.25, 0)),
                  onPressed: () {
                    setState(() {
                      teclaPressionada('4');
                    });
                  },
                  child: const Text('4', style: TextStyle(fontSize: 40.0)),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      side: const BorderSide(color: Colors.white),
                      backgroundColor: const Color.fromARGB(255, 92, 91, 86),
                      minimumSize:
                          Size(MediaQuery.of(context).size.width * 0.25, 0)),
                  onPressed: () {
                    setState(() {
                      teclaPressionada('5');
                    });
                  },
                  child: const Text('5', style: TextStyle(fontSize: 40.0)),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    side: const BorderSide(color: Colors.white),
                    backgroundColor: const Color.fromARGB(255, 92, 91, 86),
                    minimumSize:
                        Size(MediaQuery.of(context).size.width * 0.25, 0),
                  ),
                  onPressed: () {
                    setState(() {
                      teclaPressionada('6');
                    });
                  },
                  child: const Text('6', style: TextStyle(fontSize: 40.0)),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    side: const BorderSide(color: Colors.white),
                    backgroundColor: const Color.fromARGB(255, 200, 0, 0),
                    minimumSize:
                        Size(MediaQuery.of(context).size.width * 0.25, 0),
                  ),
                  onPressed: () {
                    setState(() {
                      teclaPressionada('-');
                    });
                  },
                  child: const Text('-', style: TextStyle(fontSize: 40.0)),
                ),
              ],
            ),
            Row(
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    side: const BorderSide(color: Colors.white),
                    backgroundColor: const Color.fromARGB(255, 92, 91, 86),
                    minimumSize:
                        Size(MediaQuery.of(context).size.width * 0.25, 0),
                  ),
                  onPressed: () {
                    setState(() {
                      teclaPressionada('1');
                    });
                  },
                  child: const Text('1', style: TextStyle(fontSize: 40.0)),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    side: const BorderSide(color: Colors.white),
                    backgroundColor: const Color.fromARGB(255, 92, 91, 86),
                    minimumSize:
                        Size(MediaQuery.of(context).size.width * 0.25, 0),
                  ),
                  onPressed: () {
                    setState(() {
                      teclaPressionada('2');
                    });
                  },
                  child: const Text('2', style: TextStyle(fontSize: 40.0)),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    side: const BorderSide(color: Colors.white),
                    backgroundColor: const Color.fromARGB(255, 92, 91, 86),
                    minimumSize:
                        Size(MediaQuery.of(context).size.width * 0.25, 0),
                  ),
                  onPressed: () {
                    setState(() {
                      teclaPressionada('3');
                    });
                  },
                  child: const Text('3', style: TextStyle(fontSize: 40.0)),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    side: const BorderSide(color: Colors.white),
                    backgroundColor: const Color.fromARGB(255, 200, 0, 0),
                    minimumSize:
                        Size(MediaQuery.of(context).size.width * 0.25, 0),
                  ),
                  onPressed: () {
                    setState(() {
                      teclaPressionada('+');
                    });
                  },
                  child: const Text('+', style: TextStyle(fontSize: 40.0)),
                ),
              ],
            ),
            Row(children: [
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  side: const BorderSide(color: Colors.white),
                  backgroundColor: const Color.fromARGB(255, 92, 91, 86),
                  minimumSize:
                      Size(MediaQuery.of(context).size.width * 0.50, 0),
                ),
                onPressed: () {
                  setState(() {
                    teclaPressionada('0');
                  });
                },
                child: const Text('0', style: TextStyle(fontSize: 40.0)),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  side: const BorderSide(color: Colors.white),
                  backgroundColor: const Color.fromARGB(255, 200, 0, 0),
                  minimumSize:
                      Size(MediaQuery.of(context).size.width * 0.25, 0),
                ),
                onPressed: () {
                  setState(() {
                    teclaPressionada('.');
                  });
                },
                child: const Text('.', style: TextStyle(fontSize: 40.0)),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  side: const BorderSide(color: Colors.white),
                  backgroundColor: const Color.fromARGB(255, 200, 0, 0),
                  minimumSize:
                      Size(MediaQuery.of(context).size.width * 0.25, 0),
                ),
                onPressed: () {
                  setState(() {
                    teclaPressionada('=');
                  });
                },
                child: const Text('=', style: TextStyle(fontSize: 40.0)),
              ),
            ]),
          ],
        ));
  }
}
