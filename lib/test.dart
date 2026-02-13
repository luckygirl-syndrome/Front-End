import 'package:flutter/material.dart';
import 'core/widgets/link_input_popup.dart';

void main() => runApp(const MaterialApp(home: TestScreen()));

class TestScreen extends StatelessWidget {
  const TestScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300], // 팝업 대비를 위해 어두운 배경
      body: Center(
        child: ElevatedButton(
          onPressed: () => showDialog(
            context: context,
            builder: (context) => const LinkInputPopup(),
          ),
          child: const Text('팝업 띄우기'),
        ),
      ),
    );
  }
}