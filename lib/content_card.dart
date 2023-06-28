import 'package:skyriderairlinesapp/my_bookings.dart';
import 'package:flutter/material.dart';
import 'package:skyriderairlinesapp/oneway_input.dart';


import 'main.dart';


class ContentCard extends StatefulWidget {
String username;

ContentCard({Key? key, required this.username,}) : super(key: key);


  @override
  _ContentCardState createState() => _ContentCardState();
}

class _ContentCardState extends State<ContentCard> {

  @override
  Widget build(BuildContext context) {

    String username = widget.username;

    return DefaultTabController(
      length: 2,

      child: Scaffold(
          body: NestedScrollView(
            headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
              return <Widget>[
                 SliverAppBar(
                   actions: <Widget>[
                     IconButton(
                       icon: const Icon(Icons.logout_outlined),
                       tooltip: 'Add new entry',
                       onPressed: () {    Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (_) => MyStatefulWidget()), (Route<dynamic> route) => false);
                       },
                     ),
                   ],

                  backgroundColor: Colors.deepPurpleAccent,
                  pinned: true,
                  floating: false,

                  bottom: const TabBar(
                    indicatorColor: Colors.redAccent,
                    isScrollable: true,
                    tabs: [
                      Tab(child: Text('One-way')),
                     // Tab(child: Text('Round')),
                      Tab(child: Text('My Bookings')),

                    ],
                  ),
                  title: Center(
                    child: Text('              Skyrider Airlines\n                Welcome $username'),

                  ),

                ),
              ];
            },
            body:   TabBarView(
              children: <Widget>[
               OneWayInput(username: username,),
               // PastTicket(userName: username,),
                MyBooking(userName: username),
                //Icon(Icons.directions_car, size: 350),

              ],
            ),
          )),
    );

  }




}