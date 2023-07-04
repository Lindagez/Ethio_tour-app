import 'package:ethio_tour/screen/register.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

const myOrange = Color(0xFFD99E6A);

class AccountSetupPage extends StatefulWidget {
  const AccountSetupPage({super.key});

  @override
  State<AccountSetupPage> createState() => _Page5State();
}

class _Page5State extends State<AccountSetupPage> {
  String? _selectedImagePath;

  void _selectImage() {
    setState(() {
      _selectedImagePath = 'assets/images/profile_image.jpg';
    });
  }

  @override
  // ignore: dead_code
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            SizedBox.expand(
              child: Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Color(0xFF367368),
                      Color.fromRGBO(45, 92, 85, 1),
                      Color(0xFF264B46),
                      Color(0xFF22403D),
                    ],
                    stops: [0.0, 0.1912, 0.5104, 1.0],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20.0, left: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      IconButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const RegisterPage()),
                            );
                          },
                          icon: const Icon(Icons.arrow_back_sharp)),
                    ],
                  ),
                  // SizedBox(height: 70),
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(
                        'Account \nSetup',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 42,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                      Text(
                        'Finish Your Account Setup By Uploading Profile Picture And Set Your Bio',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      GestureDetector(
                        onTap: _selectImage,
                        child: CircleAvatar(
                          radius: 80.0,
                          backgroundColor: Colors.grey[300],
                          backgroundImage: _selectedImagePath != null
                              ? AssetImage(_selectedImagePath!)
                              : null,
                          child: _selectedImagePath == null
                              ? Icon(
                                  Icons.person,
                                  size: 80.0,
                                  color: Colors.grey[600],
                                )
                              : null,
                        ),
                      ),
                      Positioned(
                        right: 0,
                        bottom: 0,
                        child: FloatingActionButton.small(
                          backgroundColor: Color.fromARGB(255, 8, 154, 93),
                          // decoration: Bo/xDecoration(color: Colors.red.shade800),
                          onPressed: () {},
                          child: const Icon(
                            Icons.add,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(
                    height: 20.0,
                  ),

                  TextFormField(
                    decoration: const InputDecoration(
                        enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                                style: BorderStyle.solid, color: myOrange)),
                        labelText: 'Bio',
                        prefixIcon: Icon(Icons.newspaper_outlined,
                            color: Color(0xFFD99E6A)),
                        labelStyle: TextStyle(color: Color(0xFFD99E6A))),
                  ),
                  const SizedBox(height: 100.0), // Separating line

                  //SizedBox(height: 70.0), // Separating line
                  ElevatedButton(
                    onPressed: () {
                      context.go('/home');
                    },
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(
                        const Color(0xFFD99E6A),
                        // Customize the button color
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
                          EdgeInsets.symmetric(horizontal: 100, vertical: 15),
                      child: Text(
                        'Continue',
                        style: TextStyle(
                          color: Color.fromARGB(255, 0, 0, 0),
                          fontSize: 15,
                        ),
                      ),
                    ),
                  ),
                  //SizedBox(height: 20),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
