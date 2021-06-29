import 'package:flutter/material.dart';

class CountryDetails extends StatelessWidget {
  CountryDetails({Key key, this.details}) : super(key: key);
  final Map details;
  // linkedHASHmap == Map<String,String>
  final kLabelTextStyle = TextStyle(fontSize: 20);
  final kValueTextStyle = TextStyle(fontSize: 16, color: Colors.blue);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //================ 1
              Row(
                children: [
                  Text("The Name : ", style: kLabelTextStyle),
                  Padding(
                    padding: const EdgeInsets.only(top: 4.0),
                    child: Text('${details['name']}', style: kValueTextStyle),
                  )
                ],
              ),
              Row(
                children: [
                  Text("The Capital : ", style: kLabelTextStyle),
                  Padding(
                    padding: const EdgeInsets.only(top: 4.0),
                    child: Text('${details['capital']}', style: kValueTextStyle),
                  )
                ],
              ),

              //================
              Divider(height: 40, indent: 10, endIndent: 10, thickness: 2),
              //================
              //================ 2
              Row(
                children: [
                  Text("The phone : ", style: kLabelTextStyle),
                  Padding(
                    padding: const EdgeInsets.only(top: 4.0),
                    child: Text('${details['phone']}', style: kValueTextStyle),
                  )
                ],
              ),
              Row(
                children: [
                  Text("The Currency : ", style: kLabelTextStyle),
                  Padding(
                    padding: const EdgeInsets.only(top: 4.0),
                    child: Text('${details['currency']}', style: kValueTextStyle),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
