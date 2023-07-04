import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:shoe_store/Views/Shared/appstyle.dart';

class ProductCard extends StatefulWidget {
  const ProductCard(
      {super.key,
      required this.price,
      required this.category,
      required this.id,
      required this.name,
      required this.image});

  final String price;
  final String category;
  final String id;
  final String name;
  final String image;

  @override
  State<ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  @override
  Widget build(BuildContext context) {
    bool selected = true;
    return Padding(
      padding: EdgeInsets.fromLTRB(8, 0, 20, 0),
      child: ClipRRect(
        borderRadius: BorderRadius.all(Radius.circular(16)),
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width*0.7,
          decoration: const BoxDecoration(boxShadow: [
            BoxShadow(
                color: Colors.white,
                spreadRadius: 1,
                blurRadius: 0.6,
                offset: Offset(1, 1))
          ]),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height*0.23,
                    decoration: BoxDecoration(
                        image: DecorationImage(image: NetworkImage(widget.image))),
                  ),
                  Positioned(
                      right: 10,
                      top: 10,
                      child: GestureDetector(
                        onTap: null,
                        child: const Image(image: AssetImage("assets/images/heart-outline.png"),height: 25,width: 25,),
                      ))
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.name,
                      style: appstyleHt(36, Colors.black, FontWeight.bold, 1.1),
                    ),
                    Text(
                      widget.category,
                      style: appstyleHt(18, Colors.grey, FontWeight.bold, 1.5),
                    ),
                  ],
                ),
              ),

              Padding(padding: const EdgeInsets.only(left: 8,right: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    widget.price,
                    style: appstyle(30, Colors.black, FontWeight.w600),
                  ),
                  Row(
                    children: [
                      Text("Colors",
                      style: appstyle(18, Colors.grey, FontWeight.w500),
                      ),

                      const SizedBox(
                        width: 5,
                      ),

                      ChoiceChip(label: Text(" "), 
                      selected: selected,
                      visualDensity: VisualDensity.compact,
                      selectedColor: Colors.black,
                      )


                    ],
                  )
                ],
              ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
