import 'dart:typed_data';
import 'package:flutter/material.dart';

class ImageViewer extends StatelessWidget {
  final Uint8List imageBytes;

  ImageViewer({required this.imageBytes});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Image.memory(imageBytes),
    );
  }
}