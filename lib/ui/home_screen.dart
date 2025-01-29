import 'package:absensi_app/ui/attend/attend_screen.dart';
import 'package:absensi_app/ui/attendance_history/attendance_history.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false, //mengunci tombol back
        onPopInvoked: (bool didPop){
        if (didPop){
          return;
        }
        _onWillPop(context);
        },
          child: Scaffold(
            backgroundColor: Colors.white,
            body: SafeArea(
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        margin: const EdgeInsets.all(10),
                        child: Expanded(
                            child: InkWell(
                              highlightColor: Colors.transparent,
                              splashColor: Colors.transparent,
                              onTap: () {
                                Navigator.push(context, MaterialPageRoute(builder: (context) => AttendScreen()));
                              },
                              child: const Column(
                                children: [
                                  Image(image: AssetImage('assets/images/ic_absen.png'),
                                    width: 100,
                                    height: 100,
                                  ),
                                  Text('Hadir')
                                ],
                              ),
                            )
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.all(10),
                        child: Expanded(
                            child: InkWell(
                              highlightColor: Colors.transparent,
                              splashColor: Colors.transparent,
                              onTap: () {
                                Navigator.push(context, MaterialPageRoute(builder: (context) => AttendScreen()));
                              },
                              child: const Column(
                                children: [
                                  Image(image: AssetImage('assets/images/ic_leave.png'),
                                    width: 100,
                                    height: 100,
                                  ),
                                  Text('Izin/Cuti)')
                                ],
                              ),
                            )
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.all(10),
                        child: Expanded(
                            child: InkWell(
                              highlightColor: Colors.transparent,
                              splashColor: Colors.transparent,
                              onTap: () {
                                Navigator.push(context, MaterialPageRoute(builder: (context) => AttandanceHistoryScreen()));
                              },
                              child: const Column(
                                children: [
                                  Image(image: AssetImage('assets/images/ic_history.png'),
                                    width: 100,
                                    height: 100,
                                  ),
                                  Text('History')
                                ],
                              ),
                            )
                        ),
                      )
                    ],
                  ),
                )
            ),
          )
      );
  }
}

Future<bool> _onWillPop(BuildContext context) async{
  return (await showDialog(
      context: context,
      builder: (context) => AlertDialog(
    title: const Text('INFO'),
    content: const Text('Apakah Anda yakin ingin keluar dari aplikasi?'),
    actions: [
      TextButton(
          onPressed: () => Navigator.of(context).pop(false),
          child: const Text('Batal')
      ),
      TextButton(
          onPressed: () => Navigator.of(context).pop(true),
          child: const Text('Keluar')
      ),
    ],
  )
  )
  ) ?? false;
}