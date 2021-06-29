import 'package:dsc_world/Data/Handlers/CountryHandler.dart';
import 'package:flutter/material.dart';

import '../Constants.dart';
import 'CountryDetails.dart';

class Faviorates extends StatefulWidget {
  Faviorates({Key key, this.list}) : super(key: key);
  final List list;
  @override
  _FavioratesState createState() => _FavioratesState();
}

class _FavioratesState extends State<Faviorates> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: CountryHandler().getAllCountries(),
      builder: (context, snapShot) {
        if (snapShot.data != null) {
          List<MapEntry> data = snapShot.data.entries.where((element) {
            return widget.list.contains(element.value['name']);
          }).toList();
          return GridView(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
            children: List.generate(
              data.length,
              (index) => InkWell(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => CountryDetails(details: data[index].value)));
                },
                child: Container(
                  margin: EdgeInsets.all(10),
                  decoration: kHomeContainerDecoration,
                  child: Center(
                    child: Text(data[index].value['name'], style: kHomeTextStyle),
                  ),
                ),
              ),
            ),
          );
        } else
          return Center(
            child: CircularProgressIndicator(),
          );
      },
    );
  }
}
