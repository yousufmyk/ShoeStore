import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:shoe_store/Views/Shared/product_card.dart';
// import 'package:ant_design_flutter/ant_design_flutter.dart';

import '../../../Models/sneaker_model.dart';
import '../../../Services/helper.dart';
import '../appstyle.dart';
import '../homeWidget.dart';
import '../newShoes.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  late final TabController _tabController =
      TabController(length: 3, vsync: this);

  late Future<List<Sneakers>> _male;
  late Future<List<Sneakers>> _female;
  late Future<List<Sneakers>> _kids;

  void getMale() {
    _male = Helper().getMaleSneakers();
  }

  void getFemale() {
    _female = Helper().getFemaleSneakers();
  }

  void getKids() {
    _kids = Helper().getKidsSneakers();
  }

  @override
  void initState() {
    super.initState();
    getMale();
    getFemale();
    getKids();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xFFE2E2E2),
        body: SingleChildScrollView(
          child: SizedBox(
            height: MediaQuery.of(context).size.height * 1.2,
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
                    padding: EdgeInsets.only(left: 8, bottom: 16),
                    width: MediaQuery.of(context).size.width,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Athletics Shoes",
                          style:
                              appstyleHt(42, Colors.white, FontWeight.bold, 1.5),
                        ),
                        Text(
                          "Collection",
                          style:
                              appstyleHt(42, Colors.white, FontWeight.bold, 1.2),
                        ),
                        TabBar(
                            padding: EdgeInsets.zero,
                            indicatorSize: TabBarIndicatorSize.label,
                            indicatorColor: Colors.black,
                            controller: _tabController,
                            isScrollable: true,
                            labelColor: Colors.white,
                            labelStyle:
                                appstyle(24, Colors.black, FontWeight.bold),
                            unselectedLabelColor: Colors.grey.withOpacity(0.3),
                            tabs: const [
                              Tab(
                                text: "Men Shoes",
                              ),
                              Tab(
                                text: "Women Shoes",
                              ),
                              Tab(
                                text: "Kids Shoes",
                              ),
                            ]),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height * 0.290),
                  child: Container(
                    padding: const EdgeInsets.only(left: 12),
                    child: TabBarView(controller: _tabController, children: [
                      HomeWidget(male: _male),
                      HomeWidget(male: _female),
                      HomeWidget(male: _kids),
                    ]),
                  ),
                )
              ],
            ),
          ),
        ));
  }
}



 