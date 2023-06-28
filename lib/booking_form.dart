import 'package:flutter/material.dart';
import 'package:skyriderairlinesapp/booking_confirm.dart';
import 'package:skyriderairlinesapp/payment.dart';



class booking_form extends StatefulWidget {

  String username;
  String type;
  String from;
  String to;
  String date;
  String flightnum;
  var passenger;
  int price;
  String time;
  String booknum;
  booking_form({Key? key, required this.from,required this.to,required this.passenger,required this.date,required this.flightnum,
    required this.price, required this.time, required this.booknum,required this.username,required this.type}) : super(key: key);



  @override
  State<booking_form> createState() => _TestPageState();
}

class _TestPageState extends State<booking_form> {


  final GlobalKey<FormState> _bookform = GlobalKey<FormState>();


  TextEditingController dateInput = TextEditingController();
  TextEditingController _phoneNo = TextEditingController();
  TextEditingController _ic = TextEditingController();
  TextEditingController _name = TextEditingController();
  TextEditingController _age = TextEditingController();
  TextEditingController _email = TextEditingController();


  String _selectedval = 'xxx';
  String _selectedvalTo = 'xxxx';



  @override
  Widget build(BuildContext context) {

    final String username = widget.username;
    final String arrival = widget.to;
    final String depart = widget.from;
    final int price = widget.price;
    final String date = widget.date;
    final String flightnum = widget.flightnum;
    final  int passenger = widget.passenger;
    final String time = widget.time;
    final String booknum = widget.booknum;
    final String type = widget.type;


    //var human = int.parse(passenger);




    return Scaffold(
      appBar: PreferredSize( //wrap with PreferredSize
          preferredSize: const Size.fromHeight(80), //height of appbar
          child: AppBar(
            centerTitle: true,
            title:const Text('\nContact Details'), //appbar title
            backgroundColor: Colors.deepPurpleAccent, //appbar background color,
          )

      ),

      body: SingleChildScrollView(
        child: Form(
          key: _bookform,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //Spacer(),


                const SizedBox(
                  height: 50,
                ),

                Padding(
                  padding: const EdgeInsets.fromLTRB(0.0, 0.0, 64.0, 20.0),
                  child: TextFormField(
                    controller: _name,  //INPUT DATA of phone num

                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      icon: Icon(Icons.person, color: Colors.red),
                      labelText: "Full Name",
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0.0, 0.0, 64.0, 20.0),
                  child: TextFormField(
                    controller: _ic,  //INPUT DATA of phone num

                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      icon: Icon(Icons.card_membership, color: Colors.red),
                      labelText: "IC No",
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0.0, 0.0, 64.0, 20.0),
                  child: TextFormField(
                    controller: _phoneNo,  //INPUT DATA of phone num

                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      icon: Icon(Icons.phone, color: Colors.red),
                      labelText: "Phone No",
                    ),
                  ),
                ),

                Row(
                  children: <Widget>[

                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(right: 16.0),
                        child: TextField(
                          controller: _age,    //INPUT DATA TO OF SELECTED DATE
                          //editing controller of this TextField
                          decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              //icon: Icon(Icons.,color: Colors.red), //icon of text field
                              labelText: "Age" //label text of field
                          ),

                        ),
                      ),
                    ),

                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 16.0),
                        child: TextFormField(
                          controller: _email,
                          decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: "email"),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),



      floatingActionButton: FloatingActionButton.extended(
        extendedPadding: const EdgeInsets.all(150),
        backgroundColor: Colors.deepPurpleAccent,
        onPressed: () {
          //TODO : push database
          Navigator.push(context, MaterialPageRoute(builder: (context) => PaymentPage(from: depart,to: arrival
            ,date:date, flightnum:flightnum, passenger:passenger, price:price, time:time, booknum
            :booknum, username: username, type: type, name : _name.text, phone: _phoneNo.text, id : _ic.text, email : _email.text)));//signup screen
          print(depart);
          //TODO : GOROUTER
          print(price);

          setState(() {});
        },
        label: const Text("Submit"),
      ),
    );
  }
}




