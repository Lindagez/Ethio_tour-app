import 'package:ethio_tour/screen/login.dart';
import 'package:ethio_tour/screen/account_setup.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

const myOrange = Color(0xFFD99E6A);

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            const SizedBox.expand(
              child: Image(
                image: AssetImage("assets/images/ethio.jpeg"),
                fit: BoxFit.cover,
              ),
            ),
            SizedBox.expand(
              child: Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    stops: [0, 0.1912, 0.5104, 1],
                    colors: [
                      Color(0xFF367368),
                      Color.fromRGBO(45, 92, 85, 0.544657),
                      Color(0xFF264B46),
                      Color(0xFF22403D),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20.0,
                vertical: 16.0,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      IconButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const LoginPage()),
                            );
                          },
                          icon: const Icon(Icons.arrow_back_sharp)),
                    ],
                  ),
                  // SizedBox(height: 20),
                  Text('Register',
                      style: GoogleFonts.lobster(
                        color: Colors.white,
                        fontSize: 50,
                      )),

                  const SizedBox(
                    height: 70.0,
                  ),

                  TextFormField(
                    decoration: const InputDecoration(
                        enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                                style: BorderStyle.solid, color: myOrange)),
                        labelText: 'Full Name',
                        prefixIcon:
                            Icon(Icons.person, color: Color(0xFFD99E6A)),
                        labelStyle: TextStyle(color: Color(0xFFD99E6A))),
                  ),
                  const SizedBox(height: 20.0), // Separating line

                  TextFormField(
                    decoration: const InputDecoration(
                        enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                                style: BorderStyle.solid, color: myOrange)),
                        labelText: 'Email',
                        prefixIcon:
                            Icon(Icons.person, color: Color(0xFFD99E6A)),
                        labelStyle: TextStyle(color: Color(0xFFD99E6A))),
                  ),
                  const SizedBox(height: 20.0), // Separating line
                  TextFormField(
                    decoration: const InputDecoration(
                        border: InputBorder.none,
                        labelText: 'Password',
                        prefixIcon: Icon(
                          Icons.lock,
                          color: Color(0xFFD99E6A),
                        ),
                        labelStyle: TextStyle(color: Color(0xFFD99E6A))),
                    obscureText: true,
                  ),
                  const SizedBox(height: 70.0), // Separating line
                  ElevatedButton(
                    onPressed: () {
                      context.push('/account-setup');
                    },
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(
                        const Color(0xFFD99E6A),
                        // Customize the button color
                      ),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                            15.0,
                          ), // Customize the border radius
                        ),
                      ),
                    ),
                    child: const Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 100, vertical: 15),
                      child: Text('Login',
                          style: TextStyle(
                            color: Color.fromARGB(255, 0, 0, 0),
                            fontSize: 15,
                          )),
                    ),
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const LoginPage()));
                    },
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(
                        Color(0xFF22403D), // Customize the button color
                      ),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                              15.0), // Customize the border radius
                        ),
                      ),
                    ),
                    child: const Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                      child: Text('Login With Google',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                          )),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
