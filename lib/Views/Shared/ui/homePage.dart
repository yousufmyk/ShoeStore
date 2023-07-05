import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:shoe_store/Views/Shared/product_card.dart';
// import 'package:ant_design_flutter/ant_design_flutter.dart';

import '../../../Models/sneaker_model.dart';
import '../../../Services/helper.dart';
import '../appstyle.dart';
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
                      top: MediaQuery.of(context).size.height * 0.300),
                  child: Container(
                    padding: EdgeInsets.only(left: 12),
                    child: TabBarView(controller: _tabController, children: [
                      Column(
                        children: [
                          SizedBox(
                              height:
                                  MediaQuery.of(context).size.height * 0.450,
                              child: FutureBuilder<List<Sneakers>>(
                                  future: _male,
                                  builder: (context, snapshot) {
                                    if (snapshot.connectionState ==
                                        ConnectionState.waiting) {
                                      return const CircularProgressIndicator();
                                    } else if (snapshot.hasError) {
                                      return Text("Error ${snapshot.error}",style: TextStyle(color: Colors.white),);
                                    } else {
                                      final male = snapshot.data;
                                      return ListView.builder(
                                          itemCount: male!.length,
                                          scrollDirection: Axis.horizontal,
                                          itemBuilder: (context, index) {
                                            final shoe = snapshot.data![index];
                                            return ProductCard(
                                                price: "\$${shoe.price}",
                                                category: shoe.category,
                                                id: shoe.id,
                                                name: shoe.name,
                                                image: shoe.imageUrl[0]);
                                          });
                                    }
                                  }),
                                  ),
                          Column(
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(12, 20, 12, 20),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "Latest Shoes",
                                      style: appstyle(
                                          24, Colors.black, FontWeight.bold),
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          "Show All",
                                          style: appstyle(22, Colors.black,
                                              FontWeight.w500),
                                        ),
                                        const Icon(
                                          Icons.play_arrow_rounded,
                                          size: 30,
                                        )
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.13,
                            child: FutureBuilder<List<Sneakers>>(
                                  future: _male,
                                  builder: (context, snapshot) {
                                    if (snapshot.connectionState ==
                                        ConnectionState.waiting) {
                                      return const CircularProgressIndicator();
                                    } else if (snapshot.hasError) {
                                      return Text("Error ${snapshot.error}",style: TextStyle(color: Colors.white),);
                                    } else {
                                      final male = snapshot.data;
                                      return ListView.builder(
                                          itemCount: male!.length,
                                          scrollDirection: Axis.horizontal,
                                          itemBuilder: (context, index) {
                                            final shoe = snapshot.data![index];
                                            return Padding(
                                              padding: const EdgeInsets.all(12),
                                              child: NewShoes(
                                                imageUrl: shoe.imageUrl[1],
                                              ),
                                            );
                                          });
                                    }
                                  })
                          )
                        ],
                      ),
                      Column(
                        children: [
                          Container(
                          height: MediaQuery.of(context).size.height * 0.45,
                          color: Colors.green,
                        ),
                          Column(
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(12, 20, 12, 20),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "Latest Shoes",
                                      style: appstyle(
                                          24, Colors.black, FontWeight.bold),
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          "Show All",
                                          style: appstyle(22, Colors.black,
                                              FontWeight.w500),
                                        ),
                                        const Icon(
                                          Icons.play_arrow_rounded,
                                          size: 30,
                                        )
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.13,
                            child: ListView.builder(
                                itemCount: 6,
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (context, index) {
                                  return Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Container(
                                      decoration: const BoxDecoration(
                                          color: Colors.white,
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(16)),
                                          boxShadow: [
                                            BoxShadow(
                                                color: Colors.white,
                                                spreadRadius: 1,
                                                blurRadius: 0.8,
                                                offset: Offset(0, 1))
                                          ]),
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.12,
                                      width: MediaQuery.of(context).size.width *
                                          0.28,
                                      child: CachedNetworkImage(
                                          imageUrl:
                                              "https://d326fntlu7tb1e.cloudfront.net/uploads/58282ea3-b815-4d26-9f4f-382aa62f67cf-HP5404_a1.webp"),
                                    ),
                                  );
                                }),
                          )
                        ],
                      ),
                      Column(
                        children: [
                          Container(
                          height: MediaQuery.of(context).size.height * 0.45,
                          color: Colors.amber,
                        ),
                          Column(
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(12, 20, 12, 20),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "Latest Shoes",
                                      style: appstyle(
                                          24, Colors.black, FontWeight.bold),
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          "Show All",
                                          style: appstyle(22, Colors.black,
                                              FontWeight.w500),
                                        ),
                                        const Icon(
                                          Icons.play_arrow_rounded,
                                          size: 30,
                                        )
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.13,
                            child: ListView.builder(
                                itemCount: 6,
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (context, index) {
                                  return Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Container(
                                      decoration: const BoxDecoration(
                                          color: Colors.white,
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(16)),
                                          boxShadow: [
                                            BoxShadow(
                                                color: Colors.white,
                                                spreadRadius: 1,
                                                blurRadius: 0.8,
                                                offset: Offset(0, 1))
                                          ]),
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.12,
                                      width: MediaQuery.of(context).size.width *
                                          0.28,
                                      child: CachedNetworkImage(
                                          imageUrl:
                                              "https://d326fntlu7tb1e.cloudfront.net/uploads/58282ea3-b815-4d26-9f4f-382aa62f67cf-HP5404_a1.webp"),
                                    ),
                                  );
                                }),
                          )
                        ],
                      ),
                    ]),
                  ),
                )
              ],
            ),
          ),
        ));
  }
}

 