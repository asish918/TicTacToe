import 'package:flutter/material.dart';

import '../widgets/custom_button.dart';
import '../widgets/custom_text.dart';
import '../widgets/custom_text_field.dart';

class JoinRoomScreen extends StatefulWidget {
  static String routeName = '/joinRoom';
  const JoinRoomScreen({Key? key}) : super(key: key);

  @override
  State<JoinRoomScreen> createState() => _JoinRoomScreenState();
}

class _JoinRoomScreenState extends State<JoinRoomScreen> {
  final TextEditingController textEditingController = TextEditingController();
  final TextEditingController gameIDController = TextEditingController();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    textEditingController.dispose();
    gameIDController.dispose();
  }


  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CustomText(
                shadows: [Shadow(blurRadius: 40, color: Colors.blue)],
                text: "Join Room",
                fontSize: 70),
            SizedBox(height: size.height*0.08,),
            CustomTextField(controller: textEditingController, text: "Enter your nickname"),
            SizedBox(height: 20,),
            CustomTextField(controller: gameIDController, text: "Enter GameID"),
            SizedBox(height: size.height*0.045,),
            CustomButton(onTap: (){}, text: "Join")
          ],
        ),
      ),
    );
  }
}
