





import 'package:alert_dialog/alert_dialog.dart';
import 'package:flutter/material.dart';
import 'package:skyriderairlinesapp/booking_confirm.dart';
import 'package:skyriderairlinesapp/booking_data.dart';
import 'package:skyriderairlinesapp/database.dart';
import 'package:ticket_widget/ticket_widget.dart';

class MyBooking extends StatelessWidget {
  final String userName;

  MyBooking({required this.userName});

  var db = DbHelper();


  delete() async
  {
    var onebook;

    db.deleteBooking(onebook);

  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        //FutureBuilder<List<MyDataModel>>
      body: FutureBuilder<List<onewaybooking>>(
        future: db.getbookingdetails(userName),
        builder: (BuildContext context, AsyncSnapshot<List<onewaybooking>> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }
          else if (snapshot.hasData) {
            final List<onewaybooking> bookingList = snapshot.data!;
            return Center(
                child : ListView.builder(
                  itemCount: bookingList.length,
                  itemBuilder: (BuildContext context, int index) {
                    final onewaybooking booking = bookingList[index];
                    return TicketWidget(
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
                                  child: const Center(
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
                                      booking.depart,
                                      style: const TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold
                                      ),
                                    ),
                                    const Padding(
                                      padding: EdgeInsets.only(left: 8),
                                      child: Icon(
                                        Icons.flight_takeoff,
                                        color: Colors.pink,
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 8),
                                      child: Text(
                                        booking.arrival,
                                        style: const TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ],
                            ),

                            const Padding(
                              padding: EdgeInsets.only(top: 20),
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
                                    child: ticketDetailsWidget('Passengers', booking.passenger +' pax', 'Date', booking.date,),
                                  ),

                                  Padding(
                                    padding: const EdgeInsets.only(top: 12, right: 40),
                                    child: ticketDetailsWidget('Flight', booking.flightnum, 'Time', booking.time,),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 12, right: 47),
                                    child: ticketDetailsWidget('username', booking.user_name, 'Price', 'RM '+booking.price,),
                                  )
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(50, 20, 20, 0),
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
                              padding: const EdgeInsets.only(top: 10, left: 110),
                              child: Text(
                                //'9824 0972 1742 1298',
                                booking.booknum, textAlign: TextAlign.center,
                                style: const TextStyle(
                                    color: Colors.black
                                ),
                              ),
                            ),
                            const SizedBox(height: 0),
                            const Text('Please scan this barcode at the self check-in to claim your boarding pass', textAlign:TextAlign.center, ),
                            const SizedBox(height: 0),
                            const Divider(
                              height: 20,
                              thickness: 1,
                              indent: 10,
                              endIndent: 10,
                              color: Colors.black38,
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
            );

          } else {
            return const Center(child: Text('No Bookings'));
          }
        },
      ),
    );
  }
}
