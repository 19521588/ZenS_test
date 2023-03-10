import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class JokeScreen extends StatefulWidget {
  const JokeScreen({super.key});

  @override
  State<JokeScreen> createState() => _JokeScreenState();
}

class _JokeScreenState extends State<JokeScreen> {
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: false,
        elevation: 0,
        backgroundColor: Colors.white,
        leading: Container(
          height: 80,
          width: 80,
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/images/logo.jpg'),
                  fit: BoxFit.cover)),
        ),
        actions: const [
          CircleAvatar(
            radius: 45,
            backgroundImage: AssetImage('assets/images/avt.jpg'),
          ),
        ],
      ),
      body: Column(
        children: [
          Container(
              padding: EdgeInsets.symmetric(vertical: height * 0.05),
              width: width,
              color: Colors.green,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  textStyle(
                      'A joke a day keeps the doctor away', 20, Colors.white),
                  Padding(
                    padding: EdgeInsets.only(top: height * 0.04),
                    child: textStyle(
                        'if you joke wrong way, your teeth have to pay. (Serious)',
                        14,
                        Colors.white),
                  ),
                ],
              )),
          Container(
            padding: EdgeInsets.all(height * 0.04),
            child: textStyle(
                'A child asked his father, "How were people born?" So his father said, "Adam and Eve made babies, then their babies became adults and made babies, and so on."The child then went to his mother, asked her the same question and she told him, "We were monkeys then we evolved to become like we are now." The child ran back to his father and said, "You lied to me!" His father replied, "No, your mom was talking about her side of the family."',
                14,
                Colors.grey),
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              button('This is Funny!', true, width, height),
              button('This is not Funny!', false, width, height)
            ],
          ),
          Container(
            padding: EdgeInsets.symmetric(vertical: height * 0.03),
            decoration: const BoxDecoration(
                border: Border.symmetric(
                    horizontal: BorderSide(
              color: Colors.black,
              width: 1.0,
            ))),
            child: Column(
              children: [
                textStyle(
                    "This appis created as part of HLsolutions program. The materials contained on this website are provided for general information only and do not constitute any form of advice. HLS assumes no responsibility for the accuracy of any particular statement and accepts no liability for any loss or damage which may arise from reliance on the information contained on this site.",14,Colors.grey),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget button(content, isFunny, width, height) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        minimumSize: Size(width * 0.35, height * 0.05),
        primary: isFunny ? Colors.blue : Colors.green, // background
        onPrimary: Colors.white, // foreground
      ),
      onPressed: () {},
      child: Text(content, style: TextStyle(fontSize: 14)),
    );
  }

  Widget textStyle(text, double fontSize, color) {
    return Text(
      text,
      style: Theme.of(context)
          .textTheme
          .subtitle1
          ?.copyWith(color: color, fontSize: fontSize),
    );
  }
}
