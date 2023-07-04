// ignore_for_file: prefer_const_constructors

import 'package:carousel_slider/carousel_slider.dart';
import 'package:ethio_tour/config/colors.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class PlaceDetails extends StatelessWidget {
  const PlaceDetails({
    super.key,
    required this.id,
  });

  final int id;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: KPrimary.shade700,
      body: SafeArea(
        child: DefaultTabController(
          length: 3,
          child: CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: SizedBox(
                  width: size.width,
                  height: size.height * .4,
                  child: Header(),
                ),
              ),
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0)
                      .copyWith(top: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: const [
                      Text(
                        "Axum",
                        style: TextStyle(
                          fontSize: 24,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        "Tigray",
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.only(top: 20.0),
                  child: Column(
                    children: const [
                      TabBar(
                        indicatorColor: KAccentColor.shade500,
                        labelColor: KAccentColor.shade500,
                        unselectedLabelColor: Colors.white70,
                        tabs: [
                          Tab(
                            text: 'Overview',
                          ),
                          Tab(
                            text: 'Map',
                          ),
                          Tab(
                            text: 'Review',
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: SizedBox(
                  height: size.height,
                  child: TabBarView(
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 10),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Icon(
                                  Icons.star,
                                  color: KAccentColor.shade400,
                                  size: 50,
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Column(
                                  children: [
                                    Text(
                                      "4.5",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 30,
                                      ),
                                    ),
                                    Text(
                                      "Rating",
                                      style: TextStyle(
                                        fontSize: 18,
                                        color: Colors.white70,
                                      ),
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Container(),
                      Container(),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Header extends StatefulWidget {
  const Header({
    super.key,
  });

  @override
  State<Header> createState() => _HeaderState();
}

class _HeaderState extends State<Header> {
  var current = 0;
  final List<String> imgs = List.generate(
    4,
    (index) => 'assets/images/${index % 2 == 0 ? 'ethio' : 'home-appbar'}.jpeg',
  );

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        SizedBox.expand(
          child: ClipRRect(
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(40),
            ),
            child: CarouselSlider(
              options: CarouselOptions(
                  height: size.height * .4,
                  padEnds: false,
                  viewportFraction: 1,
                  onPageChanged: (index, reason) {
                    setState(() {
                      current = index;
                    });
                  }),
              items: imgs
                  .map(
                    (e) => SizedBox.expand(
                      child: Image(
                        fit: BoxFit.cover,
                        image: AssetImage(e),
                      ),
                    ),
                  )
                  .toList(),
            ),
          ),
        ),
        Positioned(
          left: 20,
          top: 20,
          child: Container(
            height: 40,
            width: 40,
            decoration: BoxDecoration(
              color: KPrimary.shade100.withOpacity(0.5),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Center(
              child: IconButton(
                onPressed: () {
                  context.pop();
                },
                icon: Icon(Icons.arrow_back),
                color: Colors.white,
              ),
            ),
          ),
        ),
        Positioned(
          bottom: 20,
          left: 0,
          right: 0,
          height: 8,
          child: Center(
            child: ListView.separated(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return AnimatedContainer(
                  width: current == index ? 30 : 8,
                  decoration: BoxDecoration(
                    color: current == index ? Colors.white : Colors.white54,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  duration: Duration(
                    milliseconds: 240,
                  ),
                );
              },
              separatorBuilder: (context, index) => SizedBox(width: 5),
              itemCount: imgs.length,
            ),
          ),
        ),
      ],
    );
  }
}
