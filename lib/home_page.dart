import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_calculator/bloc/cal_page_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late CalPageBloc bloc;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    bloc = BlocProvider.of<CalPageBloc>(context);
  }

  final List<String> _cal = [];

  void addText(String text) {
    setState(() {
      _cal.add(text);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: BlocBuilder<CalPageBloc, CalPageState>(
        builder: (context, state) {
          return SafeArea(
            child: Column(
              children: [
                Row(
                  children: [
                    _buildTitle(),
                  ],
                ),
                const SizedBox(
                  height: 100,
                ),
                SizedBox(
                  width: double.infinity,
                  child: Text(
                    state.output,
                    textAlign: TextAlign.end,
                    softWrap: false,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 60,
                    ),
                  ),
                ),
                Expanded(
                    child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        circleButton(text: 'C', color: Colors.grey),
                        circleButton(text: '+/-', color: Colors.grey),
                        circleButton(text: '%', color: Colors.grey),
                        circleButton(text: '/', color: Colors.orangeAccent),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        circleButton(
                          text: '7',
                          color: const Color.fromARGB(255, 50, 50, 50),
                        ),
                        circleButton(
                          text: '8',
                          color: const Color.fromARGB(255, 50, 50, 50),
                        ),
                        circleButton(
                          text: '9',
                          color: const Color.fromARGB(255, 50, 50, 50),
                        ),
                        circleButton(text: 'X', color: Colors.orangeAccent),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        circleButton(
                          text: '4',
                          color: const Color.fromARGB(255, 50, 50, 50),
                        ),
                        circleButton(
                          text: '5',
                          color: const Color.fromARGB(255, 50, 50, 50),
                        ),
                        circleButton(
                          text: '6',
                          color: const Color.fromARGB(255, 50, 50, 50),
                        ),
                        circleButton(text: '-', color: Colors.orangeAccent),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        circleButton(
                          text: '1',
                          color: const Color.fromARGB(255, 50, 50, 50),
                        ),
                        circleButton(
                          text: '2',
                          color: const Color.fromARGB(255, 50, 50, 50),
                        ),
                        circleButton(
                          text: '3',
                          color: const Color.fromARGB(255, 50, 50, 50),
                        ),
                        circleButton(text: '+', color: Colors.orangeAccent),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        ZeroButton(text: '0', color: Colors.blue),
                        circleButton(
                            text: '.',
                            color: const Color.fromARGB(255, 50, 50, 50)),
                        circleButton(text: '=', color: Colors.orangeAccent),
                      ],
                    ),
                  ],
                ))
              ],
            ),
          );
        },
      ),
    );
  }

  Widget circleButton(
      {required String text, required Color color, double? btnWidth}) {
    final numbers = ['1', '2', '3', '4', '5', '6', '7', '8', '9', '0'];
    return ElevatedButton(
      onPressed: () {
        // if (text == 'C') {
        //   setState(() {
        //     _cal.clear();
        //   });
        // } else {
          if (numbers.contains(text)) {
            bloc.add(OperandEvent(text));
          } else {
            bloc.add(OperatorEvent(text));
          }
          addText(text);
        // }
      },
      style: ElevatedButton.styleFrom(
        shape: const CircleBorder(),
        padding: const EdgeInsets.all(20),
      ).copyWith(
        backgroundColor: MaterialStateProperty.all<Color>(color),
      ),
      child: Text(
        text,
        style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
      ),
    );
  }

  Widget ZeroButton(
      {required String text, required Color color, double? btnWidth}) {
    return ElevatedButton(
      onPressed: () {
        addText(text);
      },
      style: ElevatedButton.styleFrom(
        shape: const StadiumBorder(),
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 70),
      ).copyWith(
        backgroundColor: MaterialStateProperty.all<Color>(color),
      ),
      child: Text(
        text,
        style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
      ),
    );
  }

  Padding _buildTitle() {
    return const Padding(
      padding: EdgeInsets.all(10),
      child: Text(
        'Calculator',
        textAlign: TextAlign.left,
        style: TextStyle(color: Colors.white, fontSize: 18),
      ),
    );
  }
}
