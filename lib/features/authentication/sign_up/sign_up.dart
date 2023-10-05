import 'package:flutter/material.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: <Widget>[
          Positioned(
            bottom: 500,
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: 300,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(20.0),
                    bottomLeft: Radius.elliptical(300.0, 200.0)),
                color: Colors.deepOrange,
              ),
            ),
          ),
          Positioned(
            bottom: 5,
            right: 130,
            child: Container(
              width: 300,
              height: 300,
              //color: Colors.green,
              child: Image.asset('assets/images/auth.png'),
            ),
          ),
          Positioned(
            bottom: 180,
            left: 20,
            child: Container(
              padding: const EdgeInsets.all(20),
              width: 320,
              height: 550,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(20.0),
                    bottomLeft: Radius.elliptical(300.0, 200.0)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey,
                    blurRadius: 2.0,
                    spreadRadius: 0.0,
                    offset: Offset(2.0, 2.0), // shadow direction: bottom right
                  )
                ],
                color: Colors.white,
              ),
              child: Column(
                children: [
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        const Text(
                          'Already have an account? ',
                          //style: TextStyle(fontSize: 0),
                        ),
                        TextButton(
                          onPressed: () {},
                          child: const Text(
                            'LogIn ',
                            //style: TextStyle(fontSize: 0),
                          ),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 60,
                  ),
                  const Text(
                    'Get On Board!',
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
                    height: 20,
                  ),
                  Expanded(
                    child: TextFormField(
                      decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                                width: 3,
                                color: Color.fromARGB(
                                    255, 233, 225, 225)), //<-- SEE HERE
                            borderRadius: BorderRadius.circular(50.0),
                          ),
                          label: const Text('******'),
                          prefixIcon: const Icon(Icons.lock)
                          //helperText: '******'
                          ),
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
