import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:qr_code_app/views/screens/home_screen.dart';
import 'package:qr_code_app/views/screens/settings/settings_screen.dart';

class GeneratedScreen extends StatelessWidget {
  const GeneratedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            InkWell(
              onTap: () {
                Navigator.pushReplacement(
                    context, MaterialPageRoute(builder: (ctx) => HomeScreen()));
              },
              child: Container(
                height: 30,
                width: 30,
                decoration: BoxDecoration(
                  color: Colors.grey.shade900,
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Center(
                  child: Icon(
                    Icons.arrow_back_ios_rounded,
                    color: Colors.amber.shade600,
                  ),
                ),
              ),
            ),
            SizedBox(width: 20),
            Text(
              'Generate QR',
              style: GoogleFonts.itim(
                fontSize: 18,
              ),
            ),
          ],
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: InkWell(
              onTap: () {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (ctx) => SettingsScreen()));
              },
              child: Container(
                height: 40,
                width: 40,
                decoration: BoxDecoration(
                  color: Colors.grey.shade900,
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Center(
                  child: SvgPicture.asset(
                    'assets/images/vector_images.svg',
                    height: 16,
                    width: 16,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 20),
                Expanded(
                  child: GridView.count(
                    crossAxisCount: 3,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                    children: [
                      _buildGridItem(
                          'Text', 'assets/images/text_icon.svg', context),
                      _buildGridItem(
                          'Website', 'assets/images/website_icon.svg', context),
                      _buildGridItem(
                          'Wi-Fi', 'assets/images/wifi_icon.svg', context),
                      _buildGridItem(
                          'Event', 'assets/images/event_icon.svg', context),
                      _buildGridItem(
                          'Contact', 'assets/images/contact_icon.svg', context),
                      _buildGridItem('Business',
                          'assets/images/business_icon.svg', context),
                      _buildGridItem('Location',
                          'assets/images/location_icon.svg', context),
                      _buildGridItem('WhatsApp',
                          'assets/images/whatsapp_icon.svg', context),
                      _buildGridItem(
                          'Email', 'assets/images/email_icon.svg', context),
                      _buildGridItem(
                          'Twitter', 'assets/images/twitter_icon.svg', context),
                      _buildGridItem('Instagram',
                          'assets/images/instagram_icon.svg', context),
                      _buildGridItem('Telephone',
                          'assets/images/telephone_icon.svg', context),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            left: 20,
            top: 570,
            child: Container(
              padding: EdgeInsets.all(12),
              height: 75,
              width: 320,
              decoration: BoxDecoration(
                color: Colors.grey.shade800,
                borderRadius: BorderRadius.circular(8),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.5),
                    spreadRadius: 2,
                    blurRadius: 5,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SvgPicture.asset('assets/images/qr_image.svg',
                          height: 24, width: 24),
                      Text(
                        'Generate',
                        style: GoogleFonts.itim(
                          color: Colors.white,
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(width: 80),
                  InkWell(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(Icons.history, color: Colors.white, size: 24),
                        Text(
                          'History',
                          style: GoogleFonts.itim(
                            color: Colors.white,
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            left: 150,
            top: 540,
            child: InkWell(
              onTap: () {
                Navigator.pushReplacement(
                    context, MaterialPageRoute(builder: (ctx) => HomeScreen()));
              },
              child: Container(
                height: 65,
                width: 65,
                clipBehavior: Clip.hardEdge,
                decoration: BoxDecoration(
                  color: Colors.amber.shade600,
                  borderRadius: BorderRadius.circular(50),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.5),
                      spreadRadius: 2,
                      blurRadius: 5,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
                child: Center(
                  child: SvgPicture.asset(
                    'assets/images/float_button.svg',
                    height: 35,
                    width: 35,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildGridItem(String title, String assetPath, BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Handle grid item tap
      },
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.amber.shade400,
            width: 3,
          ),
          color: Colors.grey.shade800,
          borderRadius: BorderRadius.circular(8),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 5,
              offset: Offset(0, 3),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(assetPath),
            SizedBox(height: 8),
            Text(
              title,
              style: GoogleFonts.itim(
                color: Colors.amber.shade600,
                fontSize: 14,
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBottomNavItem(String title, String assetPath) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SvgPicture.asset(
          assetPath,
          height: 35,
          width: 35,
        ),
        Text(
          title,
          style: GoogleFonts.itim(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
