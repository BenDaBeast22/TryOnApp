import 'package:flutter/material.dart';
import 'package:try_on_app/helpers/custom_text.dart';

class ScanPage extends StatelessWidget {
  const ScanPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const HeaderText(text: "Scan Page"),
      ),
    );
  }
}
