import 'package:flutter/material.dart';
import 'package:overlay_support/overlay_support.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:alert_dialog/alert_dialog.dart';
import 'package:skyriderairlinesapp/booking_data.dart';
import 'package:skyriderairlinesapp/database.dart';
import 'package:skyriderairlinesapp/success_payment.dart';



class PaymentPage extends StatefulWidget {

  String username,name,id,phone,email;
  String from;
  String to;
  String date;
  String type;
  String flightnum;
  int passenger;
  int price;
  String time;
  String booknum;

  PaymentPage({Key? key, required this.from,required this.to,required this.passenger,required this.date,required this.flightnum,
    required this.price, required this.time, required this.booknum, required this.username,required this.type,
    required this.name,required this.id,required this.phone,required this.email}) : super(key: key);



  @override
  _PaymentPageState createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  GlobalKey<FormState> _paykey = GlobalKey<FormState>();
  //final Future<SharedPreferences> _pref = SharedPreferences.getInstance();
  var dbHelper;

  String cardNumber = '';
  String expiryDate = '';
  String cvv = '';




@override
  void initState() {
    super.initState();
    dbHelper = DbHelper();

    //flutter notifications setting

  }



  push() async{
    String username = widget.username;
    int passenger = widget.passenger;
    String from = widget.from;
    String to = widget.to;
    String date = widget.date;
    String time = widget.time;
    String type = widget.type;
    int price = widget.price;
    String flightnum = widget.flightnum;
    String booknum = widget.booknum;
    String name = widget.name;
    String id = widget.id;
     String phone = widget.phone;
     String email = widget.email;

    String pax = passenger.toString();
    String ticketPrice = price.toString();


    if(_paykey.currentState!.validate())
      {

        onewaybooking satujalan = onewaybooking(username,pax,from,to,date,time,type,ticketPrice,flightnum,booknum,name,id,phone,email);
        await dbHelper.savebooking(satujalan).then((onebook) {
          Navigator.push(context, MaterialPageRoute(builder: (context) => ThankYouPage(title: '', username: username,)));//signup screen
          showOverlayNotification((context) {
            return Card(
              margin: const EdgeInsets.symmetric(horizontal: 4),
              child: SafeArea(
                child: ListTile(
                  leading: SizedBox.fromSize(
                      size: const Size(50, 50),
                      child: ClipOval(
                          child: Container(
                            color: Colors.deepPurpleAccent,
                            child: const Icon(Icons.done_all_rounded, size: 30, color: Colors.white,),

                          ))),
                  title: Text('Hi $username, new flight from $from to $to has successfully booked',),
                  subtitle: const Text('Checkout My Bookings fields to check your booked.'),
                  trailing: IconButton(
                      icon: const Icon(Icons.close),
                      onPressed: () {
                        OverlaySupportEntry.of(context)!.dismiss();
                      }),
                ),
              ),
            );
          }, duration: const Duration(milliseconds: 10000));
          //return alert(context, title: Text('Payment Success', textAlign: TextAlign.center), content: Text('Successfully Saved'), textOK: Text('OK'),);




        }).catchError((error) {
          print(error);

          return alert(context, title: const Text('Error', textAlign: TextAlign.center), content: const Text('Booking failed'), textOK: const Text('OK'),);

        });
      }


  }



  void processPayment() {
    // Simulate payment processing
    // Add your payment processing logic here
    print('Processing payment...');
    print('Card Number: $cardNumber');
    print('Expiry Date: $expiryDate');
    print('CVV: $cvv');
    print('Payment processed successfully!');
  }

  @override
  Widget build(BuildContext context) {

    final int harga = widget.price;
    final String booking = widget.booknum;


    return Scaffold(
        appBar: PreferredSize( //wrap with PreferredSize
            preferredSize: const Size.fromHeight(80), //height of appbar
            child: AppBar(
              centerTitle: true,
              title:const Text('\nPayment Process'), //appbar title
              backgroundColor: Colors.deepPurpleAccent, //appbar background color,
            )

        ),
      body : Form(
        key: _paykey,
        child : Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Payment Amount: RM $harga \nBooking Number : $booking',
                style: const TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16.0),
              TextField(
                decoration: const InputDecoration(
                  labelText: 'Card Number',
                ),
                onChanged: (value) {
                  setState(() {
                    cardNumber = value;
                  });
                },
              ),
              const SizedBox(height: 8.0),
              Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: TextField(
                      decoration: const InputDecoration(
                        labelText: 'Expiry Date',
                      ),
                      onChanged: (value) {
                        setState(() {
                          expiryDate = value;
                        });
                      },
                    ),
                  ),
                  const SizedBox(width: 8.0),
                  Expanded(
                    flex: 1,
                    child: TextField(
                      decoration: const InputDecoration(
                        labelText: 'CVV',
                      ),
                      onChanged: (value) {
                        setState(() {
                          cvv = value;
                        });
                      },
                    ),
                  ),
                ],

              ),
              const SizedBox(height: 16.0),
            ],

          ),

        ),

      ),
      floatingActionButton: FloatingActionButton.extended(
      backgroundColor: Colors.deepPurpleAccent,
      extendedPadding: const EdgeInsets.all(165),
      onPressed: push,
      label: const Text("Pay"),
    ),
    );

  }
}


