import 'package:flutter/material.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: <Widget>[
          Positioned(
            bottom: 500,
            left: 20,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Welcome \nBack!',
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
                Container(
                  width: 250,
                  height: 250,
                  //color: Colors.green,
                  child: Image.asset('assets/images/auth.png'),
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 0.1,
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: 300,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                    // bottomRight: Radius.circular(20.0),
                    topRight: Radius.elliptical(300.0, 200.0)),
                color: Colors.deepOrange,
              ),
            ),
          ),
          // Positioned(
          //   bottom: 5,
          //   right: 130,
          //   child: Container(
          //     width: 300,
          //     height: 300,
          //     //color: Colors.green,
          //     child: Image.asset('assets/images/auth.png'),
          //   ),
          // ),
          Positioned(
            bottom: 20,
            left: 20,
            child: Container(
              padding: const EdgeInsets.all(20),
              width: 320,
              height: 520,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(20.0),
                    topRight: Radius.elliptical(300.0, 200.0)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey,
                    blurRadius: 2.0,
                    spreadRadius: 0.0,
                    offset: Offset(1.0, 1.0), // shadow direction: bottom right
                  )
                ],
                color: Colors.white,
              ),
              child: Column(
                children: [
                  const SizedBox(
                    height: 60,
                  ),
                  const Text(
                    'LogIn',
                    style: TextStyle(fontSize: 30),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  Expanded(
                    child: TextFormField(
                      decoration: InputDecoration(
                          isDense: true,
                          enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                                width: 3,
                                color: Color.fromARGB(
                                    255, 233, 225, 225)), //<-- SEE HERE
                            borderRadius: BorderRadius.circular(50.0),
                          ),
                          label: const Text('abc@example.com'),
                          prefixIcon: const Icon(Icons.mail)
                          //helperText: 'abc@example.com'),
                          ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Expanded(
                    child: TextFormField(
                      obscureText: true,
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                              width: 3,
                              color: Color.fromARGB(
                                  255, 233, 225, 225)), //<-- SEE HERE
                          borderRadius: BorderRadius.circular(50.0),
                        ),
                        label: const Text('******'),
                        prefixIcon: const Icon(Icons.lock),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextButton(
                    onPressed: () {},
                    child: const Text(
                      'Forget Paassword?',
                      //style: TextStyle(fontSize: 0),
                    ),
                  ),
                  const SizedBox(
                    height: 100,
                  ),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: IconButton.filled(
                      onPressed: () {},
                      icon: const Icon(Icons.arrow_right_alt),
                      color: Colors.black,
                      iconSize: 35,
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
