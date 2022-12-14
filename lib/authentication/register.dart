import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:tick2do/utils.dart';

import '../main.dart';

class SignUpWidget extends StatefulWidget {
 final Function() onClickSignIn;
 const SignUpWidget({
   Key? key,
   required this.onClickSignIn,
}) : super(key: key);

  @override
  _SignUpWidgetState createState() => _SignUpWidgetState();


}

class _SignUpWidgetState extends State<SignUpWidget> {
  final formKey=GlobalKey<FormState>();
  final emailController= TextEditingController();
  final passwordController=TextEditingController();

  void dispose(){
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => SingleChildScrollView(
    padding: EdgeInsets.all(30),
    child: Center(child:
        Form(
          key: formKey,
          child:
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 170,),
              Center(child:Text('Hey there, \n Welcome To Tick2Do', textAlign: TextAlign.center, style: TextStyle(
                fontSize: 30, color: Colors.cyan,),) ,) ,
              SizedBox(height: 40),
              TextFormField(
                controller: emailController,
                cursorColor: Colors.white,
                textInputAction: TextInputAction.next,
                decoration: InputDecoration(
                    labelText: 'Enter your email'
                ),
                autovalidateMode:  AutovalidateMode.onUserInteraction,
                validator: (email) =>
                email != null && !EmailValidator.validate(email)
                    ? 'Enter a valid email'
                    : null,

              ),
              SizedBox(height: 4),
              TextFormField(
                controller: passwordController,
                textInputAction: TextInputAction.done,
                decoration: InputDecoration(labelText: "Password"),
                obscureText: true,
                autovalidateMode:  AutovalidateMode.onUserInteraction,
                validator: (value) =>
                value != null && value.length<6
                    ? 'Enter min. 6 Characters'
                    : null,
              ),
              SizedBox(height: 30),
              ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  minimumSize: Size.fromHeight(50),
                ),
                icon: Icon(Icons.arrow_forward, size: 32,color: Colors.white,),
                label: Text('Sign Up',
                    style:TextStyle(fontSize: 24, color: Colors.white) ),
                onPressed:signUp,
              ),
              SizedBox(height: 24,),
              RichText(
                  text: TextSpan(
                    style: TextStyle(color: Colors.black26, fontSize: 15,),
                    text: 'Already have an account?  ',
                    children: [
                      TextSpan(
                          recognizer: TapGestureRecognizer()
                            ..onTap=widget.onClickSignIn,
                          text: "Login",
                          style: TextStyle(
                              decoration: TextDecoration.underline,
                              color: Theme.of(context).colorScheme.primary
                          )
                      )
                    ],
                  ))
            ],
          ),
        ),
     ) ,
  );

  Future signUp() async  {
    final isValid= formKey.currentState!.validate();
    if(!isValid) return;
    showDialog(context: context,
        barrierDismissible: false,
        builder: (context)=> Center(child: CircularProgressIndicator()) );
    try{
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: emailController.text.trim(),
          password: passwordController.text.trim()
      );
    } on FirebaseAuthException catch (e){
      print(e);
      Utils.showSnackBarforError(e.message);
    }

    navKey.currentState!.popUntil((route) => route.isFirst);

  }
}
