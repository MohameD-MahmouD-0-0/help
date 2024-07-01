import 'package:flutter/material.dart';
import 'package:zego_uikit_prebuilt_call/zego_uikit_prebuilt_call.dart';

class CallPage extends StatelessWidget {
  const CallPage({Key? key, required this.callID}) : super(key: key);
  final String callID;

  @override
  Widget build(BuildContext context) {
    return ZegoUIKitPrebuiltCall(
      appID: 952389766, // Fill in the appID that you get from ZEGOCLOUD Admin Console.
      appSign: '3c4f967b61f0637163056bae27b771d1428c6abffb3a90f17e42c88274f7e26a', // Fill in the appSign that you get from ZEGOCLOUD Admin Console.
      userID: 'user_id1',
      userName: 'user_name1',
      callID: callID,
      // You can also use groupVideo/groupVoice/oneOnOneVoice to make more types of calls.
      config: ZegoUIKitPrebuiltCallConfig.oneOnOneVideoCall(),
    );
  }
}
