import 'package:flutter/material.dart';
import 'package:wordsnap/core/widgets/text_widget.dart';

class CameraActiveScreen extends StatefulWidget {
  const CameraActiveScreen({super.key});

  @override
  State<CameraActiveScreen> createState() => _CameraActiveScreenState();
}

class _CameraActiveScreenState extends State<CameraActiveScreen> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
      ),
      body: TextWidget('Camera'),
    );
  }
}
