import 'dart:convert';

import 'package:flutter/services.dart';

class CountryHandler {
  Future<Map> getCountry(String name) async {
    Map data = jsonDecode(await rootBundle.loadString('Assets/data.json'));
    return data["countries"][name];
  }

  Future<Map> getAllCountries() async {
    Map data = jsonDecode(await rootBundle.loadString('Assets/data.json'));
    return data["countries"];
  }
}
