class onewaybooking {

  String user_name = '';
  String passenger = '';
  String depart= '' ;
  String arrival= '';
  String type = '';
  String price = '';
  String date ='';
  String time = '';
  String flightnum= '';
  String booknum= '';
  String cname= '';
  String cid= '';
  String cphone = '';
  String cemail= '';



  onewaybooking(this.user_name, this.passenger, this.depart, this.arrival, this.date, this.time, this.type, this.price,this.flightnum, this.booknum,
      this.cname, this.cid, this.cphone, this.cemail,);

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{

      'user_name': user_name,
      'passenger': passenger,
      'depart': depart,
      'arrival': arrival,
      'date': date,
      'time': time,
      'trip_type' : type,
      'price' : price,
      'flight_num': flightnum,
      'booking_num ': booknum,
      'contact_name' : cname,
      'contact_id' : cid,
      'contact_phone' : cphone,
     'contact_email' : cemail,
    };
    return map;
  }

  onewaybooking.fromMap(Map<String, dynamic> map) {

    user_name = map['user_name'];
    passenger = map['passenger'];
    depart = map['depart'];
    arrival = map['arrival'];
    date = map['date'];
    time = map['time'];
    type = map['trip_type'];
    price = map['price'];
    flightnum = map['flight_num'];
    booknum = map['booking_num'];
    cname = map['contact_name'];
    cid = map['contact_id'];
    cphone = map['contact_phone'];
    cemail = map['contact_email'];


  }
}
