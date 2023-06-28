import 'package:flutter/material.dart';
import 'package:skyriderairlinesapp/database.dart';
import 'package:skyriderairlinesapp/usermodel.dart';
import 'package:skyriderairlinesapp/main.dart';
import 'package:alert_dialog/alert_dialog.dart';





class SignupPage extends StatefulWidget {
  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {


  bool get isValidEmail {
    final emailRegExp = RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
    return emailRegExp.hasMatch(this as String);
  }



  TextEditingController _usernameController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _cpasswordController = TextEditingController();
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  var dbHelper;

  @override
  void initState() {
    super.initState();
    dbHelper = DbHelper();
  }


  //signup session
  signUp() async {
    String username = _usernameController.text;
    String passwd = _passwordController.text;
    String cpasswd = _cpasswordController.text;

    if (_formKey.currentState!.validate()) {
      if (passwd != cpasswd) {

        return alert(context, title: Text('Password Mismatch', textAlign: TextAlign.center), content: Text('Please check password'), textOK: Text('OK'),);

      } else {
        _formKey.currentState!.save();

        UserModel uModel = UserModel(username,passwd);
        await dbHelper.saveData(uModel).then((userData) {

          return alert(context, title: Text('Create Account Success', textAlign: TextAlign.center), content: Text('Successfully Saved'), textOK: Text('OK'),);

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

      appBar: AppBar(
        elevation: 0,
        brightness: Brightness.light,
        backgroundColor: Colors.white,
        leading:
        IconButton( onPressed: (){
          Navigator.pop(context);
        },icon:const Icon(Icons.arrow_back_ios,size: 20,color: Colors.black,)),
      ),

      body: Padding(
        padding: EdgeInsets.all(16.0),
        child : SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [

                const Text ("Sign up", style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),),
                const SizedBox(height: 20,),
                Text("Create an Account,Its free",style: TextStyle(
                  fontSize: 15,
                  color: Colors.grey[700],
                ),),
                const SizedBox(height: 30,),

                TextFormField(
                  controller: _usernameController,
                  decoration: InputDecoration(labelText: 'Username'),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter a username';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 16.0),
                TextFormField(
                  controller: _passwordController,
                  decoration: InputDecoration(labelText: 'Password'),
                  obscureText: true,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter a password';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 16.0),
                TextFormField(
                  controller: _cpasswordController,
                  decoration: InputDecoration(labelText: 'Confirm Password'),
                  obscureText: true,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter a password';
                    }
                    return null;
                  },
                ),


                SizedBox(height: 16.0),
                ElevatedButton(
                  onPressed: signUp,
                  style: ElevatedButton.styleFrom(
                      primary: Colors.deepPurpleAccent// Background color
                  ),
                  child: Text('Signup'),
                ),

                const SizedBox(height: 20,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children:  [
                    Text("Already have an account? "),
                    TextButton(
                      child: const Text(
                        'Log In',
                        style: TextStyle(fontSize: 20, color: Colors.deepPurpleAccent),
                      ),
                      onPressed: () {Navigator.pop(context);},
                    )
                  ],
                )

              ],
            ),
          ),

        ),

      ),
    );
  }
}
