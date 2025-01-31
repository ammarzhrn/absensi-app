import 'package:absensi_app/ui/absen/absen_screen.dart';
import 'package:absensi_app/ui/attend/attend_screen.dart';
import 'package:absensi_app/ui/attendance_history/attendance_history.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false, // Mengunci tombol back
      onPopInvoked: (bool didPop) {
        if (didPop) {
          return;
        }
        _onWillPop(context);
      },
      child: Scaffold(
        backgroundColor: Colors.grey[900],
        body: SafeArea(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildMenuCard(
                  context,
                  icon: 'assets/images/ic_absen.png',
                  label: 'Hadir',
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => AttendScreen()),
                    );
                  },
                ),
                _buildMenuCard(
                  context,
                  icon: 'assets/images/ic_leave.png',
                  label: 'Izin/Cuti',
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => AbsentScreen()),
                    );
                  },
                ),
                _buildMenuCard(
                  context,
                  icon: 'assets/images/ic_history.png',
                  label: 'History',
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => AttandanceHistoryScreen()),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildMenuCard(
      BuildContext context, {
        required String icon,
        required String label,
        required VoidCallback onTap,
      }) {
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      margin: const EdgeInsets.all(10),
      child: InkWell(
        borderRadius: BorderRadius.circular(15),
        onTap: onTap,
        splashColor: Colors.blue.withOpacity(0.2),
        highlightColor: Colors.transparent,
        child: Container(
          width: 150,
          height: 150,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            gradient: LinearGradient(
              colors: [Colors.blue.shade50, Colors.white],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image(
                image: AssetImage(icon),
                width: 80,
                height: 80,
              ),
              const SizedBox(height: 10),
              Text(
                label,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey[900],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Future<bool> _onWillPop(BuildContext context) async {
  return (await showDialog(
    context: context,
    builder: (context) => AlertDialog(
      title: const Text('INFO'),
      content: const Text('Apakah Anda yakin ingin keluar dari aplikasi?'),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(false),
          child: const Text('Batal'),
        ),
        TextButton(
          onPressed: () => Navigator.of(context).pop(true),
          child: const Text('Keluar'),
        ),
      ],
    ),
  )) ?? false;
}