import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FaviroteButton extends StatefulWidget {
  FaviroteButton({Key key, this.data, this.index}) : super(key: key);
  final List data;
  final int index;
  @override
  _FaviroteButtonState createState() => _FaviroteButtonState();
}

class _FaviroteButtonState extends State<FaviroteButton> {
  bool check = false;
  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon((check) ? Icons.favorite : Icons.favorite_border),
      onPressed: () async {
        SharedPreferences pref;
        while (pref == null) pref = await SharedPreferences.getInstance();
        setState(() {
          //1 : get list fro shared
          check = !check;
          List<String> list = [];

          if (pref.containsKey('Faviorates'))
            list = pref.getStringList('Faviorates');
          else
            pref.setStringList('Faviorates', list);
          //====================
          //2: add or remove value from list
          (check) ? list.add(widget.data[widget.index].value['name']) : list.remove(widget.data[widget.index].value['name']);
          //====================
          //3: set the new
          pref.setStringList('Faviorates', list);
          print(list);
        });
      },
    );
  }
}
