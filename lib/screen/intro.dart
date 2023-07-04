import 'package:ethio_tour/screen/login.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

class IntroPage extends StatefulWidget {
  const IntroPage({
    super.key,
  });

  @override
  State<IntroPage> createState() => _IntroPageState();
}

class _IntroPageState extends State<IntroPage> {
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
                    colors: [
                      Color(0xFF367368),
                      Color(0x8C2D5C55),
                      Color(0x7A264B46),
                      Color(0xFF22403D),
                    ],
                    stops: [0, 0.1912, 0.6805, 1],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'explore the beauty of ethiopia',
                    style: GoogleFonts.lobster(
                      color: Colors.white,
                      fontSize: 50,
                    ),
                  ),
                  const Text(
                    'Discover the wonders of Ethiopia! Explore ancient rock-hewn churches, breathtaking landscapes, vibrant markets, and rich cultural traditions.',
                    style: TextStyle(color: Colors.white, fontSize: 15),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          context.push('/intro2');
        },
        label: const Icon(Icons.arrow_right_alt),
        foregroundColor: const Color(0xFF22403D),
        backgroundColor: const Color(0xFFD99E6A),
      ),
    );
  }
}

class Intro2 extends StatelessWidget {
  const Intro2({super.key});

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
                    colors: [
                      Color(0xFF367368),
                      Color(0x8C2D5C55),
                      Color(0x7A264B46),
                      Color(0xFF22403D),
                    ],
                    stops: [0, 0.1912, 0.6805, 1],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text('explore the beauty of ethiopia',
                      style: GoogleFonts.lobster(
                        color: Colors.white,
                        fontSize: 50,
                      )),
                  const Text(
                    'Get ready to embark on an extraordinary adventure filled with ancient treasures, natural splendors, vibrant markets, and rich cultural traditions. ',
                    style: TextStyle(color: Colors.white, fontSize: 15),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => LoginPage(),
            ),
          );
        },
        label: Text(
          'sign in',
          style: GoogleFonts.lobster(
            color: Color.fromARGB(255, 0, 0, 0),
            fontSize: 20,
          ),
        ),
        foregroundColor: Color(0xFF22403D),
        backgroundColor: Color(0xFFD99E6A),
      ),
    );
  }
}
