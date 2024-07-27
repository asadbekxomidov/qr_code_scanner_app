import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:qr_code_app/views/screens/generated/generated_screen.dart';
import 'package:qr_code_app/views/screens/home_screen.dart';
import 'package:qr_code_app/views/screens/settings/settings_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HistoryScreen extends StatefulWidget {
  const HistoryScreen({super.key});

  @override
  _HistoryScreenState createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  late Future<List<String>> _scanHistoryFuture;

  @override
  void initState() {
    super.initState();
    _scanHistoryFuture = _loadScanHistory();
  }

  Future<List<String>> _loadScanHistory() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getStringList('scanHistory') ?? [];
  }

  Future<void> _deleteScanData(int index) async {
    final prefs = await SharedPreferences.getInstance();
    final scanHistory = await _loadScanHistory();
    scanHistory.removeAt(index);
    await prefs.setStringList('scanHistory', scanHistory);
    setState(() {
      _scanHistoryFuture = _loadScanHistory();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade700,
      body: Stack(
        children: [
          FutureBuilder<List<String>>(
            future: _scanHistoryFuture,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(child: CircularProgressIndicator());
              } else if (snapshot.hasError) {
                return Center(child: Text('Error: ${snapshot.error}'));
              } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                return Center(
                    child: Text('No history found',
                        style: GoogleFonts.itim(color: Colors.white)));
              } else {
                final scanHistory = snapshot.data!;
                return Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    children: [
                      SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'History',
                            style: GoogleFonts.itim(
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                              color: Colors.white,
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (ctx) => SettingsScreen()));
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
                        ],
                      ),
                      SizedBox(height: 20),
                      Container(
                        height: 80,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: Colors.grey.shade900,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(10),
                          child: Row(
                            children: [
                              Container(
                                height: 75,
                                width: 150,
                                decoration: BoxDecoration(
                                  color: Colors.amber,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Center(
                                  child: Text(
                                    'Scan',
                                    style: GoogleFonts.itim(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w300,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                height: 75,
                                width: 150,
                                child: Center(
                                  child: Text(
                                    'Create',
                                    style: GoogleFonts.itim(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w300,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        child: ListView.builder(
                          itemCount: scanHistory.length,
                          itemBuilder: (context, index) {
                            final scanData = scanHistory[index].split(', ');
                            final code = scanData[0];
                            final timestamp = scanData[1];
                            return Container(
                              margin: EdgeInsets.symmetric(vertical: 5),
                              height: 70,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                color: Colors.grey.shade900,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Row(
                                children: [
                                  SizedBox(width: 20),
                                  Image.asset(
                                    'assets/images/image.png',
                                    height: 30,
                                    width: 30,
                                  ),
                                  SizedBox(width: 20),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            Flexible(
                                              child: Text(
                                                code,
                                                style: GoogleFonts.itim(
                                                  fontSize: 10,
                                                  fontWeight: FontWeight.w400,
                                                  color: Colors.white,
                                                ),
                                                overflow: TextOverflow.ellipsis,
                                                maxLines: 1,
                                              ),
                                            ),
                                            SizedBox(width: 60),
                                            InkWell(
                                              onTap: () {
                                                _deleteScanData(index);
                                              },
                                              child: SvgPicture.asset(
                                                  'assets/images/delete_image.svg',
                                                  height: 30,
                                                  width: 30),
                                            ),
                                            SizedBox(width: 20),
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            Text(
                                              'Data',
                                              style: GoogleFonts.itim(
                                                fontSize: 8,
                                                fontWeight: FontWeight.w300,
                                                color: Colors.white,
                                              ),
                                            ),
                                            Spacer(),
                                            Text(
                                              timestamp,
                                              style: GoogleFonts.itim(
                                                fontSize: 8,
                                                fontWeight: FontWeight.w300,
                                                color: Colors.white,
                                              ),
                                            ),
                                            SizedBox(width: 20),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                );
              }
            },
          ),
          Positioned(
            left: 20,
            top: 650,
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
                  InkWell(
                    onTap: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (ctx) => GeneratedScreen()),
                      );
                    },
                    child: Column(
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
                  ),
                  SizedBox(width: 80),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (ctx) => HistoryScreen()),
                      );
                    },
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
            top: 615,
            child: InkWell(
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
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
}
