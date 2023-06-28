import 'package:flutter/material.dart';
import 'package:overlay_support/overlay_support.dart';
import 'package:skyriderairlinesapp/fogot_password.dart';
import 'package:skyriderairlinesapp/homepage.dart';
//import 'package:dropdown_textfield/dropdown_textfield.dart';
import 'package:skyriderairlinesapp/signup.dart';
import 'package:skyriderairlinesapp/database.dart';
import 'package:skyriderairlinesapp/usermodel.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:alert_dialog/alert_dialog.dart';




void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OverlaySupport(
      child : const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          backgroundColor: Colors.white30,

          body: MyStatefulWidget(),
        ),
      ),
    );
  }
}

class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({Key? key}) : super(key: key);

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  final Future<SharedPreferences> _pref = SharedPreferences.getInstance();
  var dbHelper;
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();



  @override
  void initState() {
    super.initState();
    dbHelper = DbHelper();
  }

  login() async {
    String username = nameController.text;
    String passwd = passwordController.text;

    if (username.isEmpty) {

      return alert(context, title: Text('Username Empty', textAlign: TextAlign.center), content: Text('Please Enter Username'), textOK: Text('OK'),);



    } else if (passwd.isEmpty) {

      return alert(context, title: Text('Password Empty', textAlign: TextAlign.center), content: Text('Please Enter Password'), textOK: Text('OK'),);





    } else {
      await dbHelper.getLoginUser(username, passwd).then((userData) {
        if (userData != null) {

          setSP(userData).whenComplete(() {
            Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (_) => HomePage(username: username)), (Route<dynamic> route) => false);


          });
          //return alert(context, title: Text('Login Successfull', textAlign: TextAlign.center), content: Text('Welcome To Skyrider Airlines'), textOK: Text('OK'),);
        } else {

          return alert(context, title: Text('Error', textAlign: TextAlign.center), content: Text('User Not Found. Please Create an Account'), textOK: Text('OK'),);


        }
      }).catchError((error) {
        print(error);

        return alert(context, title: Text('Error',textAlign: TextAlign.center), content: Text('Login Fail'), textOK: Text('OK'),);

      });
    }
  }

  Future setSP(UserModel user) async {
    final SharedPreferences sp = await _pref;

    sp.setString("user_name", user.user_name);
    sp.setString("password", user.password);
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                colors: [
                  Colors.deepPurpleAccent,
                  Colors.blue,
                  Colors.green,
                ]
            )
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            const SizedBox(height: 80,),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: const <Widget>[
                  Text("Skyrider Airlines", style: TextStyle(color: Colors.white, fontSize: 40),),
                  SizedBox(height: 10,),
                  Text("Sign in", style: TextStyle(color: Colors.white, fontSize: 18),),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: Container(
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(topLeft: Radius.circular(60), topRight: Radius.circular(60))
                ),
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(30),
                    child: Column(
                      children: <Widget>[
                        const SizedBox(height: 60,),
                        Container(
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: const [BoxShadow(
                                  color: Colors.white,
                                  blurRadius: 20,
                                  offset: Offset(0, 10)
                              )]
                          ),
                          child: Column(
                            children: <Widget>[
                              Container(
                                padding: const EdgeInsets.all(10),
                                child: TextField(
                                  controller: nameController,
                                  decoration: const InputDecoration(
                                    //border: OutlineInputBorder(),
                                    labelText: 'User Name',
                                  ),
                                ),
                              ),
                              Container(
                                padding: const EdgeInsets.all(10),
                                child: TextField(
                                  controller: passwordController,
                                  obscureText: true,
                                  decoration: const InputDecoration(
                                    //border: OutlineInputBorder(),
                                    labelText: 'Password',
                                  ),
                                ),
                              ),
                              TextButton(
                                onPressed: () {
                                  Navigator.push(context, MaterialPageRoute(builder: (context) => ResetPasswordPage(username: nameController.text, password: passwordController.text,)));//signup screen

                                },
                                child: const Text("Forgot Password", style: TextStyle(color: Colors.deepPurpleAccent, fontSize: 18),),
                                //child: const Text('Forgot Password',),
                              ),
                              SizedBox(height: 20,),
                              Container(
                                height: 50,
                                //padding: const EdgeInsets.all(10),
                                child: FloatingActionButton.extended(
                                  backgroundColor: Colors.deepPurpleAccent,
                                  extendedPadding: const EdgeInsets.all(150),
                                  onPressed: login,
                                  label: const Text("Sign in"),
                                ),
                              ),

                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  const Text('Does not have an account?'),
                                  TextButton(
                                    child: const Text("Sign up", style: TextStyle(color: Colors.deepPurpleAccent, fontSize:25),),
                                    onPressed: () {
                                      Navigator.push(context, MaterialPageRoute(builder: (context) => SignupPage()));//signup screen
                                    },
                                  )
                                ],
                              ),
                            ],
                          ),


                        ),





                      ],
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

