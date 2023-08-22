import 'package:flutter/material.dart';
import 'package:travel_ui_flutter/config/constants/size_config.dart';
import 'package:travel_ui_flutter/models/destination_model.dart';

class DetailScreen extends StatelessWidget {
  final Destination destination;
  const DetailScreen({super.key, required this.destination});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(35),
                bottomRight: Radius.circular(35),
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black45,
                  offset: Offset(0, 8),
                  blurRadius: 24,
                  spreadRadius: 0,
                ),
              ],
            ),
            child: ClipRRect(
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(35),
                bottomRight: Radius.circular(35),
              ),
              child: Image.asset(
                destination.imageUrl,
                height: SizeConfig.screenHeight * 0.5,
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(height: 20),
          Expanded(
            child: ListView.builder(
              itemCount: destination.activities.length,
              itemBuilder: (context, index) {
                final activity = destination.activities[index];
                return Padding(
                  padding: const EdgeInsets.only(
                    bottom: 10,
                    right: 10,
                  ),
                  child: SizedBox(
                    height: 150,
                    child: Stack(
                      alignment: Alignment.centerRight,
                      children: [
                        Container(
                          width: SizeConfig.screenWidth * 0.85,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Column(
                            children: [
                              const SizedBox(height: 20),
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 70, right: 10),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Expanded(
                                        child: Text(
                                      activity.name,
                                      style: const TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    )),
                                    const SizedBox(width: 60),
                                    // Text('${activity.price}'),
                                    RichText(
                                      textAlign: TextAlign.center,
                                      text: TextSpan(
                                        text: '\$${activity.price}\n',
                                        style: const TextStyle(
                                            color: Colors.black,
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold),
                                        children: [
                                          TextSpan(
                                            text: 'Per Day',
                                            style: TextStyle(
                                                color: Colors.grey[300],
                                                fontSize: 14,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        Positioned(
                          left: 0,
                          top: 0,
                          bottom: 0,
                          child: Padding(
                            padding: const EdgeInsets.all(10),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(20),
                              child: Container(
                                height: 200,
                                width: 100,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: AssetImage(activity.imageUrl),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                );
              },
            ),
          )
          // add singlechildscrollview
          // ...List.generate(
          //   destination.activities.length,
          //   (index) => const _DemoLayout(),
          // )
        ],
      ),
    );
  }
}

class _DemoLayout extends StatelessWidget {
  const _DemoLayout();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.red,
      width: double.infinity,
      padding: const EdgeInsets.only(left: 40, top: 10, right: 10),
      height: 200,
      child: Stack(
        alignment: Alignment.centerRight,
        children: [
          Container(
            width: SizeConfig.screenWidth * 0.8,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.blue,
            ),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 80, top: 10, right: 10),
                  child: Container(
                    color: Colors.orange,
                    height: 80,
                  ),
                )
              ],
            ),
          ),
          Positioned(
            left: 0,
            top: 0,
            bottom: 0,
            child: Padding(
              padding: const EdgeInsets.all(13.0),
              child: Container(
                color: Colors.amber,
                width: 60,
                height: 70,
              ),
            ),
          )
        ],
      ),
    );
  }
}
