import 'package:agora_uikit/agora_uikit.dart';
import 'package:all_things_green/constants/app_constants.dart';
import 'package:flutter/material.dart';

class VideoCallScreen extends StatefulWidget {
  const VideoCallScreen({Key? key}) : super(key: key);

  @override
  State<VideoCallScreen> createState() => _VideoCallScreenState();
}

class _VideoCallScreenState extends State<VideoCallScreen> {

  final AgoraClient _client = AgoraClient(
    agoraConnectionData: AgoraConnectionData(
      appId: AppConstants.appID,
      channelName: 'misfits',
      tempToken: '007eJxTYDgRL9yxlM9Y4UIRw+/nZ27rdqyOnT/ru7bqiZmyOdtt3sopMBibpBoYJ6ekpSRZWJqYmhtZmCSZpaQkGZkaW6YaJRukCjm/SG4IZGSo3sTPysgAgSA+O0NuZnFaZkkxAwMArO0gfQ==',
    ),
  );

  @override
  void initState() {
    super.initState();
    _initAgora();
  }

  Future<void> _initAgora() async {
    await _client.initialize();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(children: [
          AgoraVideoViewer(client: _client, 
            layoutType: Layout.floating,
            showNumberOfUsers: true,
          ),
          AgoraVideoButtons(client: _client, enabledButtons: [
            BuiltInButtons.toggleCamera,
            BuiltInButtons.callEnd,
            BuiltInButtons.toggleMic,
          ],),
    
        ],)
      ),
    );
  }
}