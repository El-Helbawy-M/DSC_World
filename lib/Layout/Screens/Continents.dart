import 'package:dsc_world/Data/Handlers/ContinentHandler.dart';
import 'package:dsc_world/Data/Handlers/CountryHandler.dart';
import 'package:dsc_world/Layout/Constants.dart';
import 'package:dsc_world/Layout/Screens/FaviorateScreen.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'Countries.dart';
import 'CountryDetails.dart';

class Countinents extends StatefulWidget {
  Countinents({Key key}) : super(key: key);

  @override
  _CountinentsState createState() => _CountinentsState();
}

class _CountinentsState extends State<Countinents> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: FutureBuilder<Map>(
        future: ContinentHandler().getAllContinents(),
        builder: (context, snapshot) {
          if (snapshot.data != null) {
            Map data = snapshot.data;
            return SingleChildScrollView(
              child: Column(
                children: List.generate(
                  data.length,
                  (index) => InkWell(
                    onTap: () => Navigator.push(context, MaterialPageRoute(builder: (contxet) => Countries(ck: data.keys.elementAt(index)))),
                    child: Container(
                      height: 100,
                      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                      decoration: kHomeContainerDecoration,
                      child: Center(
                        child: Text(data.values.elementAt(index), style: kHomeTextStyle),
                      ),
                    ),
                  ),
                ),
              ),
            );
          } else
            return Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
