import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:nudron/config/colorConfigFile.dart';
import 'package:nudron/config/geoQueries.dart';
import 'package:nudron/providers/chartDataProvider.dart';
import 'package:nudron/screens/chart_page.dart';
import 'package:nudron/widgets/level1/device_history.dart';
import 'package:nudron/widgets/map_display.dart';
import 'package:nudron/widgets/nudron_primary_chart.dart';
import 'package:provider/provider.dart';

class LevelFourBottomCard extends StatefulWidget {
  const LevelFourBottomCard({Key? key}) : super(key: key);

  @override
  State<LevelFourBottomCard> createState() => _BottomCardState();
}

class _BottomCardState extends State<LevelFourBottomCard> {
  @override
  
  // void didChangeDependencies() {
  //   super.didChangeDependencies();
  //   Provider.of<ChartDataProvider>(context).initCall();
  // }

  GeoHasher geoHasher = GeoHasher();
  

  @override
  Widget build(BuildContext context) {
    return 
      
       DefaultTabController(
        length: 2,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              height: 5,
              width: MediaQuery.of(context).size.width ,
              decoration: BoxDecoration(
                  color: zonalColor,
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(5),
                      topRight: Radius.circular(5))),
            ),
            Container(
              height: 30,
              width: MediaQuery.of(context).size.width ,
              decoration: const BoxDecoration(
                  color: Colors.black87,
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(5),
                      bottomRight: Radius.circular(5))),
    
                child: TabBar(
                    unselectedLabelColor: Colors.white,
                    indicatorPadding: const EdgeInsets.only(left: 5, right: 5),
                    indicator: BoxDecoration(
                        color: Colors.grey[600],
                        borderRadius: BorderRadius.circular(0)),
                    tabs: const [
                     Tab(
                        child: Align(
                          alignment: Alignment.center,
                          
                          child: Text("Chart",style:TextStyle(fontSize: 11) ,overflow:TextOverflow.fade,),
                        ),
                      ),
                      Tab(
                        child: Align(
                          alignment: Alignment.center,
                          child: Text("Map", style:TextStyle(fontSize: 11) ),
                        ),
                      ),
                    ]),
              
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.37,
              child: TabBarView(
                  physics: const NeverScrollableScrollPhysics(),
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 5, right: 5),
                      child: Stack(
                        children: [
                          const CustombarChart(),
                          Positioned(
                            right: 10,
                            bottom: 10,
                            child: FloatingActionButton(
                              backgroundColor: Colors.black,
                              onPressed: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => const ChartPage()));
                              },
                              child: const Icon(Icons.add, color: Colors.white),
                            ),
                          )
                        ],
                      ),
                    ),
                    Container(
                      height: MediaQuery.of(context).size.height * 0.45,
                        width: MediaQuery.of(context).size.width ,
                        decoration: const BoxDecoration(
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                  blurRadius: 10.0,
                                  color: Color.fromRGBO(0, 0, 0, 0.1))
                            ],
                            borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(5),
                                bottomRight: Radius.circular(5))),
                        child: MapContainer()),
                  ]),
            ),
          ],
        ),
      
    );
  }
}
