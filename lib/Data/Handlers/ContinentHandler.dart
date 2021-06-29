import 'dart:convert';

import 'package:flutter/services.dart';

class ContinentHandler {
  Future<Map> getContinent(String name) async {
    Map data = jsonDecode(await rootBundle.loadString('Assets/data.json'));
    return data["continents"][name];
  }

  Future<Map> getAllContinents() async {
    Map data = jsonDecode(await rootBundle.loadString('Assets/data.json'));
    return data["continents"];
  }
}
