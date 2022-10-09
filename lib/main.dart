import 'package:flutter/material.dart';
import 'package:tictactoe/screens/create_room_screen.dart';
import 'package:tictactoe/screens/game_screen.dart';
import 'package:tictactoe/screens/join_room_screen.dart';
import 'package:tictactoe/screens/main_menu_screen.dart';
import 'package:tictactoe/utils/colors.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      routes: {
        MainMenuScreen.routeName: (context) => const MainMenuScreen(),
        CreateRoomScreen.routeName: (context) => const CreateRoomScreen(),
        JoinRoomScreen.routeName: (context) => const JoinRoomScreen(),
        GameScreen.routeName: (context) => const GameScreen(),
      },
      theme: ThemeData.dark().copyWith(scaffoldBackgroundColor: bgColor),
      initialRoute: MainMenuScreen.routeName,
    );
  }
}
