import 'package:flutter/material.dart';

import 'coeur_core/theme.dart';
import 'modules/domaura_home/screen_home.dart';

void main() {
  runApp(const DomauraApp());
}

class DomauraApp extends StatelessWidget {
  const DomauraApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Domaura',
      theme: DomauraTheme.light(),
      home: const DomauraHomeShell(),
    );
  }
}

