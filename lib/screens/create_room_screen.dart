import 'package:flutter/material.dart';
import 'package:tictactoe/resources/socket_methods.dart';
import 'package:tictactoe/widgets/custom_button.dart';
import 'package:tictactoe/widgets/custom_text.dart';
import 'package:tictactoe/widgets/custom_text_field.dart';

class CreateRoomScreen extends StatefulWidget {
  static String routeName = '/createRoom';
  const CreateRoomScreen({Key? key}) : super(key: key);

  @override
  State<CreateRoomScreen> createState() => _CreateRoomScreenState();
}

class _CreateRoomScreenState extends State<CreateRoomScreen> {
  final TextEditingController textEditingController = TextEditingController();
  final SocketMethods _socketMethods = SocketMethods();

  @override
  void initState() {
    super.initState();
    _socketMethods.createRoomSuccessListener(context);
  }

  @override
  void dispose() {
    super.dispose();
    textEditingController.dispose();
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
                text: "Create Room",
                fontSize: 70),
            SizedBox(height: size.height*0.08,),
            CustomTextField(controller: textEditingController, text: "Enter your nickname"),
            SizedBox(height: size.height*0.045,),
            CustomButton(onTap: () => _socketMethods.createRoom(textEditingController.text), text: "Create")
          ],
        ),
      ),
    );
  }
}
