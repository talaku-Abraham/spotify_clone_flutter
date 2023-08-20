import 'dart:io';

import 'package:desktop_window/desktop_window.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:spotify_clone/theme.dart';

import 'widget/widgets.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  if (!kIsWeb && (Platform.isMacOS || Platform.isLinux || Platform.isWindows)) {
    DesktopWindow.setMinWindowSize(const Size(600, 800));
  }

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Spotify UI',
      debugShowCheckedModeBanner: false,
      theme: MyAppTheme.darkTheme,
      // darkTheme: ,
      home: const Shell(),
    );
  }
}

class Shell extends StatelessWidget {
  const Shell({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const Expanded(
            child: Row(
              children: [
                SideMenu(),
                // Expanded(
                //   child: Container(
                //     color: Colors.black,
                //   ),
                // ),
              ],
            ),
          ),
          Container(
            color: Theme.of(context).primaryColor,
            height: 84,
            width: double.infinity,
            child: const Text('talexx'),
          )
        ],
      ),
    );
  }
}
