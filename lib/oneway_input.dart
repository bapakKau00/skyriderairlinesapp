import 'package:flutter/material.dart';
import 'package:dropdown_textfield/dropdown_textfield.dart';
import 'package:intl/intl.dart';
import 'package:overlay_support/overlay_support.dart';
import 'package:skyriderairlinesapp/ticket_page.dart';


class OneWayInput extends StatefulWidget {
  String username;

  OneWayInput({Key? key, required this.username,}) : super(key: key);

  //const OneWayInput({Key? key}) : super(key: key);



  @override
  State<OneWayInput> createState() => _TestPageState();
}

class _TestPageState extends State<OneWayInput> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  FocusNode searchFocusNode = FocusNode();
  FocusNode textFieldFocusNode = FocusNode();
  late SingleValueDropDownController _cnt;
  late MultiValueDropDownController _cntMulti;
  TextEditingController dateInput = TextEditingController();
  TextEditingController _passenger = TextEditingController();

  String _selectedval = 'xxx';
  String _selectedvalTo = 'xxxx';
  int? passenger;




  @override
  void initState() {
    _cnt = SingleValueDropDownController();
    _cntMulti = MultiValueDropDownController();
    super.initState();
  }

  @override
  void dispose() {
    _cnt.dispose();
    _cntMulti.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    String username = widget.username;
    return Scaffold(
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.all(54.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  "From",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),

                const SizedBox(
                  height: 20,
                ),
                DropDownTextField(

                  clearOption: false,
                  textFieldFocusNode: textFieldFocusNode,
                  searchFocusNode: searchFocusNode,
                  dropDownItemCount: 4,
                  searchShowCursor: false,
                  enableSearch: true,
                  searchKeyboardType: TextInputType.number,
                  dropDownList: const [

                    DropDownValueModel(name: 'Kuala Lumpur(KUL)', value: "Kuala Lumpur International Airport (KLIA)"),
                    DropDownValueModel(name: 'Penang(PEN)', value: "Penang(PEN)"),
                    DropDownValueModel(name: 'Johor Bahru(JBR)', value: "Johor Bahru(JBR)"),
                    //DropDownValueModel(name: 'Alor Star(AOR)', value: "Alor Star(AOR)"),
                    DropDownValueModel(name: 'Kota Bharu(KBR)', value: "Kota Bharu(KBR)"),
                    DropDownValueModel(name: 'Kota Kinabalu(KBI)', value: "Kota Kinabalu(KBI)"),
                    DropDownValueModel(name: 'Kuala Terengganu(TGG)', value: "Kuala Terengganu(TGG)"),
                    //DropDownValueModel(name: 'Kuantan(KUA)', value: "Kuantan(KUA)"),
                    //DropDownValueModel(name: 'Labuan(LBU)', value: "Labuan(LBU)"),
                    DropDownValueModel(name: 'Langkawi(LGK)', value: "Langkawi(LGK)"),
                  ],


                  onChanged: (value) {
                    setState(() {
                      _selectedval = value.toString();
                    });
                  },
                ),


                const SizedBox(
                  height: 10,
                ),
                const Text(
                  "To",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 10,
                ),
                DropDownTextField(
                  // initialValue: "name4",
                  //controller: _to,

                  listSpace: 20,
                  listPadding: ListPadding(bottom: 10),
                  enableSearch: true,
                  validator: (value) {
                    if (value == null) {
                      return "Required field";
                    } else {
                      return null;
                    }
                  },
                  dropDownList: const [
                    //DropDownValueModel(name: 'Subang(SZB)', value: "Subang(SZB)"),
                    DropDownValueModel(name: 'Kuala Lumpur(KUL)', value: "Kuala Lumpur International Airport (KLIA)"),
                    DropDownValueModel(name: 'Penang(PEN)', value: "Penang(PEN)"),
                    DropDownValueModel(name: 'Johor Bahru(JBR)', value: "Johor Bahru(JBR)"),
                    //DropDownValueModel(name: 'Alor Star(AOR)', value: "Alor Star(AOR)"),
                    DropDownValueModel(name: 'Kota Bharu(KBR)', value: "Kota Bharu(KBR)"),
                    DropDownValueModel(name: 'Kota Kinabalu(KBI)', value: "Kota Kinabalu(KBI)"),
                    //DropDownValueModel(name: 'Sandakan(SDK)', value: "Sandakan(SDK)"),
                    //DropDownValueModel(name: 'Sibu(SBW)', value: "Sibu(SBW)"),
                    DropDownValueModel(name: 'Kuala Terengganu(TGG)', value: "Kuala Terengganu(TGG)"),
                    DropDownValueModel(name: 'Kuantan(KUA)', value: "Kuantan(KUA)"),
                    //DropDownValueModel(name: 'Labuan(LBU)', value: "Labuan(LBU)"),
                    DropDownValueModel(name: 'Langkawi(LGK)', value: "Langkawi(LGK)"),
                  ],
                  //listTextStyle: const TextStyle(color: Colors.red),
                  dropDownItemCount: 4,

                  //TODO : OUPUT SELECTED VALUE
                  onChanged: (value) => setState(() {
                    _selectedvalTo = value.toString();
                    //widget.itemCallBack(currentItem);
                  }),
                ),
                const SizedBox(
                  height: 50,
                ),

                Padding(
                  padding: const EdgeInsets.fromLTRB(0.0, 0.0, 64.0, 8.0),
                  child: TextFormField(
                    controller: _passenger,  //INPUT DATA TO OF HOW MANY PASSENGER
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      icon: Icon(Icons.person, color: Colors.red),
                      labelText: "Passengers",
                    ),
                  ),
                ),





                Row(
                  children: <Widget>[

                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(0.0, 0.0, 64.0, 8.0),
                        child: TextField(
                          controller: dateInput,    //INPUT DATA TO OF SELECTED DATE
                          //editing controller of this TextField
                          decoration: const InputDecoration(

                              icon: Icon(Icons.date_range,color: Colors.red), //icon of text field
                              labelText: "Departure" //label text of field
                          ),
                          readOnly: true,
                          //set it true, so that user will not able to edit text
                          onTap: () async {
                            DateTime? pickedDate = await showDatePicker(
                                context: context,
                                initialDate: DateTime.now(),
                                firstDate: DateTime(1950),
                                //DateTime.now() - not to allow to choose before today.
                                lastDate: DateTime(2100));

                            if (pickedDate != null) {
                              print(
                                  pickedDate); //pickedDate output format => 2021-03-10 00:00:00.000
                              String formattedDate =
                              DateFormat('dd-MM-yyyy').format(pickedDate);
                              print(
                                  formattedDate); //formatted date output using intl package =>  2021-03-16
                              setState(() {
                                dateInput.text =
                                    formattedDate; //set output date to TextField value.
                              });
                            } else {}
                          },
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
        backgroundColor: Colors.deepPurpleAccent,
        extendedPadding: const EdgeInsets.all(150),
        onPressed: () {
          //ticket list
          Navigator.push(context, MaterialPageRoute(builder: (context) => TicketList(from:_selectedval, to: _selectedvalTo, passenger: _passenger.text, date: dateInput.text, username: username,)));//signup screen
          setState(() {});
        },
        label: const Text("Search"),
      ),
    );
  }
}




