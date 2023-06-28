import 'package:flutter/material.dart';

import 'package:skyriderairlinesapp/content_card.dart';
import 'package:alert_dialog/alert_dialog.dart';


class HomePage extends StatelessWidget {
  final String username;

  //constructor
  HomePage({required this.username});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(

        children: <Widget>[
          //const appbar(height: 210.0),

          Positioned.fill(
            child: Padding(
              padding: EdgeInsets.only(
                  top: MediaQuery.of(context).padding.top),
              child: Column(
                children: <Widget>[

                  Expanded(child: ContentCard(username: username,)),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }






}
