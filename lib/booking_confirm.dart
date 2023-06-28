

import 'package:flutter/material.dart';
import 'package:skyriderairlinesapp/booking_form.dart';

import 'package:ticket_widget/ticket_widget.dart';
import 'dart:math';



class Ticketpreview extends StatelessWidget {
  String username;
  String from;
  String to;
  String date;
  String flightnum;
  int passenger;
  int price;
  String time;
  String type;

  Ticketpreview({Key? key, required this.from,required this.to,required this.passenger,required this.date,required this.flightnum,
    required this.price, required this.time, required this.type, required this.username}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    const _chars = 'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';
    //const _chars = 'A,B,C,D,E,F,1,2,3,4,5,6';
    Random _rnd = Random();

    String getRandomString(int length) => String.fromCharCodes(Iterable.generate(
        length, (_) => _chars.codeUnitAt(_rnd.nextInt(_chars.length))));

    String booknum =  getRandomString(15);
    String totpass = '$passenger person';
    String p = 'RM$price';



    return Scaffold(
      backgroundColor: Colors.white70,
      appBar: PreferredSize( //wrap with PreferredSize
          preferredSize: const Size.fromHeight(80), //height of appbar
          child: AppBar(
            centerTitle: true,
            title:const Text('\nBooking Details '), //appbar title
            backgroundColor: Colors.deepPurpleAccent, //appbar background color,
          )

      ),
      body: Center(
        child: TicketWidget(
          width: 350,
          height: 480,
          isCornerRounded: true,
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children:  <Widget>[
                    Container(
                      width: 120,
                      height: 25,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          border: Border.all(width: 1, color: Colors.green)
                      ),
                      child: Center(
                        child: Text(
                          'Booking Details',
                          style: TextStyle(
                              color: Colors.green
                          ),
                        ),
                      ),
                    ),
                    Row(
                      children: <Widget>[
                        Text(
                          from,
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 8),
                          child: Icon(
                            Icons.flight_takeoff,
                            color: Colors.pink,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 8),
                          child: Text(
                            to,
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold
                            ),
                          ),
                        )
                      ],
                    ),
                  ],
                ),

                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: Text(
                    '    Skyrider Airlines',
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 25),
                  child: Column(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(top: 12, right: 23),
                        child: ticketDetailsWidget('Passengers', totpass , 'Date', date),
                      ),

                      Padding(
                        padding: const EdgeInsets.only(top: 12, right: 40),
                        child: ticketDetailsWidget('Flight', flightnum, 'Time', time),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 12, right: 47),
                        child: ticketDetailsWidget('username', username, 'Price', p),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 80, left: 30, right: 30),
                  child: Container(
                    width: 250,
                    height: 60,
                    decoration: const BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage('assets/barcode.png'),
                            fit: BoxFit.cover
                        )
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10, left: 92),
                  child: Text(
                    //'9824 0972 1742 1298',
                    booknum, textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.black
                    ),
                  ),
                ),
                const SizedBox(height: 21),
                const Text('                       www.skyriderairlines.com', textAlign:TextAlign.center, ),
              ],
            ),
          ),
        ),
      ),

      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: Colors.deepPurpleAccent,
        extendedPadding: const EdgeInsets.all(163),
        onPressed: () {
          //TODO : ticket list
          Navigator.push(context, MaterialPageRoute(builder: (context) => booking_form(from:from, to: to, passenger: passenger, date: date, flightnum: flightnum, price: price, time: time, booknum : booknum, username: username, type: type,)));//signup screen
          //TODO : GOROUTER
          //setState(() {});
        },
        label: const Text("Next"),
      ),


    );
  }
}

Widget ticketDetailsWidget(String firstTitle, String firstDesc, String secondTitle, String secondDesc) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: <Widget>[
      Padding(
        padding: const EdgeInsets.only(left: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              firstTitle,
              style: TextStyle(
                  color: Colors.grey
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 4),
              child: Text(
                firstDesc,
                style: TextStyle(
                    color: Colors.black
                ),
              ),
            )
          ],
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(right: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              secondTitle,
              style: TextStyle(
                  color: Colors.grey
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 4),
              child: Text(
                secondDesc,
                style: TextStyle(
                    color: Colors.black
                ),
              ),
            )
          ],
        ),
      )
    ],
  );
}