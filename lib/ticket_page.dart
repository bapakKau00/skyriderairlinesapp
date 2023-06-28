//ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:skyriderairlinesapp/booking_confirm.dart';
import 'package:skyriderairlinesapp/booking_form.dart';
/// Flutter code sample for [Card].

class TicketList extends StatelessWidget {
  String from,to,date,username;
  var passenger;

  TicketList({Key? key,required this.from,required this.to,required this.passenger,required this.date,required this.username}) : super(key: key);


  @override
  Widget build(BuildContext context) {

    var timeKL_KB =["8.00 AM", "12.00 PM", "3.00 PM", "9.00 PM"];
    var timeKB_KL =["10.00 AM", "2.00 PM", "5.00 PM"];
    var timeKL_TG =["10.00 AM", "5.00 PM"];
    var timeTG_KL =["1.00 PM", "9.00 PM"];
    var timeKL_PNG =["6.45 AM", "5.00 PM", "9.00 PM"];
    var timePNG_KL =["8.00 AM", "7.00 PM", "9.00 PM"];
    var timeKL_JB =["8.00 AM", "12.00 PM", "5.00 PM", "9.00 PM"];
    var timeJB_KL =["6.40 AM", "10.00 AM", "3.00 PM", "8.00 PM"];
    var timeKB_JB =["10.00 AM", "5.00 PM"];
    //var timeJB_KB =["11.00 AM", "9.00 PM"];


    var flightnum = ["SR7884", "SR6443", "SR7849"];
    var flightKL_TG = ["SR7801", "SR6333"];
    var flightKL_PNG = ["SR7001", "SR4633"];
    var flightKL_JB = ["SR3431", "SR5622", "SR3444"];
    var flightKB_JB = ["SR9821", "SR9822"];


    var people = int.parse(passenger);  // change string to integer
    var price = [55,65,75,99,180];


    var totPrice = [price[0]*people, price[1]*people,price[2]*people,price[3]*people,price[4]*people];

    var flighttype = 'Oneway';


    return Scaffold(
      appBar: PreferredSize( //wrap with PreferredSize
          preferredSize: const Size.fromHeight(80), //height of appbar
          child: AppBar(
            centerTitle: true,
            title:const Text('\nTicket List'), //appbar title
            backgroundColor: Colors.deepPurpleAccent, //appbar background color,
          )

      ),

      body : Builder(
        builder: (BuildContext context)
        {
          if (from =='DropDownValueModel(Kuala Lumpur(KUL))' && to == 'DropDownValueModel(Kota Bharu(KBR))') {
            return Card(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,

                children: [
                  //ticket 1 8.00 am

                  ListTile(
                    leading: Icon(Icons.flight_takeoff_sharp, size: 50 ,color: Colors.deepPurpleAccent),
                    title: Text('Kuala Lumpur(KUL)' + ' > ' + 'Kota Bharu(KBR)'), //title: Text(from + ' to ' + to),
                    subtitle: Text('Flight : ${flightnum[0]} \t\t          Time : ${timeKL_KB[0]}'),
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      TextButton(
                        child: const Text('BOOK TICKETS', style: TextStyle(color: Colors.deepPurpleAccent),),
                        onPressed: () {

                          //TODO : OUPUT SELECTED VALUE
                          from = 'KUL';
                          to = 'KBR';



                         //Navigator.push(context, MaterialPageRoute(builder: (context) => Home(flightnum: flightnum[0], time: timeKL_KB[0], date : date, price: totPrice[0])));//signup screen
                          Navigator.push(context, MaterialPageRoute(builder: (context) => Ticketpreview(from: from, to: to, passenger: people, date: date, flightnum: flightnum[0], price: totPrice[0], time : timeKL_KB[0], type: flighttype, username: username,)));//signup screen

                          print("tapped 1");},
                      ),
                      const SizedBox(width: 8),
                      TextButton(
                        child:  Text('RM  ${totPrice[0]}', style: TextStyle(color: Colors.deepPurpleAccent),),
                        onPressed: () {/* ... */},
                      ),
                      const SizedBox(width: 8),

                    ],
                  ),

                  const Divider(
                    height: 20,
                    thickness: 1,
                    indent: 20,
                    endIndent: 20,
                    color: Colors.black38,
                  ),

                  //ticket 2 11.00 am
                  ListTile(
                    leading: Icon(Icons.flight_takeoff_sharp, size: 50 ,color: Colors.deepPurpleAccent),
                    title: Text('Kuala Lumpur(KUL)' + ' > ' + 'Kota Bharu(KBR)'), //title: Text(from + ' to ' + to),
                    subtitle: Text('Flight : ${flightnum[1]}\t\t            Time : ${timeKL_KB[1]}'),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      TextButton(
                        child: const Text('BOOK TICKETS', style: TextStyle(color: Colors.deepPurpleAccent),),
                        onPressed: () {
                          from = 'KUL';
                          to = 'KBR';
                          Navigator.push(context, MaterialPageRoute(builder: (context) => Ticketpreview(from: from, to: to, passenger: people, date: date, flightnum: flightnum[1], price: totPrice[1], time : timeKL_KB[1],type: flighttype,username: username)));//signup screen

                          print("tapped 2");},
                      ),
                      const SizedBox(width: 8),
                      TextButton(
                        child:  Text('RM  ${totPrice[1]}', style: TextStyle(color: Colors.deepPurpleAccent),),
                        onPressed: () {/* ... */},
                      ),
                      const SizedBox(width: 8),

                    ],
                  ),

                  const Divider(
                    height: 20,
                    thickness: 1,
                    indent: 20,
                    endIndent: 20,
                    color: Colors.black38,
                  ),

                  //ticket 3 2.00 pm
                  ListTile(
                    leading: Icon(Icons.flight_takeoff_sharp, size: 50 ,color: Colors.deepPurpleAccent),
                    title: Text('Kuala Lumpur(KUL)' + ' > ' + 'Kota Bharu(KBR)'), //title: Text(from + ' to ' + to),
                    subtitle: Text('Flight :${flightnum[0]} \t\t           Time : ${timeKL_KB[2]}'),

                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      TextButton(
                        child: const Text('BOOK TICKETS', style: TextStyle(color: Colors.deepPurpleAccent),),
                        onPressed: () {
                          from = 'KUL';
                          to = 'KBR';
                          Navigator.push(context, MaterialPageRoute(builder: (context) => Ticketpreview(from: from, to: to, passenger: people, date: date, flightnum: flightnum[0], price: totPrice[2], time : timeKL_KB[2],type: flighttype,username: username)));//signup screen

                          print("tapped 3");},
                      ),

                      const SizedBox(width: 8),
                      TextButton(
                        child:  Text('RM  ${totPrice[2]}', style: TextStyle(color: Colors.deepPurpleAccent),),
                        onPressed: () {/* ... */},
                      ),
                      const SizedBox(width: 8),

                    ],
                  ),

                  const Divider(
                    height: 20,
                    thickness: 1,
                    indent: 20,
                    endIndent: 20,
                    color: Colors.black38,
                  ),

                  //ticket 4 9.00 pm
                  ListTile(
                    leading: Icon(Icons.flight_takeoff_sharp, size: 50 ,color: Colors.deepPurpleAccent),
                    title: Text('Kuala Lumpur(KUL)' + ' > ' + 'Kota Bharu(KBR)'), //title: Text(from + ' to ' + to),
                    subtitle: Text('Flight : ${flightnum[2]} \t\t          Time : ${timeKL_KB[3]}'),

                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      TextButton(
                        child: const Text('BOOK TICKETS', style: TextStyle(color: Colors.deepPurpleAccent),),
                        onPressed: () {
                          from = 'KUL';
                          to = 'KBR';
                          Navigator.push(context, MaterialPageRoute(builder: (context) => Ticketpreview(from: from, to: to, passenger: people, date: date, flightnum: flightnum[2], price: totPrice[3], time : timeKL_KB[3],type: flighttype,username: username)));//signup screen

                          print("tapped 4");},
                      ),
                      const SizedBox(width: 8),
                      TextButton(
                        child:  Text('RM  ${totPrice[3]}', style: TextStyle(color: Colors.deepPurpleAccent),),
                        onPressed: () {/* ... */},
                      ),
                      const SizedBox(width: 8),

                    ],
                  ),
                ],

              ),



            );
          }
          else if (from =='DropDownValueModel(Kota Bharu(KBR))' && to == 'DropDownValueModel(Kuala Lumpur(KUL))'){
            return Card(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,

                children: [
                  //ticket 1 10.00 am
                  ListTile(
                    leading: Icon(Icons.flight_takeoff_sharp, size: 50 ,color: Colors.deepPurpleAccent),
                    title: Text('Kota Bharu(KBR)' + ' > ' + 'Kuala Lumpur(KUL)'), //title: Text(from + ' to ' + to),
                    subtitle: Text('Flight : ${flightnum[0]} \t\t          Time : ${timeKB_KL[0]}'),
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      TextButton(
                        child: const Text('BOOK TICKETS', style: TextStyle(color: Colors.deepPurpleAccent),),
                        onPressed: () {
                          from = 'KBR';
                          to = 'KUL';
                          Navigator.push(context, MaterialPageRoute(builder: (context) => Ticketpreview(from: from, to: to, passenger: people, date: date, flightnum: flightnum[0], price: totPrice[0], time : timeKL_KB[0],type: flighttype,username: username)));//signup screen

                          print("tapped 2");},
                      ),
                      const SizedBox(width: 8),
                      TextButton(
                        child:  Text('RM  ${totPrice[0]}', style: TextStyle(color: Colors.deepPurpleAccent),),
                        onPressed: () {/* ... */},
                      ),
                      const SizedBox(width: 8),

                    ],
                  ),

                  const Divider(
                    height: 20,
                    thickness: 1,
                    indent: 20,
                    endIndent: 20,
                    color: Colors.black38,
                  ),

                  //ticket 2 11.00 am
                  ListTile(
                    leading: Icon(Icons.flight_takeoff_sharp, size: 50 ,color: Colors.deepPurpleAccent),
                    title: Text('Kota Bharu(KBR)' + ' > ' + 'Kuala Lumpur(KUL)'), //title: Text(from + ' to ' + to),
                    subtitle: Text('Flight : ${flightnum[1]}\t\t            Time : ${timeKB_KL[1]}'),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      TextButton(
                        child: const Text('BOOK TICKETS', style: TextStyle(color: Colors.deepPurpleAccent),),
                        onPressed: () {
                          from = 'KBR';
                          to = 'KUL';
                          Navigator.push(context, MaterialPageRoute(builder: (context) => Ticketpreview(from: from, to: to, passenger: people, date: date, flightnum: flightnum[1], price: totPrice[1], time : timeKB_KL[1],type: flighttype,username: username)));//signup screen

                          print("tapped 2");},
                      ),
                      const SizedBox(width: 8),
                      TextButton(
                        child:  Text('RM  ${totPrice[1]}', style: TextStyle(color: Colors.deepPurpleAccent),),
                        onPressed: () {/* ... */},
                      ),
                      const SizedBox(width: 8),

                    ],
                  ),

                  const Divider(
                    height: 20,
                    thickness: 1,
                    indent: 20,
                    endIndent: 20,
                    color: Colors.black38,
                  ),

                  //ticket 3 2.00 pm
                  ListTile(
                    leading: Icon(Icons.flight_takeoff_sharp, size: 50 ,color: Colors.deepPurpleAccent),
                    title: Text('Kota Bharu(KBR)' + ' > ' + 'Kuala Lumpur(KUL)'), //title: Text(from + ' to ' + to),
                    subtitle: Text('Flight :${flightnum[0]} \t\t           Time : ${timeKB_KL[2]}'),

                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      TextButton(
                        child: const Text('BOOK TICKETS', style: TextStyle(color: Colors.deepPurpleAccent),),
                        onPressed: () {
                          from = 'KBR';
                          to = 'KUL';
                          Navigator.push(context, MaterialPageRoute(builder: (context) => Ticketpreview(from: from, to: to, passenger: people, date: date, flightnum: flightnum[0], price: totPrice[2], time : timeKB_KL[2],type: flighttype,username: username)));//signup screen

                          print("tapped 3");},
                      ),
                      const SizedBox(width: 8),
                      TextButton(
                        child:  Text('RM  ${totPrice[2]}', style: TextStyle(color: Colors.deepPurpleAccent),),
                        onPressed: () {/* ... */},
                      ),
                      const SizedBox(width: 8),

                    ],
                  ),

                ],

              ),



            );
          }
          else if(from == 'DropDownValueModel(Kuala Lumpur(KUL))' && to== 'DropDownValueModel(Kuala Terengganu(TGG))'){
            return Card(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,

                children: [
                  //ticket 1 10.00 am
                  ListTile(
                    leading: Icon(Icons.flight_takeoff_sharp, size: 50 ,color: Colors.deepPurpleAccent),
                    title: Text('Kuala Lumpur(KUL)' + ' > ' + 'Terengganu(TGG)'), //title: Text(from + ' to ' + to),
                    subtitle: Text('Flight : ${flightKL_TG[0]} \t\t          Time : ${timeKL_TG[0]}'),
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      TextButton(
                        child: const Text('BOOK TICKETS', style: TextStyle(color: Colors.deepPurpleAccent),),
                        onPressed: () {
                          from = 'KUL';
                          to = 'TGG';
                          Navigator.push(context, MaterialPageRoute(builder: (context) => Ticketpreview(from: from, to: to, passenger: people, date: date, flightnum: flightKL_TG[0], price: totPrice[0], time : timeKL_TG[0],type: flighttype,username: username)));//signup screen

                          print("tapped 1");},
                      ),
                      const SizedBox(width: 8),
                      TextButton(
                        child:  Text('RM  ${totPrice[0]}', style: TextStyle(color: Colors.deepPurpleAccent),),
                        onPressed: () {/* ... */},
                      ),
                      const SizedBox(width: 8),

                    ],
                  ),

                  const Divider(
                    height: 20,
                    thickness: 1,
                    indent: 20,
                    endIndent: 20,
                    color: Colors.black38,
                  ),

                  //ticket 2 11.00 am
                  ListTile(
                    leading: Icon(Icons.flight_takeoff_sharp, size: 50 ,color: Colors.deepPurpleAccent),
                    title: Text('Kuala Lumpur(KUL)' + ' > ' + 'Terengganu(TGG)'), //title: Text(from + ' to ' + to),
                    subtitle: Text('Flight : ${flightKL_TG[1]}\t\t            Time : ${timeKL_TG[1]}'),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      TextButton(
                        child: const Text('BOOK TICKETS', style: TextStyle(color: Colors.deepPurpleAccent),),
                        onPressed: () {
                          from = 'KUL';
                          to = 'TGG';
                          Navigator.push(context, MaterialPageRoute(builder: (context) => Ticketpreview(from: from, to: to, passenger: people, date: date, flightnum: flightKL_TG[1], price: totPrice[1], time : timeKL_TG[1],type: flighttype,username: username)));//signup screen

                          print("tapped 2");},
                      ),
                      const SizedBox(width: 8),
                      TextButton(
                        child:  Text('RM  ${totPrice[1]}', style: TextStyle(color: Colors.deepPurpleAccent),),
                        onPressed: () {/* ... */},
                      ),
                      const SizedBox(width: 8),

                    ],
                  ),

                ],

              ),



            );
          }
          else if(from== 'DropDownValueModel(Kuala Terengganu(TGG))' && to == 'DropDownValueModel(Kuala Lumpur(KUL))' ){
            return Card(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,

                children: [
                  //ticket 1 10.00 am
                  ListTile(
                    leading: Icon(Icons.flight_takeoff_sharp, size: 50 ,color: Colors.deepPurpleAccent),
                    title: Text('Terengganu(TGG)' + ' > ' + 'Kuala Lumpur(KUL)'), //title: Text(from + ' to ' + to),
                    subtitle: Text('Flight : ${flightKL_TG[0]} \t\t          Time : ${timeTG_KL[0]}'),
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      TextButton(
                        child: const Text('BOOK TICKETS', style: TextStyle(color: Colors.deepPurpleAccent),),
                        onPressed: () {
                          from = 'TGG';
                          to = 'KUL';
                          Navigator.push(context, MaterialPageRoute(builder: (context) => Ticketpreview(from: from, to: to, passenger: people, date: date, flightnum: flightKL_TG[0], price: totPrice[0], time : timeTG_KL[0],type: flighttype,username: username)));//signup screen

                          print("tapped 1");},
                      ),
                      const SizedBox(width: 8),
                      TextButton(
                        child:  Text('RM  ${totPrice[0]}', style: TextStyle(color: Colors.deepPurpleAccent),),
                        onPressed: () {/* ... */},
                      ),
                      const SizedBox(width: 8),

                    ],
                  ),

                  const Divider(
                    height: 20,
                    thickness: 1,
                    indent: 20,
                    endIndent: 20,
                    color: Colors.black38,
                  ),

                  //ticket 2 11.00 am
                  ListTile(
                    leading: Icon(Icons.flight_takeoff_sharp, size: 50 ,color: Colors.deepPurpleAccent),
                    title: Text('Terengganu(TGG)' + ' > ' + 'Kuala Lumpur(KUL)'), //title: Text(from + ' to ' + to),
                    subtitle: Text('Flight : ${flightKL_TG[1]}\t\t            Time : ${timeTG_KL[1]}'),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      TextButton(
                        child: const Text('BOOK TICKETS', style: TextStyle(color: Colors.deepPurpleAccent),),
                        onPressed: () {
                          from = 'TGG';
                          to = 'KUL';
                          Navigator.push(context, MaterialPageRoute(builder: (context) => Ticketpreview(from: from, to: to, passenger: people, date: date, flightnum: flightKL_TG[1], price: totPrice[1], time : timeTG_KL[1],type: flighttype,username: username)));//signup screen

                          print("tapped 2");},
                      ),
                      const SizedBox(width: 8),
                      TextButton(
                        child:  Text('RM  ${totPrice[1]}', style: TextStyle(color: Colors.deepPurpleAccent),),
                        onPressed: () {/* ... */},
                      ),
                      const SizedBox(width: 8),

                    ],
                  ),

                ],

              ),



            );
          }
          else if(from == 'DropDownValueModel(Kuala Lumpur(KUL))' && to == 'DropDownValueModel(Penang(PEN))'){
            return Card(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,

                children: [
                  //ticket 1 6.45 AM
                  ListTile(
                    leading: Icon(Icons.flight_takeoff_sharp, size: 50 ,color: Colors.deepPurpleAccent),
                    title: Text('Kuala Lumpur(KUL)' + ' > ' + 'Penang(PEN)'), //title: Text(from + ' to ' + to),
                    subtitle: Text('Flight : ${flightKL_PNG[0]} \t\t          Time : ${timeKL_PNG[0]}'),
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      TextButton(
                        child: const Text('BOOK TICKETS', style: TextStyle(color: Colors.deepPurpleAccent),),
                        onPressed: () {
                          from = 'KUL';
                          to = 'PEN';
                          Navigator.push(context, MaterialPageRoute(builder: (context) => Ticketpreview(from: from, to: to, passenger: people, date: date, flightnum: flightKL_PNG[0], price: totPrice[0], time : timeKL_PNG[0],type: flighttype,username: username)));//signup screen

                          print("tapped 1");},
                      ),
                      const SizedBox(width: 8),
                      TextButton(
                        child:  Text('RM  ${totPrice[0]}', style: TextStyle(color: Colors.deepPurpleAccent),),
                        onPressed: () {/* ... */},
                      ),
                      const SizedBox(width: 8),

                    ],
                  ),

                  const Divider(
                    height: 20,
                    thickness: 1,
                    indent: 20,
                    endIndent: 20,
                    color: Colors.black38,
                  ),

                  //ticket 2 5.00 PM
                  ListTile(
                    leading: Icon(Icons.flight_takeoff_sharp, size: 50 ,color: Colors.deepPurpleAccent),
                    title: Text('Kuala Lumpur(KUL)' + ' > ' + 'Penang(PEN)'), //title: Text(from + ' to ' + to),
                    subtitle: Text('Flight : ${flightKL_PNG[1]}\t\t            Time : ${timeKL_PNG[1]}'),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      TextButton(
                        child: const Text('BOOK TICKETS', style: TextStyle(color: Colors.deepPurpleAccent),),
                        onPressed: () {
                          from = 'KUL';
                          to = 'PEN';
                          Navigator.push(context, MaterialPageRoute(builder: (context) => Ticketpreview(from: from, to: to, passenger: people, date: date, flightnum: flightKL_PNG[1], price: totPrice[1], time :timeKL_PNG[1],type: flighttype,username: username)));//signup screen

                          print("tapped 2");},
                      ),
                      const SizedBox(width: 8),
                      TextButton(
                        child:  Text('RM  ${totPrice[1]}', style: TextStyle(color: Colors.deepPurpleAccent),),
                        onPressed: () {/* ... */},
                      ),
                      const SizedBox(width: 8),

                    ],
                  ),

                  const Divider(
                    height: 20,
                    thickness: 1,
                    indent: 20,
                    endIndent: 20,
                    color: Colors.black38,
                  ),

                  //ticket 3 9.00 pm
                  ListTile(
                    leading: Icon(Icons.flight_takeoff_sharp, size: 50 ,color: Colors.deepPurpleAccent),
                    title: Text('Kuala Lumpur(KUL)' + ' > ' + 'Penang(PEN)'), //title: Text(from + ' to ' + to),
                    subtitle: Text('Flight : ${flightKL_PNG[1]}\t\t            Time : ${timeKL_PNG[2]}'),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      TextButton(
                        child: const Text('BOOK TICKETS', style: TextStyle(color: Colors.deepPurpleAccent),),
                        onPressed: () {
                          from = 'KUL';
                          to = 'PEN';
                          Navigator.push(context, MaterialPageRoute(builder: (context) => Ticketpreview(from: from, to: to, passenger: people, date: date, flightnum: flightKL_PNG[1], price: totPrice[1], time : timeKL_PNG[2],type: flighttype,username: username)));//signup screen

                          print("tapped 3");},
                      ),
                      const SizedBox(width: 8),
                      TextButton(
                        child:  Text('RM  ${totPrice[1]}', style: TextStyle(color: Colors.deepPurpleAccent),),
                        onPressed: () {/* ... */},
                      ),
                      const SizedBox(width: 8),

                    ],
                  ),

                ],

              ),



            );
          }
          else if(from == 'DropDownValueModel(Penang(PEN))' && to == 'DropDownValueModel(Kuala Lumpur(KUL))'){
            return Card(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,

                children: [
                  //ticket 1 6.45 AM
                  ListTile(
                    leading: Icon(Icons.flight_takeoff_sharp, size: 50 ,color: Colors.deepPurpleAccent),
                    title: Text('Penang(PEN)' + ' > ' + 'Kuala Lumpur(KUL)'), //title: Text(from + ' to ' + to),
                    subtitle: Text('Flight : ${flightKL_PNG[0]} \t\t          Time : ${timePNG_KL[0]}'),
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      TextButton(
                        child: const Text('BOOK TICKETS', style: TextStyle(color: Colors.deepPurpleAccent),),
                        onPressed: () {
                          from = 'PEN';
                          to = 'KUL';
                          Navigator.push(context, MaterialPageRoute(builder: (context) => Ticketpreview(from: from, to: to, passenger: people, date: date, flightnum: flightKL_PNG[0], price: totPrice[0], time : timePNG_KL[0],type: flighttype,username: username)));//signup screen

                          print("tapped 1");},
                      ),
                      const SizedBox(width: 8),
                      TextButton(
                        child:  Text('RM  ${totPrice[0]}', style: TextStyle(color: Colors.deepPurpleAccent),),
                        onPressed: () {/* ... */},
                      ),
                      const SizedBox(width: 8),

                    ],
                  ),

                  const Divider(
                    height: 20,
                    thickness: 1,
                    indent: 20,
                    endIndent: 20,
                    color: Colors.black38,
                  ),

                  //ticket 2 5.00 PM
                  ListTile(
                    leading: Icon(Icons.flight_takeoff_sharp, size: 50 ,color: Colors.deepPurpleAccent),
                    title: Text('Penang(PEN)' + ' > ' + 'Kuala Lumpur(KUL)'), //title: Text(from + ' to ' + to),
                    subtitle: Text('Flight : ${flightKL_PNG[1]}\t\t            Time : ${timePNG_KL[1]}'),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      TextButton(
                        child: const Text('BOOK TICKETS', style: TextStyle(color: Colors.deepPurpleAccent),),
                        onPressed: () {
                          from = 'PEN';
                          to = 'KUL';
                          Navigator.push(context, MaterialPageRoute(builder: (context) => Ticketpreview(from: from, to: to, passenger: people, date: date, flightnum: flightKL_PNG[1], price: totPrice[1], time : timePNG_KL[1],type: flighttype,username: username)));//signup screen

                          print("tapped 2");},
                      ),
                      const SizedBox(width: 8),
                      TextButton(
                        child:  Text('RM  ${totPrice[1]}', style: TextStyle(color: Colors.deepPurpleAccent),),
                        onPressed: () {/* ... */},
                      ),
                      const SizedBox(width: 8),

                    ],
                  ),

                  const Divider(
                    height: 20,
                    thickness: 1,
                    indent: 20,
                    endIndent: 20,
                    color: Colors.black38,
                  ),

                  //ticket 3 9.00 pm
                  ListTile(
                    leading: Icon(Icons.flight_takeoff_sharp, size: 50 ,color: Colors.deepPurpleAccent),
                    title: Text('Penang(PEN)' + ' > ' + 'Kuala Lumpur(KUL)'), //title: Text(from + ' to ' + to),
                    subtitle: Text('Flight : ${flightKL_PNG[1]}\t\t            Time : ${timePNG_KL[2]}'),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      TextButton(
                        child: const Text('BOOK TICKETS', style: TextStyle(color: Colors.deepPurpleAccent),),
                        onPressed: () {
                          from = 'PEN';
                          to = 'KUL';
                          Navigator.push(context, MaterialPageRoute(builder: (context) => Ticketpreview(from: from, to: to, passenger: people, date: date, flightnum: flightKL_PNG[1], price: totPrice[1], time : timePNG_KL[2],type: flighttype,username: username)));//signup screen

                          print("tapped 3");},
                      ),
                      const SizedBox(width: 8),
                      TextButton(
                        child:  Text('RM  ${totPrice[1]}', style: TextStyle(color: Colors.deepPurpleAccent),),
                        onPressed: () {/* ... */},
                      ),
                      const SizedBox(width: 8),

                    ],
                  ),

                ],

              ),

            );
          }
          else if(from == 'DropDownValueModel(Kuala Lumpur(KUL))' && to == 'DropDownValueModel(Johor Bahru(JBR))'){
            return Card(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,

                children: [
                  //ticket 1 6.45 AM
                  ListTile(
                    leading: Icon(Icons.flight_takeoff_sharp, size: 50 ,color: Colors.deepPurpleAccent),
                    title: Text('Kuala Lumpur(KUL)' + ' > ' + 'Johor Bahru(JBR)'), //title: Text(from + ' to ' + to),
                    subtitle: Text('Flight : ${flightKL_JB[0]} \t\t          Time : ${timeKL_JB[0]}'),
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      TextButton(
                        child: const Text('BOOK TICKETS', style: TextStyle(color: Colors.deepPurpleAccent),),
                        onPressed: () {
                          from = 'KUL';
                          to = 'JBR';
                          Navigator.push(context, MaterialPageRoute(builder: (context) => Ticketpreview(from: from, to: to, passenger: people, date: date, flightnum: flightKL_JB[0], price: totPrice[0], time : timeKL_JB[0],type: flighttype,username: username)));//signup screen

                          print("tapped 1");},
                      ),
                      const SizedBox(width: 8),
                      TextButton(
                        child:  Text('RM  ${totPrice[0]}', style: TextStyle(color: Colors.deepPurpleAccent),),
                        onPressed: () {/* ... */},
                      ),
                      const SizedBox(width: 8),

                    ],
                  ),

                  const Divider(
                    height: 20,
                    thickness: 1,
                    indent: 20,
                    endIndent: 20,
                    color: Colors.black38,
                  ),

                  //ticket 2 5.00 PM
                  ListTile(
                    leading: Icon(Icons.flight_takeoff_sharp, size: 50 ,color: Colors.deepPurpleAccent),
                    title: Text('Kuala Lumpur(KUL)' + ' > ' + 'Johor Bahru(JBR)'), //title: Text(from + ' to ' + to),
                    subtitle: Text('Flight : ${flightKL_JB[1]}\t\t            Time : ${timeKL_JB[1]}'),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      TextButton(
                        child: const Text('BOOK TICKETS', style: TextStyle(color: Colors.deepPurpleAccent),),
                        onPressed: () {
                          from = 'KUL';
                          to = 'JBR';
                          Navigator.push(context, MaterialPageRoute(builder: (context) => Ticketpreview(from: from, to: to, passenger: people, date: date, flightnum: flightKL_JB[1], price: totPrice[1], time : timeKL_JB[1],type: flighttype,username: username)));//signup screen

                          print("tapped 2");},
                      ),
                      const SizedBox(width: 8),
                      TextButton(
                        child:  Text('RM  ${totPrice[1]}', style: TextStyle(color: Colors.deepPurpleAccent),),
                        onPressed: () {/* ... */},
                      ),
                      const SizedBox(width: 8),

                    ],
                  ),

                  const Divider(
                    height: 20,
                    thickness: 1,
                    indent: 20,
                    endIndent: 20,
                    color: Colors.black38,
                  ),

                  //ticket 3 9.00 pm
                  ListTile(
                    leading: Icon(Icons.flight_takeoff_sharp, size: 50 ,color: Colors.deepPurpleAccent),
                    title: Text('Kuala Lumpur(KUL)' + ' > ' + 'Johor Bahru(JBR)'), //title: Text(from + ' to ' + to),
                    subtitle: Text('Flight : ${flightKL_JB[2]}\t\t            Time : ${timeKL_JB[2]}'),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      TextButton(
                        child: const Text('BOOK TICKETS', style: TextStyle(color: Colors.deepPurpleAccent),),
                        onPressed: () {
                          from = 'KUL';
                          to = 'JBR';
                          Navigator.push(context, MaterialPageRoute(builder: (context) => Ticketpreview(from: from, to: to, passenger: people, date: date, flightnum: flightKL_JB[2], price: totPrice[2], time : timeKL_JB[2],type: flighttype,username: username)));//signup screen

                          print("tapped 3");},
                      ),
                      const SizedBox(width: 8),
                      TextButton(
                        child:  Text('RM  ${totPrice[2]}', style: TextStyle(color: Colors.deepPurpleAccent),),
                        onPressed: () {/* ... */},
                      ),
                      const SizedBox(width: 8),

                    ],
                  ),

                ],

              ),

            );
          }
          else if(from == 'DropDownValueModel(Johor Bahru(JBR))' && to == 'DropDownValueModel(Kuala Lumpur(KUL))'){
            return Card(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,

                children: [
                  //ticket 1 6.45 AM
                  ListTile(
                    leading: Icon(Icons.flight_takeoff_sharp, size: 50 ,color: Colors.deepPurpleAccent),
                    title: Text('Johor Bahru(JBR)' + ' > ' + 'Kuala Lumpur(KUL)'), //title: Text(from + ' to ' + to),
                    subtitle: Text('Flight : ${flightKL_JB[0]} \t\t          Time : ${timeJB_KL[0]}'),
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      TextButton(
                        child: const Text('BOOK TICKETS', style: TextStyle(color: Colors.deepPurpleAccent),),
                        onPressed: () {
                          from = 'JBR';
                          to = 'KUL';
                          Navigator.push(context, MaterialPageRoute(builder: (context) => Ticketpreview(from: from, to: to, passenger: people, date: date, flightnum:flightKL_JB[0], price: totPrice[0], time : timeJB_KL[0],type: flighttype,username: username)));//signup screen

                          print("tapped 1");},
                      ),
                      const SizedBox(width: 8),
                      TextButton(
                        child:  Text('RM  ${totPrice[0]}', style: TextStyle(color: Colors.deepPurpleAccent),),
                        onPressed: () {/* ... */},
                      ),
                      const SizedBox(width: 8),

                    ],
                  ),

                  const Divider(
                    height: 20,
                    thickness: 1,
                    indent: 20,
                    endIndent: 20,
                    color: Colors.black38,
                  ),

                  //ticket 2 5.00 PM
                  ListTile(
                    leading: Icon(Icons.flight_takeoff_sharp, size: 50 ,color: Colors.deepPurpleAccent),
                    title: Text('Johor Bahru(JBR)' + ' > ' + 'Kuala Lumpur(KUL)'), //title: Text(from + ' to ' + to),
                    subtitle: Text('Flight : ${flightKL_JB[1]}\t\t            Time : ${timeJB_KL[1]}'),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      TextButton(
                        child: const Text('BOOK TICKETS', style: TextStyle(color: Colors.deepPurpleAccent),),
                        onPressed: () {
                          from = 'JBR';
                          to = 'KUL';
                          Navigator.push(context, MaterialPageRoute(builder: (context) => Ticketpreview(from: from, to: to, passenger: people, date: date, flightnum: flightKL_JB[1], price: totPrice[1], time : timeJB_KL[1],type: flighttype,username: username)));//signup screen

                          print("tapped 2");},
                      ),
                      const SizedBox(width: 8),
                      TextButton(
                        child:  Text('RM  ${totPrice[1]}', style: TextStyle(color: Colors.deepPurpleAccent),),
                        onPressed: () {/* ... */},
                      ),
                      const SizedBox(width: 8),

                    ],
                  ),

                  const Divider(
                    height: 20,
                    thickness: 1,
                    indent: 20,
                    endIndent: 20,
                    color: Colors.black38,
                  ),

                  //ticket 4 8.00 pm
                  ListTile(
                    leading: Icon(Icons.flight_takeoff_sharp, size: 50 ,color: Colors.deepPurpleAccent),
                    title: Text('Johor Bahru(JBR)' + ' > ' + 'Kuala Lumpur(KUL)'), //title: Text(from + ' to ' + to),
                    subtitle: Text('Flight : ${flightKL_JB[2]}\t\t            Time : ${timeJB_KL[2]}'),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      TextButton(
                        child: const Text('BOOK TICKETS', style: TextStyle(color: Colors.deepPurpleAccent),),
                        onPressed: () {
                          from = 'JBR';
                          to = 'KUL';
                          Navigator.push(context, MaterialPageRoute(builder: (context) => Ticketpreview(from: from, to: to, passenger: people, date: date, flightnum: flightKL_JB[2], price: totPrice[2], time : timeJB_KL[2],type: flighttype,username: username)));//signup screen

                          print("tapped 3");},
                      ),
                      const SizedBox(width: 8),
                      TextButton(
                        child:  Text('RM  ${totPrice[2]}', style: TextStyle(color: Colors.deepPurpleAccent),),
                        onPressed: () {/* ... */},
                      ),
                      const SizedBox(width: 8),

                    ],
                  ),

                  const Divider(
                    height: 20,
                    thickness: 1,
                    indent: 20,
                    endIndent: 20,
                    color: Colors.black38,
                  ),

                  //ticket 3 3.00 pm
                  ListTile(
                    leading: Icon(Icons.flight_takeoff_sharp, size: 50 ,color: Colors.deepPurpleAccent),
                    title: Text('Johor Bahru(JBR)' + ' > ' + 'Kuala Lumpur(KUL)'), //title: Text(from + ' to ' + to),
                    subtitle: Text('Flight : ${flightKL_JB[2]}\t\t            Time : ${timeJB_KL[3]}'),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      TextButton(
                        child: const Text('BOOK TICKETS', style: TextStyle(color: Colors.deepPurpleAccent),),
                        onPressed: () {
                          from = 'JBR';
                          to = 'KUL';
                          Navigator.push(context, MaterialPageRoute(builder: (context) => Ticketpreview(from: from, to: to, passenger: people, date: date, flightnum: flightKL_JB[2], price: totPrice[3], time : timeJB_KL[3],type: flighttype,username: username)));//signup screen

                          print("tapped 4");},
                      ),
                      const SizedBox(width: 8),
                      TextButton(
                        child:  Text('RM  ${totPrice[3]}', style: TextStyle(color: Colors.deepPurpleAccent),),
                        onPressed: () {/* ... */},
                      ),
                      const SizedBox(width: 8),

                    ],
                  ),

                ],

              ),

            );
          }
          else if(from == 'DropDownValueModel(Kota Bharu(KBR))' && to == 'DropDownValueModel(Johor Bahru(JBR))'){
            return Card(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,

                children: [
                  //ticket 1 6.45 AM
                  ListTile(
                    leading: Icon(Icons.flight_takeoff_sharp, size: 50 ,color: Colors.deepPurpleAccent),
                    title: Text('Kota Bharu(KBR)' + ' > ' + 'Johor Bahru(JBR)'), //title: Text(from + ' to ' + to),
                    subtitle: Text('Flight : ${flightKB_JB[0]} \t\t          Time : ${timeKB_JB[0]}'),
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      TextButton(
                        child: const Text('BOOK TICKETS', style: TextStyle(color: Colors.deepPurpleAccent),),
                        onPressed: () {
                          from = 'KBR';
                          to = 'JBR';
                          Navigator.push(context, MaterialPageRoute(builder: (context) => Ticketpreview(from: from, to: to, passenger: people, date: date, flightnum: flightKB_JB[0], price: totPrice[0], time : timeKB_JB[0],type: flighttype,username: username)));//signup screen

                          print("tapped 1");},
                      ),
                      const SizedBox(width: 8),
                      TextButton(
                        child:  Text('RM  ${totPrice[0]}', style: TextStyle(color: Colors.deepPurpleAccent),),
                        onPressed: () {/* ... */},
                      ),
                      const SizedBox(width: 8),

                    ],
                  ),

                  const Divider(
                    height: 20,
                    thickness: 1,
                    indent: 20,
                    endIndent: 20,
                    color: Colors.black38,
                  ),

                  //ticket 2 5.00 PM
                  ListTile(
                    leading: Icon(Icons.flight_takeoff_sharp, size: 50 ,color: Colors.deepPurpleAccent),
                    title: Text('Kota Bharu(KBR)' + ' > ' + 'Johor Bahru(JHB)'), //title: Text(from + ' to ' + to),
                    subtitle: Text('Flight : ${flightKB_JB[1]}\t\t            Time : ${timeKB_JB[1]} \n\n1 stop(2h 30m at Kuala Lumpur)'),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      TextButton(
                        child: const Text('BOOK TICKETS', style: TextStyle(color: Colors.deepPurpleAccent),),
                        onPressed: () {
                          from = 'KBR';
                          to = 'JBR';
                          Navigator.push(context, MaterialPageRoute(builder: (context) => Ticketpreview(from: from, to: to, passenger: people, date: date, flightnum: flightKB_JB[1], price: totPrice[4], time : timeKB_JB[1],type: flighttype,username: username)));//signup screen

                          print("tapped 2");},
                      ),
                      const SizedBox(width: 8),
                      TextButton(
                        child:  Text('RM  ${totPrice[4]}', style: TextStyle(color: Colors.deepPurpleAccent),),
                        onPressed: () {/* ... */},
                      ),
                      const SizedBox(width: 8),

                    ],
                  ),


                ],

              ),

            );
          }
          else{
            return Center(
              //child: Image.asset('assets/noflight.png'),

                child: Column(
                children: <Widget>[
                Image.asset('assets/noflight.png'),
                Text('No available flights at the moment', style: TextStyle(fontSize: 20.0),),
              ],

            ),
            );
          }

        },
      ),
    );

  }
}





