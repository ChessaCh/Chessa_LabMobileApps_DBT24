import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';
import 'notification_settings_page.dart';

class NotificationData {
  final IconData icon;
  final String title;
  final String subtitle;
  final String time;
  final DateTime date;

  NotificationData({
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.time,
    required this.date,
  });
}

class NotificationPage extends StatefulWidget {
  const NotificationPage({Key? key}) : super(key: key);

  @override
  State<NotificationPage> createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  DateTime? selectedDate; // null means show default view (Today + Yesterday)
  late List<NotificationData> allNotifications;

  @override
  void initState() {
    super.initState();
    selectedDate = null; // Start with default view
    _initializeNotifications();
  }

  void _initializeNotifications() {
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    final yesterday = today.subtract(const Duration(days: 1));
    final twoDaysAgo = today.subtract(const Duration(days: 2));
    final threeDaysAgo = today.subtract(const Duration(days: 3));

    allNotifications = [
      // Today's notifications
      NotificationData(
        icon: Icons.notifications_none_outlined,
        title: 'Reminder',
        subtitle: "It's time to walk!",
        time: 'Just now',
        date: today,
      ),
      NotificationData(
        icon: Icons.person_outline,
        title: 'Gracello',
        subtitle: 'Reminded you to take a break!',
        time: '14:24',
        date: today,
      ),
      NotificationData(
        icon: Icons.person_outline,
        title: 'Bayu Tri Wibowo',
        subtitle: 'Reminded you to stretch!',
        time: '11:52',
        date: today,
      ),
      // Yesterday's notifications
      NotificationData(
        icon: Icons.notifications_none_outlined,
        title: 'Reminder',
        subtitle: "It's time to take a pill!",
        time: '17:22',
        date: yesterday,
      ),
      NotificationData(
        icon: Icons.notifications_none_outlined,
        title: 'Reminder',
        subtitle: "It's time to stretch!",
        time: '09:11',
        date: yesterday,
      ),
      // Two days ago
      NotificationData(
        icon: Icons.person_outline,
        title: 'Gracello',
        subtitle: 'Sent you a motivation message!',
        time: '15:30',
        date: twoDaysAgo,
      ),
      NotificationData(
        icon: Icons.notifications_none_outlined,
        title: 'Reminder',
        subtitle: "Don't forget to drink water!",
        time: '10:00',
        date: twoDaysAgo,
      ),
      // Three days ago
      NotificationData(
        icon: Icons.person_outline,
        title: 'Bayu Tri Wibowo',
        subtitle: 'Reminded you to exercise!',
        time: '08:45',
        date: threeDaysAgo,
      ),
      NotificationData(
        icon: Icons.notifications_none_outlined,
        title: 'Reminder',
        subtitle: "Time for your morning routine!",
        time: '07:00',
        date: threeDaysAgo,
      ),
    ];
  }

  List<NotificationData> _getNotificationsForDate(DateTime date) {
    final targetDate = DateTime(date.year, date.month, date.day);
    return allNotifications.where((notification) {
      final notificationDate = DateTime(
        notification.date.year,
        notification.date.month,
        notification.date.day,
      );
      return notificationDate.isAtSameMomentAs(targetDate);
    }).toList();
  }

  String _getDateLabel(DateTime date) {
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    final yesterday = today.subtract(const Duration(days: 1));
    final targetDate = DateTime(date.year, date.month, date.day);

    if (targetDate.isAtSameMomentAs(today)) {
      return 'Today';
    } else if (targetDate.isAtSameMomentAs(yesterday)) {
      return 'Yesterday';
    } else {
      return '${date.day} ${_getMonthName(date.month)} ${date.year}';
    }
  }

  String _getMonthName(int month) {
    const months = ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'];
    return months[month - 1];
  }

  void _showFilterDialog(BuildContext context) async {
    final DateTime? result = await showDialog<DateTime>(
      context: context,
      builder: (BuildContext context) {
        return _DatePickerDialog(initialDate: selectedDate ?? DateTime.now());
      },
    );

    if (result != null) {
      setState(() {
        selectedDate = result;
      });
    }
  }



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
              size: Size(screenSize.width, 180),
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
          // Settings Button
          Positioned(
            top: 50,
            right: 25,
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const NotificationSettingsPage(),
                  ),
                );
              },
              child: Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  color: const Color(0xFF8DA4B9),
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.25),
                      blurRadius: 12,
                      offset: const Offset(0, 6),
                    ),
                  ],
                ),
                child: const Icon(
                  Icons.settings,
                  color: Colors.black,
                  size: 28,
                ),
              ),
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
                  padding: EdgeInsets.symmetric(horizontal: 26.0),
                  child: Text(
                    'Notification',
                    style: GoogleFonts.inter(
                      fontSize: 22,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
                  ),
                ),
                const SizedBox(height: 25),
                Expanded(
                  child: ListView(
                    physics: const BouncingScrollPhysics(),
                    padding: const EdgeInsets.symmetric(horizontal: 22),
                    children: [
                      // Filter Icon Section
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          if (selectedDate != null)
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  selectedDate = null; // Clear filter
                                });
                              },
                              child: Padding(
                                padding: const EdgeInsets.only(right: 10),
                                child: Icon(Icons.close, color: Colors.grey.shade400, size: 20),
                              ),
                            ),
                          Text(
                            selectedDate != null ? _getDateLabel(selectedDate!) : 'Today',
                            style: GoogleFonts.poppins(
                              fontSize: 20,
                              color: const Color(0xFF9E9E9E),
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          const SizedBox(width: 10),
                          GestureDetector(
                            onTap: () => _showFilterDialog(context),
                            child: Icon(Icons.filter_list, color: Colors.grey.shade400, size: 22),
                          ),
                        ],
                      ),
                      const SizedBox(height: 15),
                      ..._buildNotificationsList(),
                      const SizedBox(height: 120),
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

  List<Widget> _buildNotificationsList() {
    // If no date is selected, show default view (Today + Yesterday)
    if (selectedDate == null) {
      return _buildDefaultView();
    }
    
    // Otherwise, show filtered view for selected date
    final notifications = _getNotificationsForDate(selectedDate!);
    
    if (notifications.isEmpty) {
      return [
        Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 40),
            child: Text(
              'No notifications for this date',
              style: GoogleFonts.poppins(
                fontSize: 16,
                color: Colors.grey.shade400,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
        ),
      ];
    }

    List<Widget> widgets = [];
    for (int i = 0; i < notifications.length; i++) {
      widgets.add(
        NotificationCard(
          icon: notifications[i].icon,
          title: notifications[i].title,
          subtitle: notifications[i].subtitle,
          time: notifications[i].time,
        ),
      );
      if (i < notifications.length - 1) {
        widgets.add(const SizedBox(height: 10));
      }
    }
    return widgets;
  }

  List<Widget> _buildDefaultView() {
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    final yesterday = today.subtract(const Duration(days: 1));

    final todayNotifications = _getNotificationsForDate(today);
    final yesterdayNotifications = _getNotificationsForDate(yesterday);

    List<Widget> widgets = [];

    // Today section (without header, it's already shown in the filter row)
    if (todayNotifications.isNotEmpty) {
      for (int i = 0; i < todayNotifications.length; i++) {
        widgets.add(
          NotificationCard(
            icon: todayNotifications[i].icon,
            title: todayNotifications[i].title,
            subtitle: todayNotifications[i].subtitle,
            time: todayNotifications[i].time,
          ),
        );
        widgets.add(const SizedBox(height: 10));
      }
      widgets.add(const SizedBox(height: 15)); // Extra spacing before Yesterday
    }

    // Yesterday section
    if (yesterdayNotifications.isNotEmpty) {
      widgets.add(
        Center(
          child: Text(
            'Yesterday',
            style: GoogleFonts.poppins(
              fontSize: 18,
              color: const Color(0xFF9E9E9E),
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      );
      widgets.add(const SizedBox(height: 15));
      for (int i = 0; i < yesterdayNotifications.length; i++) {
        widgets.add(
          NotificationCard(
            icon: yesterdayNotifications[i].icon,
            title: yesterdayNotifications[i].title,
            subtitle: yesterdayNotifications[i].subtitle,
            time: yesterdayNotifications[i].time,
          ),
        );
        if (i < yesterdayNotifications.length - 1) {
          widgets.add(const SizedBox(height: 10));
        }
      }
    }

    if (widgets.isEmpty) {
      widgets.add(
        Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 40),
            child: Text(
              'No notifications',
              style: GoogleFonts.poppins(
                fontSize: 16,
                color: Colors.grey.shade400,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
        ),
      );
    }

    return widgets;
  }
}

class _DatePickerDialog extends StatefulWidget {
  final DateTime initialDate;
  
  const _DatePickerDialog({Key? key, required this.initialDate}) : super(key: key);

  @override
  State<_DatePickerDialog> createState() => _DatePickerDialogState();
}

class _DatePickerDialogState extends State<_DatePickerDialog> {
  late FixedExtentScrollController _dayController;
  late FixedExtentScrollController _monthController;
  late FixedExtentScrollController _yearController;
  
  late int _selectedDayIndex;
  late int _selectedMonthIndex;
  late int _selectedYearIndex;

  final List<String> _days = ['01', '02', '03', '04', '05', '06', '07', '08', '09', '10', '11', '12', '13', '14', '15', '16', '17', '18', '19', '20', '21', '22', '23', '24', '25', '26', '27', '28', '29', '30', '31'];
  final List<String> _months = ['January', 'February', 'March', 'April', 'May', 'June', 'July', 'August', 'September', 'October', 'November', 'December'];
  final List<String> _years = ['2020', '2021', '2022', '2023', '2024', '2025', '2026', '2027', '2028', '2029', '2030'];

  @override
  void initState() {
    super.initState();
    // Initialize based on the passed initial date
    _selectedDayIndex = widget.initialDate.day - 1;
    _selectedMonthIndex = widget.initialDate.month - 1;
    _selectedYearIndex = _years.indexOf(widget.initialDate.year.toString());
    if (_selectedYearIndex == -1) _selectedYearIndex = 5; // default to 2025 if year not in list
    
    _dayController = FixedExtentScrollController(initialItem: _selectedDayIndex);
    _monthController = FixedExtentScrollController(initialItem: _selectedMonthIndex);
    _yearController = FixedExtentScrollController(initialItem: _selectedYearIndex);
  }

  @override
  void dispose() {
    _dayController.dispose();
    _monthController.dispose();
    _yearController.dispose();
    super.dispose();
  }

  Widget _buildScrollColumn(List<String> items, FixedExtentScrollController controller, int selectedIndex, Function(int) onSelectedItemChanged) {
    return Expanded(
      child: ListWheelScrollView.useDelegate(
        controller: controller,
        itemExtent: 40,
        perspective: 0.005,
        diameterRatio: 1.2,
        physics: const FixedExtentScrollPhysics(),
        onSelectedItemChanged: onSelectedItemChanged,
        childDelegate: ListWheelChildBuilderDelegate(
          childCount: items.length,
          builder: (context, index) {
            final isSelected = index == selectedIndex;
            return Center(
              child: Text(
                items[index],
                style: GoogleFonts.poppins(
                  fontSize: isSelected ? 20 : 16,
                  fontWeight: isSelected ? FontWeight.w500 : FontWeight.normal,
                  color: isSelected ? Colors.black : Colors.grey.shade400,
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Material(
        color: Colors.transparent,
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30),
              topRight: Radius.circular(30),
            ),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Notification History',
                style: GoogleFonts.poppins(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 30),
              // Date Picker Simulation
              SizedBox(
                width: double.infinity,
                height: 150,
                child: Row(
                  children: [
                    _buildScrollColumn(_days, _dayController, _selectedDayIndex, (index) {
                      setState(() {
                        _selectedDayIndex = index;
                      });
                    }),
                    _buildScrollColumn(_months, _monthController, _selectedMonthIndex, (index) {
                      setState(() {
                        _selectedMonthIndex = index;
                      });
                    }),
                    _buildScrollColumn(_years, _yearController, _selectedYearIndex, (index) {
                      setState(() {
                        _selectedYearIndex = index;
                      });
                    }),
                  ],
                ),
              ),
              const SizedBox(height: 30),
              // Buttons
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: Container(
                      width: 100,
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      decoration: BoxDecoration(
                        color: const Color(0xFFA9C2D9),
                        borderRadius: BorderRadius.circular(15),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.1),
                            blurRadius: 8,
                            offset: const Offset(0, 4),
                          ),
                        ],
                      ),
                      child: Center(
                        child: Text(
                          'Cancel',
                          style: GoogleFonts.poppins(
                            color: Colors.white,
                            fontSize: 14,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 15),
                  GestureDetector(
                    onTap: () {
                      // Return the selected date
                      final selectedDate = DateTime(
                        int.parse(_years[_selectedYearIndex]),
                        _selectedMonthIndex + 1,
                        int.parse(_days[_selectedDayIndex]),
                      );
                      Navigator.pop(context, selectedDate);
                    },
                    child: Container(
                      width: 100,
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      decoration: BoxDecoration(
                        color: const Color(0xFF93A284),
                        borderRadius: BorderRadius.circular(15),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.1),
                            blurRadius: 8,
                            offset: const Offset(0, 4),
                          ),
                        ],
                      ),
                      child: Center(
                        child: Text(
                          'OK',
                          style: GoogleFonts.poppins(
                            color: Colors.white,
                            fontSize: 14,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class NotificationCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final String time;

  const NotificationCard({
    Key? key,
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.time,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: Colors.grey.shade400, width: 1.0),
      ),
      child: Stack(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 42,
                height: 42,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.black, width: 1.2),
                ),
                child: Icon(icon, color: Colors.black, size: 22),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: GoogleFonts.poppins(
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      subtitle,
                      style: GoogleFonts.poppins(
                        fontSize: 12,
                        color: Colors.grey.shade500,
                        height: 1.2,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Positioned(
            top: 0,
            right: 0,
            child: Text(
              time,
              style: GoogleFonts.poppins(
                fontSize: 12,
                color: Colors.grey.shade400,
              ),
            ),
          ),
        ],
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
      size.width * 0.4, size.height * 0.8,
      size.width, size.height * 0.5,
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