import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mobile_flutter/model.dart';
import 'package:mobile_flutter/voted_store.dart';

import './color.dart';

class JokeScreen extends StatefulWidget {
  const JokeScreen({super.key, required this.storage});

  final VotedStorage storage;

  @override
  State<JokeScreen> createState() => _JokeScreenState();
}

class _JokeScreenState extends State<JokeScreen> {
  int index = 0;

  List<String> jokes = [];

  List<JokeDataModel> item = [];

  @override
  void initState() {
    super.initState();
    // Call the readJson method when the app starts
    widget.storage.readFile().then((value) {
      setState(() {
        index = value.length;
        jokes = value;
      });
    });
  }

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
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                    backgroundImage: AssetImage('assets/images/avt.png'),
                    foregroundColor: AppColors.primaryWhite,
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
              FutureBuilder(
                future: ReadJsonData(),
                builder: ((context, data) {
                  if (data.hasError) {
                    return Center(child: Text("${data.error}"));
                  } else {
                    if (data.hasData) {
                      item = data.data as List<JokeDataModel>;
                      return Container(
                        padding: EdgeInsets.all(height * 0.04),
                        child: textStyle(
                            index < item.length
                                ? item[index].joke.toString()
                                : "That's all the jokes for today! Come back another day!",
                            16,
                            AppColors.primaryBlack1,
                            false),
                      );
                    } else {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                  }
                }),
              ),
              Expanded(
                  child: Align(
                alignment: FractionalOffset.bottomCenter,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      padding: EdgeInsets.only(bottom: height * 0.06),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          button('This is Funny!', true),
                          button('This is not funny.', false)
                        ],
                      ),
                    ),
                    Container(
                        padding: EdgeInsets.only(
                            top: height * 0.01),
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
                                12,
                                AppColors.primaryGray,
                                true),
                            Container(
                              padding: EdgeInsets.only(top: height * 0.01),
                              child: textStyle('Copyright 2021 HLS', 14,
                                  AppColors.primaryBlack1, false),
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

  Widget button(content, isFunny) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(0),
        ),
        minimumSize: const Size(140, 40),
        primary: isFunny
            ? AppColors.primaryBlue
            : AppColors.primaryGreen, // background
        onPrimary: AppColors.primaryWhite, // foreground
      ),
      onPressed: () {
        setState(() {
          if (index < item.length) {
            ++index;
            isFunny ? jokes.add("Funny") : jokes.add("notFunny");
            widget.storage.writeFile(jokes);
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

  Future<List<JokeDataModel>> ReadJsonData() async {
    //read json file
    final jsondata = await rootBundle.loadString('assets/json/jokes.json');
    //decode json data as list
    final list = json.decode(jsondata) as List<dynamic>;

    //map json and initialize using DataModel
    return list.map((e) => JokeDataModel.fromJson(e)).toList();
  }
}
