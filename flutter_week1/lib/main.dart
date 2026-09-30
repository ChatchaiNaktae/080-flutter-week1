import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Profile UI',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        scaffoldBackgroundColor: const Color(0xFFF1F4F8), // FlutterFlow primaryBackground
      ),
      home: const HomePageWidget(),
    );
  }
}

class HomePageWidget extends StatefulWidget {
  const HomePageWidget({super.key});

  @override
  State createState() => _HomePageWidgetState();
}

class _HomePageWidgetState extends State {
  final GlobalKey scaffoldKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Unfocus keyboard/input when tapping outside
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        appBar: AppBar(
          backgroundColor: const Color(0xFF39D2C0), // FlutterFlow tertiary color
          automaticallyImplyLeading: false,
          elevation: 2,
          centerTitle: false,
          title: Text(
            '080 FinalMobile#1 - ProfileUI',
            style: GoogleFonts.interTight(
              color: Colors.white,
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        body: SafeArea(
          top: true,
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SizedBox(height: 10),
                Align(
                  alignment: const AlignmentDirectional(0, -1),
                  child: Text(
                    '-------------------------------------------------',
                    style: GoogleFonts.interTight(
                      fontSize: 16,
                      color: Colors.grey.shade600,
                    ),
                  ),
                ),
                Align(
                  alignment: const AlignmentDirectional(0, -1),
                  child: Text(
                    'Profile - โปรไฟล์',
                    style: GoogleFonts.interTight(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: const Color(0xFF14181B),
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                Container(
                  width: 200,
                  height: 200,
                  clipBehavior: Clip.antiAlias,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                  ),
                  child: Image.network(
                    'https://cdn-icons-png.flaticon.com/512/3135/3135715.png',
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(height: 16),
                Text(
                  'นาย ชัชชัย นาคแท้',
                  style: GoogleFonts.interTight(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: const Color(0xFF14181B),
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  'รหัสนักศึกษา: 016830641008-0',
                  style: GoogleFonts.interTight(
                    fontSize: 16,
                    color: const Color(0xFF57636C),
                  ),
                ),
                const SizedBox(height: 8),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.location_on,
                      color: Color(0xFF14181B),
                      size: 24,
                    ),
                    const SizedBox(width: 4),
                    Text(
                      'จังหวัด ชลบุรี',
                      style: GoogleFonts.interTight(
                        fontSize: 16,
                        color: const Color(0xFF14181B),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                Align(
                  alignment: const AlignmentDirectional(0, -1),
                  child: Text(
                    '-------------------------------------------------',
                    style: GoogleFonts.interTight(
                      fontSize: 16,
                      color: Colors.grey.shade600,
                    ),
                  ),
                ),
                Align(
                  alignment: const AlignmentDirectional(0, -1),
                  child: Text(
                    'Bio - ไบโอ',
                    style: GoogleFonts.interTight(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: const Color(0xFF14181B),
                    ),
                  ),
                ),
                const SizedBox(height: 8),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24.0),
                  child: Text(
                    '🎓 นศ. CS ปี 2 | 1st Yr CS Student. 💻 Tech Stack: Python, C, Lua, HTML/CSS. 🚀 เน้นพัฒนาสกิลและเรียนรู้สิ่งใหม่ๆ ตลอดเวลาครับผม',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.interTight(
                      fontSize: 15,
                      color: const Color(0xFF57636C),
                      height: 1.4,
                    ),
                  ),
                ),
                const SizedBox(height: 12),
                Align(
                  alignment: const AlignmentDirectional(0, -1),
                  child: Text(
                    '-------------------------------------------------',
                    style: GoogleFonts.interTight(
                      fontSize: 16,
                      color: Colors.grey.shade600,
                    ),
                  ),
                ),
                Align(
                  alignment: const AlignmentDirectional(0, -1),
                  child: Text(
                    'Favorite Foods - อาหารที่ชอบ',
                    style: GoogleFonts.interTight(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: const Color(0xFF14181B),
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(24),
                      child: Image.network(
                        'https://images.weserv.nl/?url=f.ptcdn.info/240/066/000/pyqummmk9eMmRCy1dBr-o.jpg',
                        width: 110,
                        height: 110,
                        fit: BoxFit.cover,
                      ),
                    ),
                    const SizedBox(width: 8),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(24),
                      child: Image.network(
                        'https://images.weserv.nl/?url=www.gourmetandcuisine.com/Images/editor_upload/_editor20251002030911_original.jpg',
                        width: 110,
                        height: 110,
                        fit: BoxFit.cover,
                      ),
                    ),
                    const SizedBox(width: 8),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(24),
                      child: Image.network(
                        'https://i.ytimg.com/vi/FoHjU3ZUe3w/maxresdefault.jpg',
                        width: 110,
                        height: 110,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                Align(
                  alignment: const AlignmentDirectional(0, -1),
                  child: Text(
                    '-------------------------------------------------',
                    style: GoogleFonts.interTight(
                      fontSize: 16,
                      color: Colors.grey.shade600,
                    ),
                  ),
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}