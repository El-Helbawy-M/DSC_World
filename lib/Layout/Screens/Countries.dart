import 'package:dsc_world/Data/Handlers/ContinentHandler.dart';
import 'package:dsc_world/Data/Handlers/CountryHandler.dart';
import 'package:dsc_world/Layout/Widgets/FavoraiteButton.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../Constants.dart';
import 'CountryDetails.dart';

class Countries extends StatefulWidget {
  Countries({Key key, this.ck}) : super(key: key);
  final ck;
  @override
  _CountriesState createState() => _CountriesState();
}

class _CountriesState extends State<Countries> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: FutureBuilder<Map>(
          future: CountryHandler().getAllCountries(),
          builder: (context, snapshot) {
            if (snapshot.data != null) {
              print(snapshot.data);
              List<MapEntry> data = snapshot.data.entries.where((element) {
                return element.value['continent'] == widget.ck;
              }).toList();
              // print(data);
              return GridView(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
                children: List.generate(
                  data.length,
                  (index) {
                    return Stack(
                      alignment: Alignment.topRight,
                      children: [
                        InkWell(
                          onTap: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context) => CountryDetails(details: data[index].value)));
                          },
                          child: Container(
                            padding: EdgeInsets.all(10),
                            margin: EdgeInsets.all(10),
                            decoration: kDefaultContainerDecoration,
                            child: Center(
                              child: Text(data[index].value['name'], style: kDefaultTextStyle),
                            ),
                          ),
                        ),
                        Positioned(right: 5, top: 5, child: FaviroteButton(data: data, index: index))
                      ],
                    );
                  },
                ),
              );
            } else
              return Center(child: CircularProgressIndicator());
          },
        ),
      ),
    );
  }
}

List m = [1, 2, 3, 4, 5, 6, 7];



//List s = m.where((e)=> e >= 3).toList()
// s = [3,4,5,6,7];
// s = m.map((e){
// if(e >= 3) return e + 5;
// else return e;
// }).toList();
// s= [1 , 2 , 8]
