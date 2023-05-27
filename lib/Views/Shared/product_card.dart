import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class ProductCard extends StatefulWidget {
  const ProductCard({super.key});

  @override
  State<ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(8, 0, 20, 0),
      child: ClipRRect(
        borderRadius: BorderRadius.all(Radius.circular(16)),
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: const BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.white,
                spreadRadius: 1,
                blurRadius: 0.6,
                offset: Offset(1, 1)
              )
            ]
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
                Stack(
                  children: [
                    Container(
                      height: MediaQuery.of(context).size.height*0.23,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: NetworkImage("image")
                        )
                      ),
                    ),
                    Positioned(
                    right: 10,
                    top: 10,  
                    child: GestureDetector(
                      onTap: null,
                      child: const Icon(MdiIcons.heart),
                    )
                    
                    )
                  ],
                )
            ],
          ),
        ),
      ),
    );
  }
}