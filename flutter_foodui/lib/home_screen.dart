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
            backgroundColor: Colors.transparent,
            elevation: 0,
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
          SliverToBoxAdapter(
            child: AspectRatio(
              aspectRatio: 1.81,
              child: Stack(
                alignment: Alignment.bottomRight,
                children: [
                  PageView.builder(
                      itemCount: demoBigImages.length,
                      itemBuilder: (context, index) =>
                          Image.asset(demoBigImages[index])),
                  Positioned(
                      bottom: 16,
                      right: 16,
                      child: Row(
                        children: List.generate(
                            demoBigImages.length,
                            (index) => Padding(
                                  padding: const EdgeInsets.only(left: 16 / 4),
                                  child: IndicatorDot(isActive: index == 1),
                                )),
                      ))
                ],
              ),
            ),
          )
        ],
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
          color: isActive ? Colors.white : Colors.white54,
          borderRadius: const BorderRadius.all(Radius.circular(12))),
    );
  }
}
