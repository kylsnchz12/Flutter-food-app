import 'package:flutter/material.dart';

import 'data.dart';

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

class RestaurantInfoMediumCard extends StatelessWidget {
  const RestaurantInfoMediumCard({
    super.key,
    required this.title,
    required this.image,
    required this.location,
    required this.deliveryTime,
    required this.rating,
    required this.press,
  });

  final String title, image, location;
  final int deliveryTime;
  final double rating;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: press,
      borderRadius: const BorderRadius.all(Radius.circular(6)),
      child: SizedBox(
        width: 200,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AspectRatio(
              aspectRatio: 1.25,
              child: Image.asset(image),
            ),
            const SizedBox(height: 16 / 2),
            Text(
              title,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: Theme.of(context).textTheme.titleLarge,
            ),
            Text(
              location,
              style: const TextStyle(color: Colors.grey),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16 / 2),
              child: DefaultTextStyle(
                style: const TextStyle(color: Colors.black, fontSize: 12),
                child: Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16 / 2, vertical: 16 / 8),
                      decoration: const BoxDecoration(
                          color: Colors.green,
                          borderRadius: BorderRadius.all(Radius.circular(6))),
                      child: Text(
                        rating.toString(),
                        style: const TextStyle(color: Colors.white),
                      ),
                    ),
                    const Spacer(),
                    Text("$deliveryTime mins"),
                    const Spacer(),
                    const CircleAvatar(
                        radius: 2, backgroundColor: Color(0xFF868686)),
                    const Spacer(),
                    const Text("Free Delivery")
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class IndicatorDot extends StatelessWidget {
  const IndicatorDot({
    Key? key,
    required this.isActive,
  }) : super(key: key);

  final bool isActive;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 4,
      width: 8,
      decoration: BoxDecoration(
          color: isActive ? Colors.white : Colors.white38,
          borderRadius: const BorderRadius.all(Radius.circular(12))),
    );
  }
}

class ImageCarousel extends StatefulWidget {
  const ImageCarousel({
    Key? key,
  }) : super(key: key);

  @override
  State<ImageCarousel> createState() => _ImageCarouselState();
}

class _ImageCarouselState extends State<ImageCarousel> {
  int _currentPage = 0;
  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1.81,
      child: Stack(
        alignment: Alignment.bottomRight,
        children: [
          PageView.builder(
              itemCount: demoBigImages.length,
              onPageChanged: (value) {
                setState(() {
                  _currentPage = value;
                });
              },
              itemBuilder: (context, index) => ClipRRect(
                  borderRadius: const BorderRadius.all(Radius.circular(12)),
                  child: Image.asset(demoBigImages[index]))),
          Positioned(
              bottom: 16,
              right: 16,
              child: Row(
                children: List.generate(
                    demoBigImages.length,
                    (index) => Padding(
                          padding: const EdgeInsets.only(left: 16 / 4),
                          child: IndicatorDot(isActive: index == _currentPage),
                        )),
              ))
        ],
      ),
    );
  }
}

class SectionTitle extends StatelessWidget {
  const SectionTitle({
    Key? key,
    required this.title,
    required this.press,
  }) : super(key: key);

  final String title;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: Theme.of(context).textTheme.titleLarge,
        ),
        TextButton(
            onPressed: press,
            style: TextButton.styleFrom(foregroundColor: Colors.green),
            child: const Text("Sell all"))
      ],
    );
  }
}
