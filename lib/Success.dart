import 'dart:async';

import 'package:flutter/material.dart';

import 'notificationssss.dart';

class SuccessScreen extends StatefulWidget {
  const SuccessScreen({super.key});

  @override
  State<SuccessScreen> createState() => _SuccessScreenState();
}

class _SuccessScreenState extends State<SuccessScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(milliseconds: 2200), () {
      Navigator.push(context, MaterialPageRoute(builder: (context) {
        return NotificationPage();
      }));
    });
  }

  Widget build(BuildContext context) {
    return Material(
      child: Image.asset('lib/assets/login_checkmark.png'),
        );
  }
}
