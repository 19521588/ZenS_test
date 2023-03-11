import 'package:flutter/material.dart';
import './color.dart';

class JokeScreen extends StatefulWidget {
  const JokeScreen({super.key});

  @override
  State<JokeScreen> createState() => _JokeScreenState();
}

class _JokeScreenState extends State<JokeScreen> {
  List<String> jokes = [
    "A child asked his father, \"How were people born?\" So his father said, \"Adam and Eve made babies, then their babies became adults and made babies, and so on.\" The child then went to his mother, asked her the same question and she told him, \"We were monkeys then we evolved to become like we are now.\" The child ran back to his father and said, \"You lied to me!\" His father replied, \"No, your mom was talking about her side of the family.\"",
    "Teacher: \"Kids,what does the chicken give you?\" Student: \"Meat!\" Teacher: \"Very good! Now what does the pig give you?\" Student: \"Bacon!\" Teacher: \"Great! And what does the fat cow give you?\" Student: \"Homework!\"",
    "The teacher asked Jimmy, \"Why is your cat at school today Jimmy?\" Jimmy replied crying, \"Because I heard my daddy tell my mommy, 'I am going to eat that pussy once Jimmy leaves for school today!'\"",
    "A housewife, an accountant and a lawyer were asked \"How much is 2+2?\" The housewife replies: \"Four!\". The accountant says: \"I think it's either 3 or 4. Let me run those figures through my spreadsheet one more time.\" The lawyer pulls the drapes, dims the lights and asks in a hushed voice, \"How much do you want it to be?\""
  ];
  int index = 0;

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: AppColors.primaryWhite,
      appBar: AppBar(
        toolbarHeight: 65,
        elevation: 0,
        backgroundColor: AppColors.primaryWhite,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: 65,
              width: 65,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/images/logo.png'),
                      fit: BoxFit.cover)),
            ),
            Row(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    textStyle(
                        'Handicrafted by', 14, AppColors.primaryGray, false),
                    textStyle('Jim HLS', 14, AppColors.primaryBlack, false),
                  ],
                ),
                Container(
                  padding: EdgeInsets.only(left: width * 0.025),
                  child: const CircleAvatar(
                    radius: 20,
                    backgroundImage: AssetImage('assets/images/avt.jpg'),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
      body: CustomScrollView(slivers: [
        SliverFillRemaining(
          hasScrollBody: false,
          child: Column(
            children: [
              Container(
                  padding: EdgeInsets.symmetric(vertical: height * 0.05),
                  width: width,
                  color: Colors.green,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      textStyle('A joke a day keeps the doctor away', 20,
                          AppColors.primaryWhite, false),
                      Padding(
                        padding: EdgeInsets.only(top: height * 0.04),
                        child: textStyle(
                            'if you joke wrong way, your teeth have to pay. (Serious)',
                            14,
                            AppColors.primaryWhite,
                            false),
                      ),
                    ],
                  )),
              Container(
                padding: EdgeInsets.all(height * 0.04),
                child: textStyle(
                    index < jokes.length 
                        ? jokes[index]
                        : "That's all the jokes for today! Come back another day!",
                    14,
                    AppColors.primaryGray,
                    false),
              ),
              Expanded(
                  child: Align(
                alignment: FractionalOffset.bottomCenter,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      width: width * 0.55,
                      padding: EdgeInsets.only(bottom: height * 0.04),
                      decoration: const BoxDecoration(
                          border: Border(
                        top: BorderSide(
                          color: AppColors.primaryGray2,
                          width: 0.75,
                        ),
                      )),
                    ),
                    Container(
                      padding: EdgeInsets.only(bottom: height * 0.06),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          button('This is Funny!', true, width, height),
                          button('This is not Funny.', false, width, height)
                        ],
                      ),
                    ),
                    Container(
                        padding: EdgeInsets.symmetric(
                            vertical: height * 0.02, horizontal: height * 0.03),
                        decoration: const BoxDecoration(
                            border: Border.symmetric(
                          horizontal: BorderSide(
                            color: AppColors.primaryGray2,
                            width: 1.0,
                          ),
                        )),
                        child: Column(
                          children: [
                            textStyle(
                                "This appis created as part of HLsolutions program. The materials contained on this website are provided for general information only and do not constitute any form of advice. HLS assumes no responsibility for the accuracy of any particular statement and accepts no liability for any loss or damage which may arise from reliance on the information contained on this site.",
                                14,
                                AppColors.primaryGray,
                                true),
                            Container(
                              padding: EdgeInsets.only(top: height * 0.01),
                              child: textStyle('Copyright 2021 HLS', 14,
                                  AppColors.darkSilver, false),
                            ),
                          ],
                        )),
                  ],
                ),
              )),
            ],
          ),
        ),
      ]),
    );
  }

  Widget button(content, isFunny, width, height) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(0),
        ),
        minimumSize: Size(width * 0.35, height * 0.07),
        primary: isFunny
            ? AppColors.primaryBlue
            : AppColors.primaryGreen, // background
        onPrimary: AppColors.primaryWhite, // foreground
      ),
      onPressed: () {
        setState(() {
          if (index < jokes.length) {
            ++index;
          }
        });
      },
      child: Text(content, style: TextStyle(fontSize: 14)),
    );
  }

  Widget textStyle(text, double fontSize, color, isAlignCenter) {
    return Text(
      text,
      style: Theme.of(context).textTheme.subtitle1?.copyWith(
          color: color, fontSize: fontSize, fontWeight: FontWeight.w400),
      textAlign: isAlignCenter ? TextAlign.center : TextAlign.left,
    );
  }
}
