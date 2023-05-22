import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
// import 'package:ant_design_flutter/ant_design_flutter.dart';

import '../appstyle.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  late final TabController _tabController = TabController(length: 3, vsync: this);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SizedBox(
      height: MediaQuery.of(context).size.height,
      child: Stack(
        children: [
          Container(
            padding: const EdgeInsets.fromLTRB(16, 45, 0, 0),
            height: MediaQuery.of(context).size.height * 0.4,
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/images/top_image.png"),
                    fit: BoxFit.fill)),
            child: Container(
              padding: EdgeInsets.only(left: 8,bottom: 16),
              width: MediaQuery.of(context).size.width,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Athletics Shoes",
                    style: appstyleHt(42, Colors.white, FontWeight.bold, 1.5),
                  ),
                  Text(
                    "Collection",
                    style: appstyleHt(42, Colors.white, FontWeight.bold, 1.2),
                  ),
                  TabBar (
            indicatorSize: TabBarIndicatorSize.label,
            indicatorColor: Colors.black,
            controller:  _tabController,
            isScrollable: true,
            labelColor: Colors.white,
            labelStyle: appstyle(24, Colors.black, FontWeight.bold),
            unselectedLabelColor: Colors.grey.withOpacity(0.3),
            tabs: const [
            Tab(text: "Men Shoes",),
            Tab(text: "Women Shoes",),
            Tab(text: "Kids Shoes",),
          ]),
                ],
              ),
            ),
          ),
           
          Padding(
            padding: 
             EdgeInsets.only(top: MediaQuery.of(context).size.height*0.265),
            child: Container(
              padding: EdgeInsets.only(left: 12),
              child: TabBarView(
                controller:_tabController,
                children: [
                  SingleChildScrollView(
                    child: Column(
                      children: [
                        SizedBox(
                          height: MediaQuery.of(context).size.height*0.405,
                          child: ListView.builder(
                            itemCount: 6,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context,index){
                              return Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  color: Colors.grey,
                                  height: MediaQuery.of(context).size.height,
                                  width: MediaQuery.of(context).size.width * 0.6,
                                ),
                              );
                            }),
                        ),
                        Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.fromLTRB(12,20,12,20),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text("Latest Shoes",style: appstyle(24, Colors.black, FontWeight.bold),),
                                  Row(
                                    children: [
                                      Text("Show All", style: appstyle(22, Colors.black, FontWeight.w500),),
                                      Icon(Icons.play_arrow_rounded, size: 20,)
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height*0.13,
                          child: ListView.builder(
                            itemCount: 6,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context,index){
                              return Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  color: Colors.grey,
                                  height: MediaQuery.of(context).size.height*0.12,
                                  width: MediaQuery.of(context).size.width * 0.28,
                                ),
                              );
                            }),
                        )
                      ],
                    ),
                  ),
                  Column(
                    children: [
                      Container(
                        height: MediaQuery.of(context).size.height*0.45,
                        color: Colors.green,
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Container(
                        height: MediaQuery.of(context).size.height*0.45,
                        color: Colors.amber,
                      ),
                    ],
                  ),
                ]),
            ),
          )
        ],
      ),
    ));
  }
}