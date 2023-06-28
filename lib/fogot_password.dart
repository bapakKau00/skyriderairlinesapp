import 'package:alert_dialog/alert_dialog.dart';
import 'package:flutter/material.dart';
import 'package:skyriderairlinesapp/database.dart';
import 'package:skyriderairlinesapp/usermodel.dart';

class ResetPasswordPage extends StatefulWidget {
  final String username;
  final String password;

  ResetPasswordPage({Key? key, required this.username,required this.password}) : super(key: key);

  @override
  _ResetPasswordPageState createState() => _ResetPasswordPageState();
}

class _ResetPasswordPageState extends State<ResetPasswordPage> {
  var dbHelper;
  TextEditingController newpw = TextEditingController();
  TextEditingController name = TextEditingController();
  TextEditingController c_newpw = TextEditingController();
  GlobalKey<FormState> _signupkey = GlobalKey<FormState>();


  @override
  void initState() {
    super.initState();
    dbHelper = DbHelper();
  }

  reset() async{
    String uname = name.text;
    String newpass = newpw.text;
    String c_newpass = c_newpw.text;

    if (_signupkey.currentState!.validate()) {
      if (newpass != c_newpass) {

        return alert(context, title: Text('Password Mismatch', textAlign: TextAlign.center), content: Text('Please check password'), textOK: Text('OK'),);

      }
      else if (newpass == widget.password && c_newpass == widget.password) {

        return alert(context, title: Text('Warning', textAlign: TextAlign.center), content: Text('Please use password that you never use before'), textOK: Text('OK'),);

      }
      else {
        _signupkey.currentState!.save();

        UserModel uModel = UserModel(uname,newpass);
        await dbHelper.updateUser(uModel).then((userData) {

          return alert(context, title: Text('Password Reset Success', textAlign: TextAlign.center), content: Text('New password been changed'), textOK: Text('OK'),);

        }).catchError((error) {
          print(error);

          return alert(context, title: Text('Error', textAlign: TextAlign.center), content: Text('Username already exist'), textOK: Text('OK'),);

        });
      }
    }

  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        elevation: 0,
        brightness: Brightness.light,
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back_ios, size: 20, color: Colors.black),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              child: Stack(
                children: <Widget>[
                  Container(
                    padding: const EdgeInsets.fromLTRB(15.0, 20.0, 0.0, 0.0),
                    child: const Text(
                      'Reset',
                      style: TextStyle(
                        fontSize: 60.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.fromLTRB(16.0, 75.0, 0.0, 0.0),
                    child: const Text(
                      'Password',
                      style: TextStyle(
                        fontSize: 60.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.fromLTRB(285.0, 75.0, 0.0, 0.0),
                    child: const Text(
                      '?',
                      style: TextStyle(
                        fontSize: 60.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.deepPurpleAccent,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.only(top: 35.0, left: 20.0, right: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  const Text(
                    'Enter the username associated with your account.',
                    style: TextStyle(
                      fontSize: 25.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.blueGrey,
                    ),
                  ),
                  const SizedBox(height: 10.0),
                   Form(
                     key: _signupkey,
                     child: Column(
                       children: [
                         TextFormField(
                           controller: name,
                           decoration: const InputDecoration(
                             labelText: 'Username',
                             labelStyle: TextStyle(
                               fontWeight: FontWeight.bold,
                               color: Colors.grey,
                             ),
                             focusedBorder: UnderlineInputBorder(
                               borderSide: BorderSide(color: Colors.red),
                             ),
                           ),
                           validator: (value) {
                             if (value!.isEmpty) {
                               return 'Please enter a username';
                             }
                             return null;
                           },


                         ),
                         const SizedBox(height: 20.0),
                         TextFormField(
                           controller: newpw,
                           decoration: const InputDecoration(
                             labelText: 'New Password',
                             labelStyle: TextStyle(
                               fontWeight: FontWeight.bold,
                               color: Colors.grey,
                             ),
                             focusedBorder: UnderlineInputBorder(
                               borderSide: BorderSide(color: Colors.red),
                             ),
                           ),
                           validator: (value) {
                             if (value!.isEmpty) {
                               return 'Please enter a new password';
                             }
                             return null;
                           },

                         ),
                         TextFormField(
                           controller: c_newpw,
                           decoration: const InputDecoration(
                             labelText: 'Confirm New Password',
                             labelStyle: TextStyle(
                               fontWeight: FontWeight.bold,
                               color: Colors.grey,
                             ),
                             focusedBorder: UnderlineInputBorder(
                               borderSide: BorderSide(color: Colors.red),
                             ),
                           ),
                           validator: (value) {
                             if (value!.isEmpty) {
                               return 'Please enter a confirm password';
                             }
                             return null;
                           },


                         ),
                       ],
                     ),
                   ),
                  const SizedBox(height: 40.0),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: reset,
                      style: ElevatedButton.styleFrom(
                        primary: Colors.deepPurpleAccent,
                        padding: const EdgeInsets.all(15.0),
                      ),
                      child: const Text('RESET PASSWORD'),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 15.0),
          ],
        ),
      ),
    );
  }
}
