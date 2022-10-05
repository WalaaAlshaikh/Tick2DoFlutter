import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:tick2do/main.dart';

class LoginWidget extends StatefulWidget {
  final VoidCallback onClickSignUp;
  const LoginWidget({
    Key? key,
    required this.onClickSignUp,
}) : super(key: key);

  @override
 _LoginWidgetState createState() => _LoginWidgetState();
}

class _LoginWidgetState extends State<LoginWidget> {
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
    Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(height: 170,),
        Center(child:Text('Welcome Back To Tick2Do',textAlign: TextAlign.center, style: TextStyle(
          fontSize: 30, color: Colors.cyan,),) ,) ,
        SizedBox(height: 40),
        TextField(
          controller: emailController,
          cursorColor: Colors.white,
          textInputAction: TextInputAction.next,
          decoration: InputDecoration(
              labelText: 'Enter your email'
          ),

        ),
        SizedBox(height: 4),
        TextField(
          controller: passwordController,
          textInputAction: TextInputAction.done,
          decoration: InputDecoration(labelText: "Password"),
          obscureText: true,
        ),
        SizedBox(height: 30),
        ElevatedButton.icon(
          style: ElevatedButton.styleFrom(
            minimumSize: Size.fromHeight(50),
          ),
          icon: Icon(Icons.lock_open, size: 32,color: Colors.white,),
          label: Text('Sign in',
              style:TextStyle(fontSize: 24, color: Colors.white) ),
          onPressed:signIn,
        ),
        SizedBox(height: 24,),
        RichText(
            text: TextSpan(
              style: TextStyle(color: Colors.black26, fontSize: 15,),
              text: 'No account?  ',
              children: [
                TextSpan(
                  recognizer: TapGestureRecognizer()
                    ..onTap=widget.onClickSignUp,
                  text: "Sign Up",
                  style: TextStyle(
                    decoration: TextDecoration.underline,
                    color: Theme.of(context).colorScheme.primary
                  )
                )
              ],
            ))
      ],
    ), ) ,
  );

  Future signIn() async  {
    showDialog(context: context,
        barrierDismissible: false,
        builder: (context)=> Center(child: CircularProgressIndicator()) );
    try{
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: emailController.text.trim(),
          password: passwordController.text.trim()
      );
    } on FirebaseAuthException catch (e){
      print(e);
    }

    navKey.currentState!.popUntil((route) => route.isFirst);

  }
}
