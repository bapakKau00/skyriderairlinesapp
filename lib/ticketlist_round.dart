// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
/// Flutter code sample for [Card].

class TicketList_Round extends StatelessWidget {
  String from,to,date,returnDate;
  var passenger;

  TicketList_Round({Key? key,required this.from,required this.to,required this.passenger,required this.date,required this.returnDate}) : super(key: key);


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
                        onPressed: () {print("tapped 1");},
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
                        onPressed: () {print("tapped 2");},
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
                        onPressed: () {print("tapped 3");},
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
                        onPressed: () {print("tapped 4");},
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
                        onPressed: () {print("tapped 1");},
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
                    subtitle: Text('Flight : ${flightnum[1]}\t\t            Time : ${timeKB_KL[1]}'),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      TextButton(
                        child: const Text('BOOK TICKETS', style: TextStyle(color: Colors.deepPurpleAccent),),
                        onPressed: () {print("tapped 2");},
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
                    subtitle: Text('Flight :${flightnum[0]} \t\t           Time : ${timeKB_KL[2]}'),

                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      TextButton(
                        child: const Text('BOOK TICKETS', style: TextStyle(color: Colors.deepPurpleAccent),),
                        onPressed: () {print("tapped 3");},
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
                        onPressed: () {print("tapped 1");},
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
                        onPressed: () {print("tapped 2");},
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
                        onPressed: () {print("tapped 1");},
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
                        onPressed: () {print("tapped 2");},
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
                        onPressed: () {print("tapped 1");},
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
                        onPressed: () {print("tapped 2");},
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
                        onPressed: () {print("tapped 2");},
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
                        onPressed: () {print("tapped 1");},
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
                        onPressed: () {print("tapped 2");},
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
                        onPressed: () {print("tapped 2");},
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
                        onPressed: () {print("tapped 1");},
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
                        onPressed: () {print("tapped 2");},
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
                        onPressed: () {print("tapped 2");},
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
                        onPressed: () {print("tapped 1");},
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
                        onPressed: () {print("tapped 2");},
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
                    subtitle: Text('Flight : ${flightKL_JB[3]}\t\t            Time : ${timeJB_KL[3]}'),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      TextButton(
                        child: const Text('BOOK TICKETS', style: TextStyle(color: Colors.deepPurpleAccent),),
                        onPressed: () {print("tapped 2");},
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
                        onPressed: () {print("tapped 2");},
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
                        onPressed: () {print("tapped 1");},
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
                        onPressed: () {print("tapped 2");},
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





