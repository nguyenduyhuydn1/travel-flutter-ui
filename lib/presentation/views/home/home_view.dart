import 'package:flutter/material.dart';
import 'package:travel_ui_flutter/config/constants/size_config.dart';
import 'package:travel_ui_flutter/models/destination_model.dart';
import 'package:travel_ui_flutter/models/hotel_model.dart';
import 'package:travel_ui_flutter/presentation/widgets/custom_title.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 20),
            Padding(
              padding: EdgeInsets.only(left: 20),
              child: Text(
                "what would you like to find ?",
                style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(height: 15),
            Padding(
              padding: EdgeInsets.only(left: 20),
              child: _ButtonsSection(),
            ),
            SizedBox(height: 25),
            _DestinationSection(),
            _HotelsSection(),
            SizedBox(height: 80),
          ],
        ),
      ),
    );
  }
}

class _HotelsSection extends StatelessWidget {
  const _HotelsSection();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Padding(
          padding: EdgeInsets.only(left: 20),
          child: CustomTitle(text: "Exclusive Hotels"),
        ),
        const SizedBox(height: 20),
        SizedBox(
          height: 300,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: hotels.length,
            itemBuilder: (context, index) {
              final hotel = hotels[index];
              return Padding(
                padding: index == 0
                    ? const EdgeInsets.only(right: 20, left: 20)
                    : const EdgeInsets.only(right: 20),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.asset(
                    hotel.imageUrl,
                    width: SizeConfig.screenWidth * 0.9,
                    fit: BoxFit.cover,
                  ),
                ),
              );
            },
          ),
        )
      ],
    );
  }
}

class _DestinationSection extends StatelessWidget {
  const _DestinationSection();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Padding(
          padding: EdgeInsets.only(left: 20),
          child: CustomTitle(text: "Top Destinations"),
        ),
        const SizedBox(height: 20),
        SizedBox(
          height: 300,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: destinations.length,
            itemBuilder: (context, index) {
              final destination = destinations[index];
              return Padding(
                padding: index == 0
                    ? const EdgeInsets.only(right: 20, left: 20)
                    : const EdgeInsets.only(right: 20),
                child: SizedBox(
                  width: SizeConfig.screenWidth * 0.6,
                  child: Stack(
                    alignment: Alignment.bottomLeft,
                    children: [
                      Container(
                        width: SizeConfig.screenWidth * 0.6,
                        height: 120,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          // boxShadow: const [
                          //   BoxShadow(
                          //     offset: Offset(1, 2),
                          //     spreadRadius: 3,
                          //     blurRadius: 9,
                          //     color: Colors.black26,
                          //   ),
                          // ],
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                destination.activities[0].type,
                                style: const TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 10),
                              Text(
                                destination.description,
                                style: TextStyle(
                                  color: Colors.grey[400],
                                  fontSize: 14,
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      Positioned(
                        top: 0,
                        left: 0,
                        right: 0,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: Container(
                              height: 200,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage(destination.imageUrl),
                                  fit: BoxFit.cover,
                                ),
                              ),
                              child: Stack(
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      gradient: const LinearGradient(
                                        colors: [
                                          Colors.black45,
                                          Colors.transparent
                                        ],
                                        begin: Alignment.bottomCenter,
                                        end: Alignment.topCenter,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 15,
                                      vertical: 10,
                                    ),
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          destination.city,
                                          style: const TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white,
                                          ),
                                        ),
                                        const SizedBox(height: 8),
                                        Row(
                                          children: [
                                            const Icon(
                                              Icons.compass_calibration,
                                              size: 10,
                                              color: Colors.white,
                                            ),
                                            const SizedBox(width: 8),
                                            Text(
                                              destination.country,
                                              style: const TextStyle(
                                                fontSize: 16,
                                                color: Colors.white,
                                              ),
                                            )
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}

class _ButtonsSection extends StatefulWidget {
  const _ButtonsSection();

  @override
  State<_ButtonsSection> createState() => _ButtonsSectionState();
}

class _ButtonsSectionState extends State<_ButtonsSection> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        // RawMaterialButton(
        //   onPressed: () {},
        //   elevation: 2.0,
        //   fillColor: Colors.blue,
        //   padding: const EdgeInsets.all(15.0),
        //   shape: const CircleBorder(),
        //   child: const Icon(Icons.pause, size: 35.0),
        // )
        ...List.generate(
          4,
          (index) => ElevatedButton(
            onPressed: () {
              setState(() {
                currentIndex = index;
              });
            },
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.all(25),
              elevation: 0,
              shadowColor: Colors.transparent,
              shape: const CircleBorder(),
              backgroundColor: currentIndex == index ? null : Colors.grey,
            ),
            child: const Icon(Icons.place_rounded),
          ),
        )
      ],
    );
  }
}
