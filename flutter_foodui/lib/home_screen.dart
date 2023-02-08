import 'package:flutter/material.dart';
import 'package:flutter_foodui/restau_food_medium_card.dart';
import 'package:flutter_foodui/section_title.dart';

import 'data.dart';
import 'image_carousel.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            backgroundColor: Colors.white,
            elevation: 0,
            floating: true,
            title: Column(children: [
              Text(
                "Delivery to".toUpperCase(),
                style: Theme.of(context)
                    .textTheme
                    .bodySmall
                    ?.copyWith(color: Colors.green),
              ),
              const Text(
                "San Francisco",
                style: TextStyle(color: Colors.black),
              )
            ]),
            actions: [
              TextButton(
                  onPressed: () {},
                  child: const Text(
                    "Filter",
                    style: TextStyle(color: Colors.black),
                  ))
            ],
          ),
          const SliverPadding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              sliver: SliverToBoxAdapter(child: ImageCarousel())),
          SliverPadding(
            padding: const EdgeInsets.all(16),
            sliver: SliverToBoxAdapter(
              child: SectionTitle(
                title: "Featured Partners",
                press: () {},
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                  children: List.generate(
                demoMediumCardData.length,
                (index) => Padding(
                  padding: const EdgeInsets.only(left: 16),
                  child: RestaurantInfoMediumCard(
                    title: demoMediumCardData[index]['name'],
                    location: demoMediumCardData[index]['location'],
                    image: demoMediumCardData[index]['image'],
                    deliveryTime: demoMediumCardData[index]['deliveryTime'],
                    rating: demoMediumCardData[index]['rating'],
                    press: () {},
                  ),
                ),
              )),
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.all(16),
            sliver: SliverToBoxAdapter(
              child: Image.asset("assets/images/Banner.png"),
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.all(16),
            sliver: SliverToBoxAdapter(
              child: SectionTitle(
                title: "Best Pick",
                press: () {},
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                  children: List.generate(
                demoMediumCardData.length,
                (index) => Padding(
                  padding: const EdgeInsets.only(left: 16),
                  child: RestaurantInfoMediumCard(
                    title: demoMediumCardData[index]['name'],
                    location: demoMediumCardData[index]['location'],
                    image: demoMediumCardData[index]['image'],
                    deliveryTime: demoMediumCardData[index]['deliveryTime'],
                    rating: demoMediumCardData[index]['rating'],
                    press: () {},
                  ),
                ),
              )),
            ),
          ),
        ],
      ),
    );
  }
}
