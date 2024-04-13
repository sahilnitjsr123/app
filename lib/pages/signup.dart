import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:food_delivery_app/pages/bottomnav.dart';
import 'package:food_delivery_app/pages/login.dart';
import '../widget/widget_support.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  String email="", password="", name="";
  TextEditingController namecontroller= new TextEditingController();

  TextEditingController passwordcontroller= new TextEditingController();

  TextEditingController mailcontroller= new TextEditingController();

  final _formkey= GlobalKey<FormState>();

  registration() async {
    if(password != null){
      try {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              "Registration",
              style: TextStyle(fontSize: 20.0),
            ),
          ),
        );
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>BottomNav()));
      } catch (e) {
        print("Error: $e");
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Stack(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height / 2.5,
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        Color(0xFFff5c30),
                        Color(0xFFe74b1a),
                      ])),
            ),
            Container(
              margin:
              EdgeInsets.only(top: MediaQuery.of(context).size.height / 3),
              height: MediaQuery.of(context).size.height / 2,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(40),
                      topRight: Radius.circular(40))),
              child: Text(""),
            ),
            Container(
              margin: EdgeInsets.only(top: 60.0, left: 20.0, right: 20.0),
              child: Column(
                children: [
                  Center(
                      child: Image.asset(
                        "images/logo.png",
                        width: MediaQuery.of(context).size.width / 1.5,
                        fit: BoxFit.cover,
                      )),
                  SizedBox(height: 50.0,),
                  GestureDetector(
                    onTap: () async {
                      if (_formkey.currentState!.validate()) {
                        setState(() {
                          email = mailcontroller.text;
                          name = namecontroller.text;
                          password = passwordcontroller.text;
                        });
                        registration();
                      }
                    },
                    child: Material(
                      elevation: 5.0,
                      borderRadius: BorderRadius.circular(20),
                      child: Container(
                          padding: EdgeInsets.only(left: 20.0, right: 20.0),
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height/1.5,
                          decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(20)),
                          child: Form(
                            key: _formkey,
                            child: Column(children: [
                              SizedBox(height: 30.0,),
                              Text("Sign up", style: AppWidget.HeadlineTextFieldStyle(),),
                              SizedBox(height: 30.0,),
                              TextFormField(
                                controller: namecontroller,
                                validator: (value){
                                  if(value==null|| value.isEmpty){
                                    return 'Please Enter Name';
                                  }
                                  return null;
                                },
                                decoration: InputDecoration(
                                    hintText: 'Name',
                                    hintStyle: AppWidget.boldTextFieldStyle(),
                                    prefixIcon: Icon(Icons.person_outlined)
                                ),
                              ),
                              SizedBox(height: 30.0,),
                              TextFormField(
                                controller: mailcontroller,
                                validator: (value){
                                  if(value==null|| value.isEmpty){
                                    return 'Please Enter E-mail';
                                  }
                                  return null;
                                },
                                decoration: InputDecoration(
                                    hintText: 'Email',
                                    hintStyle: AppWidget.boldTextFieldStyle(),
                                    prefixIcon: Icon(Icons.email_outlined)
                                ),
                              ),
                              SizedBox(
                                height: 30.0,
                              ),
                              TextFormField(
                                controller: passwordcontroller,
                                validator: (value){
                                  if(value==null|| value.isEmpty){
                                    return 'Please Enter Password';
                                  }
                                  return null;
                                },
                                obscureText: true,
                                decoration: InputDecoration(
                                    hintText: 'Password',
                                    hintStyle: AppWidget.boldTextFieldStyle(),
                                    prefixIcon: Icon(Icons.password_outlined)
                                ),
                              ),

                              SizedBox(height: 60.0,),
                              Material(
                                elevation: 5.0,
                                borderRadius: BorderRadius.circular(20),
                                child: Container(
                                  padding: EdgeInsets.symmetric(vertical: 8.0),
                                  width: 200,
                                  decoration: BoxDecoration(color: Color(0xffff5722), borderRadius: BorderRadius.circular(20)),
                                  child: Center(child: Text("SIGNUP", style: TextStyle(color: Colors.white, fontSize: 18.0,fontWeight: FontWeight.bold ))),
                                ),
                              )
                            ],),
                          )
                      ),
                    ),
                  ),
                  SizedBox(height: 70.0,),
                  GestureDetector(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>LogIn()));
                      },
                      child: Text("Already have an account? Login", style: AppWidget.boldTextFieldStyle(),))

                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}


