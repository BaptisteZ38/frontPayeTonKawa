import 'package:flutter/material.dart';
import 'package:front_paye_ton_kawa/modules/realiteAugmente/layouts/layoutAR.dart';

class IndexAR extends StatelessWidget {
  final String title;

  const IndexAR({required this.title, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const LayoutAR(),
              ),
            );
          },
          child: const Text("Local / Web Objects"),
        ),
      ),
    );
  }
}
