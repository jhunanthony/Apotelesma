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

  @override
  void initState() {
    super.initState();

    futureData = fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF100F40),
      body: Container(),
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
