import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:qr_code_app/views/screens/home_screen.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade900,
      body: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            SizedBox(height: 160),
            SvgPicture.asset('assets/images/qr_logo.svg'),
            SizedBox(height: 100),
            Column(
              children: [
                Text(
                  'Go and enjoy our features for free and make your life easy with us.',
                  style: GoogleFonts.itim(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w300,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 40),
                InkWell(
                  onTap: () {
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (ctx) => HomeScreen()));
                  },
                  child: Container(
                    height: 60,
                    width: 319,
                    decoration: BoxDecoration(
                        color: Colors.amber.shade700,
                        borderRadius: BorderRadius.circular(10)),
                    child: Center(
                      child: Row(
                        children: [
                          SizedBox(width: 80),
                          Text('Let’s Start',
                              style: GoogleFonts.itim(
                                color: Colors.black,
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                              )),
                          SizedBox(width: 80),
                          Icon(
                            Icons.keyboard_arrow_right,
                            color: Colors.black,
                            size: 25,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
