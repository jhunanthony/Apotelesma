import 'package:flip_card/flip_card.dart';
import 'package:flip_card/flip_card_controller.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as https;

// ignore: use_key_in_widget_constructors
class HoroscopeData {
  final int id;
  final String symbol;
  final String element;
  final String fortune;
  final String jewelry;
  final String daterRange;
  final String keyTraits;
  final String luckyColor;
  final String zodiacSign;
  final String luckyNumber;
  final String compatibility;
  final String rulingPlanet;

  HoroscopeData({
    @required this.id,
    @required this.symbol,
    @required this.element,
    @required this.fortune,
    @required this.jewelry,
    @required this.daterRange,
    @required this.keyTraits,
    @required this.luckyColor,
    @required this.zodiacSign,
    @required this.luckyNumber,
    @required this.compatibility,
    @required this.rulingPlanet,
  });

  factory HoroscopeData.fromJson(Map<String, dynamic> json) {
    return HoroscopeData(
      id: json['id'],
      symbol: json['Symbol'],
      element: json['Element'],
      fortune: json['Fortune'],
      jewelry: json['Jewelry'],
      daterRange: json['Date Range'],
      keyTraits: json['Key Traits'],
      luckyColor: json['Lucky Color'],
      zodiacSign: json['Zodiac Sign'],
      luckyNumber: json['Lucky Number'],
      compatibility: json['Compatibility'],
      rulingPlanet: json['Ruling Planet'],
    );
  }
}

List buttons = [
  ({
    "index": "0",
    "imgName": "asset/images/AriesSymbol.png",
    "name": "Aries",
  }),
  ({
    "index": "1",
    "imgName": "asset/images/TaurusSymbol.png",
    "name": "Taurus",
  }),
  ({
    "index": "2",
    "imgName": "asset/images/GeminiSymbol.png",
    "name": "Gemini",
  }),
  ({
    "index": "3",
    "imgName": "asset/images/CancerSymbol.png",
    "name": "Cancer",
  }),
  ({
    "index": "4",
    "imgName": "asset/images/LeoSymbol.png",
    "name": "Leo",
  }),
  ({
    "index": "5",
    "imgName": "asset/images/VirgoSymbol.png",
    "name": "Virgo",
  }),
  ({
    "index": "6",
    "imgName": "asset/images/LibraSymbol.png",
    "name": "Libra",
  }),
  ({
    "index": "7",
    "imgName": "asset/images/ScorpioSymbol.png",
    "name": "Scorpio",
  }),
  ({
    "index": "8",
    "imgName": "asset/images/SagittariusSymbol.png",
    "name": "Sagittarius",
  }),
  ({
    "index": "9",
    "imgName": "asset/images/CapricornSymbol.png",
    "name": "Capricorn",
  }),
  ({
    "index": "10",
    "imgName": "asset/images/AquariusSymbol.png",
    "name": "Aquarius",
  }),
  ({
    "index": "11",
    "imgName": "asset/images/PiscesSymbol.png",
    "name": "Pisces",
  }),
];

Future<List<HoroscopeData>> fetchData() async {
  const requestURL = "https://retoolapi.dev/ztGnOD/data";

  final response = await https.get(Uri.parse(requestURL));

  if (response.statusCode == 200) {
    List jsonResponse = json.decode(response.body);
    return jsonResponse.map((data) => HoroscopeData.fromJson(data)).toList();
  } else {
    throw Exception('Unexpected error occured!');
  }
}

class HoroscopePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return HoroscopePageState();
  }
}

class HoroscopePageState extends State<HoroscopePage> {
  Future<List<HoroscopeData>> futureData;
  GlobalKey<FlipCardState> cardKey = GlobalKey<FlipCardState>();
  @override
  void initState() {
    super.initState();

    futureData = fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF100F40),
      body: Container(
          padding: const EdgeInsets.all(30),
          decoration: const BoxDecoration(
            image: DecorationImage(
                opacity: 0.3,
                image: AssetImage('asset/images/ApotelesmaBackground.jpg'),
                fit: BoxFit.fill),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              //TOP NAV BAR
              const Align(
                alignment: Alignment.centerLeft,
                child: Text('Apotelesma',
                    style: TextStyle(
                        fontFamily: 'Codiac',
                        fontSize: 25,
                        color: Colors.white)),
              ),
              //PAGE TITLE
              const Text('2022 HOROSCOPE',
                  style: TextStyle(
                      fontFamily: 'Codiac', fontSize: 50, color: Colors.white)),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  FlipCard(
                    flipOnTouch: false,
                    fill: Fill
                        .fillBack, // Fill the back side of the card to make in the same size as the front.
                    direction: FlipDirection.HORIZONTAL, // default
                    front: Container(
                      height: 380,
                      width: 230,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        image: const DecorationImage(
                            image: AssetImage('asset/images/Card1.jpg'),
                            fit: BoxFit.fill),
                      ),
                      child: const Text('Front'),
                    ),
                    back: Container(
                      height: 380,
                      width: 230,
                      child: const Text('Back'),
                    ),
                  ),
                  FlipCard(
                    fill: Fill
                        .fillBack, // Fill the back side of the card to make in the same size as the front.
                    direction: FlipDirection.HORIZONTAL, // default
                    front: Container(
                      height: 380,
                      width: 230,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          image: const DecorationImage(
                              image: AssetImage('asset/images/Card2.jpg'),
                              fit: BoxFit.cover),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.purple[900],
                              spreadRadius: 4,
                              blurRadius: 20,
                            ),
                            BoxShadow(
                              color: Colors.purple[900],
                              spreadRadius: -4,
                              blurRadius: 5,
                            )
                          ]),
                      child: const Text('Front'),
                    ),
                    back: Container(
                      height: 380,
                      width: 230,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          image: const DecorationImage(
                              image: AssetImage('asset/images/Card1.jpg'),
                              fit: BoxFit.fill),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.purple[900],
                              spreadRadius: 4,
                              blurRadius: 20,
                            ),
                            BoxShadow(
                              color: Colors.purple[900],
                              spreadRadius: -4,
                              blurRadius: 5,
                            )
                          ]),
                      child: const Text('Back'),
                    ),
                  ),
                  FlipCard(
                    fill: Fill
                        .fillBack, // Fill the back side of the card to make in the same size as the front.
                    direction: FlipDirection.HORIZONTAL, // default
                    front: Container(
                      height: 380,
                      width: 230,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          image: const DecorationImage(
                              image: AssetImage('asset/images/Card2.jpg'),
                              fit: BoxFit.cover),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.purple[900],
                              spreadRadius: 4,
                              blurRadius: 20,
                            ),
                            BoxShadow(
                              color: Colors.purple[900],
                              spreadRadius: -4,
                              blurRadius: 5,
                            )
                          ]),
                      child: const Text('Front'),
                    ),
                    back: Container(
                      height: 380,
                      width: 230,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          image: const DecorationImage(
                              image: AssetImage('asset/images/Card1.jpg'),
                              fit: BoxFit.fill),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.purple[900],
                              spreadRadius: 4,
                              blurRadius: 20,
                            ),
                            BoxShadow(
                              color: Colors.purple[900],
                              spreadRadius: -4,
                              blurRadius: 5,
                            )
                          ]),
                      child: const Text('Back'),
                    ),
                  ),
                  FlipCard(
                    fill: Fill
                        .fillBack, // Fill the back side of the card to make in the same size as the front.
                    direction: FlipDirection.HORIZONTAL, // default
                    front: Container(
                      height: 380,
                      width: 230,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          image: const DecorationImage(
                              image: AssetImage('asset/images/Card2.jpg'),
                              fit: BoxFit.cover),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.purple[900],
                              spreadRadius: 4,
                              blurRadius: 20,
                            ),
                            BoxShadow(
                              color: Colors.purple[900],
                              spreadRadius: -4,
                              blurRadius: 5,
                            )
                          ]),
                      child: const Text('Front'),
                    ),
                    back: Container(
                      height: 380,
                      width: 230,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          image: const DecorationImage(
                              image: AssetImage('asset/images/Card1.jpg'),
                              fit: BoxFit.fill),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.purple[900],
                              spreadRadius: 4,
                              blurRadius: 20,
                            ),
                            BoxShadow(
                              color: Colors.purple[900],
                              spreadRadius: -4,
                              blurRadius: 5,
                            )
                          ]),
                      child: const Text('Back'),
                    ),
                  )
                ],
              ),

              //buttonshere
              Container(
                alignment: Alignment.center,
                height: 100,
                width: MediaQuery.of(context).size.width,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: buttons.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {},
                        child: Container(
                          padding: const EdgeInsets.all(10),
                          margin: const EdgeInsets.only(
                              top: 20, bottom: 20, right: 10, left: 10),
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              gradient: LinearGradient(
                                begin: Alignment.centerLeft,
                                end: Alignment.centerRight,
                                colors: <Color>[
                                  Colors.purple[900],
                                  const Color(0xFF100F40),
                                  const Color(0xFF100F40)
                                ],
                              ),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.purple[900],
                                  spreadRadius: 1,
                                  blurRadius: 5,
                                ),
                              ]),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Image.asset(
                                '${buttons[index]['imgName']}',
                                height: 16,
                                width: 16,
                              ),
                              const SizedBox(width: 10),
                              Text('${buttons[index]['name']}',
                                  style: const TextStyle(
                                      fontFamily: 'Tapestry',
                                      fontSize: 14,
                                      color: Colors.white)),
                            ],
                          ),
                        ),
                      );
                    }),
              )
            ],
          )),
    );
  }
}
