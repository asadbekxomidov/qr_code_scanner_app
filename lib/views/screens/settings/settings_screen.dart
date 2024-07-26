import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:qr_code_app/views/screens/generated/generated_screen.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool _isVibrateOn = true;
  bool _isBeepOn = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 20),
                Row(
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (ctx) => GeneratedScreen()));
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
                    SizedBox(width: 10),
                  ],
                ),
                SizedBox(height: 30),
                Text(
                  'Settings',
                  style: GoogleFonts.itim(
                    color: Colors.amber.shade600,
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(height: 10),
                _buildSettingsItem(
                  'Vibrate',
                  'assets/images/virable_images.svg',
                  'Vibration when scan is done.',
                  _isVibrateOn,
                  (bool value) {
                    setState(() {
                      _isVibrateOn = value;
                    });
                  },
                ),
                SizedBox(height: 10),
                _buildSettingsItem(
                  'Beep',
                  'assets/images/beep_images.svg',
                  'Beep when scan is done.',
                  _isBeepOn,
                  (bool value) {
                    setState(() {
                      _isBeepOn = value;
                    });
                  },
                ),
                SizedBox(height: 30),
                Text(
                  'Support',
                  style: GoogleFonts.itim(
                    color: Colors.amber.shade600,
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(height: 10),
                _buildSupportItem(
                  'Rate Us',
                  'Your best reward to us.',
                  'assets/images/rateus_icon.svg',
                ),
                _buildSupportItem(
                  'Share',
                  'Share app with others.',
                  'assets/images/share_icon.svg',
                ),
                _buildSupportItem(
                  'Privacy Policy',
                  'Follow our policies that benefit you.',
                  'assets/images/privacy_policy_icon.svg',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSettingsItem(String title, String iconPath, String subtitle,
      bool switchValue, Function(bool) onChanged) {
    return Container(
      padding: EdgeInsets.all(12),
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
        children: [
          SvgPicture.asset(iconPath, height: 24, width: 24),
          SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: GoogleFonts.itim(
                    color: Colors.amber.shade600,
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 5),
                Text(
                  subtitle,
                  style: GoogleFonts.itim(
                    color: Colors.white70,
                    fontSize: 10,
                  ),
                ),
              ],
            ),
          ),
          Switch(
            value: switchValue,
            onChanged: onChanged,
            activeColor: Colors.amber.shade600,
          ),
        ],
      ),
    );
  }

  Widget _buildSupportItem(String title, String subtitle, String iconPath) {
    return Container(
      padding: EdgeInsets.all(12),
      margin: EdgeInsets.symmetric(vertical: 5),
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
        children: [
          SvgPicture.asset(iconPath, height: 24, width: 24),
          SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: GoogleFonts.itim(
                    color: Colors.amber.shade600,
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 5),
                Text(
                  subtitle,
                  style: GoogleFonts.itim(
                    color: Colors.white70,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
