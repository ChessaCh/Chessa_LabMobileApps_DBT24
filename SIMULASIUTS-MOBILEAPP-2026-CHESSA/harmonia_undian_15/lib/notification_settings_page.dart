import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class NotificationSettingsPage extends StatefulWidget {
  const NotificationSettingsPage({Key? key}) : super(key: key);

  @override
  State<NotificationSettingsPage> createState() => _NotificationSettingsPageState();
}

class _NotificationSettingsPageState extends State<NotificationSettingsPage> {
  String selectedAlertMode = 'Combined'; // Combined, Vibration, Silent mode
  bool doNotDisturb = false;

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          // Top Wave Decoration
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: CustomPaint(
              size: Size(screenSize.width, 100),
              painter: TopWavePainter(),
            ),
          ),
          // Bottom Wave Decoration
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: CustomPaint(
              size: Size(screenSize.width, 120),
              painter: BottomWavePainter(),
            ),
          ),
          // Main Content
          SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 10, top: 10),
                  child: IconButton(
                    icon: const Icon(Icons.arrow_back, size: 34, color: Colors.black),
                    onPressed: () => Navigator.pop(context),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 26.0),
                  child: Text(
                    'Notification Settings',
                    style: GoogleFonts.poppins(
                      fontSize: 22,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
                  ),
                ),
                const SizedBox(height: 35),
                Expanded(
                  child: ListView(
                    physics: const BouncingScrollPhysics(),
                    padding: const EdgeInsets.symmetric(horizontal: 26),
                    children: [
                      // Alert mode section
                      Row(
                        children: [
                          Icon(
                            Icons.info_outline,
                            color: Colors.grey.shade400,
                            size: 20,
                          ),
                          const SizedBox(width: 8),
                          Text(
                            'Alert mode',
                            style: GoogleFonts.poppins(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 15),
                      // Combined option
                      _buildRadioOption(
                        title: 'Combined',
                        value: 'Combined',
                        groupValue: selectedAlertMode,
                        onChanged: (value) {
                          setState(() {
                            selectedAlertMode = value!;
                            doNotDisturb = false;
                          });
                        },
                      ),
                      Divider(color: Colors.grey.shade300, height: 1),
                      // Vibration option
                      _buildRadioOption(
                        title: 'Vibration',
                        value: 'Vibration',
                        groupValue: selectedAlertMode,
                        onChanged: (value) {
                          setState(() {
                            selectedAlertMode = value!;
                            doNotDisturb = false;
                          });
                        },
                      ),
                      Divider(color: Colors.grey.shade300, height: 1),
                      // Silent mode option
                      _buildRadioOption(
                        title: 'Silent mode',
                        value: 'Silent mode',
                        groupValue: selectedAlertMode,
                        onChanged: (value) {
                          setState(() {
                            selectedAlertMode = value!;
                            doNotDisturb = false;
                          });
                        },
                      ),
                      Divider(color: Colors.grey.shade300, height: 1),
                      const SizedBox(height: 25),
                      // Do not disturb section
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            doNotDisturb = !doNotDisturb;
                          });
                        },
                        child: Container(
                          padding: const EdgeInsets.symmetric(vertical: 4),
                          color: Colors.transparent,
                          child: Row(
                            children: [
                              Icon(
                                Icons.notifications_off_outlined,
                                color: Colors.black,
                                size: 24,
                              ),
                              const SizedBox(width: 12),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Do not disturb',
                                      style: GoogleFonts.poppins(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.black,
                                      ),
                                    ),
                                    const SizedBox(height: 2),
                                    Text(
                                      'Turn off all notification',
                                      style: GoogleFonts.poppins(
                                        fontSize: 13,
                                        color: Colors.grey.shade600,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Radio<bool>(
                                value: true,
                                groupValue: doNotDisturb,
                                onChanged: (value) {
                                  setState(() {
                                    doNotDisturb = value!;
                                  });
                                },
                                activeColor: Colors.black,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildRadioOption({
    required String title,
    required String value,
    required String groupValue,
    required ValueChanged<String?> onChanged,
  }) {
    return GestureDetector(
      onTap: () => onChanged(value),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 14),
        color: Colors.transparent,
        child: Row(
          children: [
            Expanded(
              child: Text(
                title,
                style: GoogleFonts.poppins(
                  fontSize: 15,
                  color: Colors.black,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            Radio<String>(
              value: value,
              groupValue: groupValue,
              onChanged: onChanged,
              activeColor: Colors.black,
            ),
          ],
        ),
      ),
    );
  }
}

class TopWavePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = const Color(0xFF7A9AB8)
      ..style = PaintingStyle.fill;

    final path = Path();
    // Start from top-left corner
    path.moveTo(0, 0);
    
    // Create smooth wave curve from left to right
    path.cubicTo(
      size.width * 0.3, 0,
      size.width * 0.4, size.height * 0.6,
      size.width, size.height * 0.4,
    );
    
    // Top-right corner
    path.lineTo(size.width, 0);
    path.close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class BottomWavePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = const Color(0xFF7A9AB8)
      ..style = PaintingStyle.fill;

    final path = Path();
    // Start from bottom-left corner
    path.moveTo(0, size.height);
    
    // Create smooth wave curve from left to right
    path.cubicTo(
      size.width * 0.3, size.height * 0.3,
      size.width * 0.6, 0,
      size.width, size.height * 0.4,
    );
    
    // Bottom-right corner
    path.lineTo(size.width, size.height);
    path.close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
