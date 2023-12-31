import 'package:flutter/material.dart';

import '../widgets/nudron_primary_chart.dart';

class ChartPage extends StatefulWidget {
  const ChartPage({Key? key}) : super(key: key);

  @override
  State<ChartPage> createState() => _SampleMapState();
}

class _SampleMapState extends State<ChartPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
            width: MediaQuery.of(context).size.width * 0.9,
            decoration: BoxDecoration(boxShadow: const [
              BoxShadow(blurRadius: 10.0, color: Color.fromRGBO(0, 0, 0, 0.1))
            ], color: Colors.white, borderRadius: BorderRadius.circular(8.0)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                RotatedBox(
                  quarterTurns: 1,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SizedBox(
                      height: MediaQuery.of(context).size.height * 0.9,
                      width: MediaQuery.of(context).size.width * 1.35,
                      child: Container(
                          decoration: const BoxDecoration(color: Colors.white),
                          child: const CustombarChart()),
                    ),
                  ),
                ),
                Container(
                  height: MediaQuery.of(context).size.height * 0.15,
                  color: Colors.white,
                )
              ],
            )),
      ),
    );
  }
}
