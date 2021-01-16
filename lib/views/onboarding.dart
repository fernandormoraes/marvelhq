import 'package:flutter/material.dart';
import 'package:marvelhq/constants.dart';
import 'package:marvelhq/views/entrar/signin_screen.dart';
import 'package:flutter_svg/flutter_svg.dart';


import 'componentes/botaoPadrao.dart';

class OnBoardingScreen extends StatefulWidget {
  static String routeName = '/onboarding';

  @override
  _OnBoardingScreenState createState() => _OnBoardingScreenState();
}

int currentPage = 0;
GlobalKey<ScaffoldState> scaffoldState = GlobalKey<ScaffoldState>();

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    List<DisplayItem> displayList = [
      DisplayItem(
        textMessage: 'Marvel HQ Library',
        imagePath: 'assets/images/avengers.svg',
      ),
      DisplayItem(
        textMessage: 'Welcome to the Marvel Universe!',
        imagePath: 'assets/images/shield.svg',
      ),
      DisplayItem(
        textMessage: 'All HQs in your hand!',
        imagePath: 'assets/images/avengers.svg',
      )
    ];

    return Scaffold(
      key: scaffoldState,
      backgroundColor: Colors.white,
      body: Column(
        children: [
          SafeArea(
            child: Column(
              children: [
                //Image.asset('assets/images/logo_preto.png'),
                Container(
                  child: Center(
                    child: PageView.builder(
                        onPageChanged: (value) {
                          setState(() {
                            currentPage = value;
                          });
                        },
                        itemCount: displayList.length,
                        itemBuilder: (context, index) => displayList[index]),
                  ),
                  width: double.infinity,
                  height: screenHeight * 0.40,
                  // color: Colors.green,
                ),
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [buildDot(0), buildDot(1), buildDot(2)],
                    ),
                    SizedBox(
                      height: screenHeight * 0.15,
                    ),
                    BotaoPadrao(
                        screenWidth: screenWidth,
                        insideTitle: 'Keep going',
                        acao: () {
                          Navigator.pushNamed(context, SignInScreen.routeName);
                        }),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: RichText(
                        text: TextSpan(
                            text: 'Lost your password? ',
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w200),
                            children: [
                              TextSpan(
                                  text: 'Remember right here!',
                                  style: TextStyle(fontWeight: FontWeight.bold))
                            ]),
                      ),
                    ),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

AnimatedContainer buildDot(int index) {
  return AnimatedContainer(
    duration: Duration(milliseconds: 300),
    curve: Curves.easeIn,
    margin: EdgeInsets.only(right: 7),
    height: 6,
    width: currentPage == index ? 20 : 6,
    decoration: BoxDecoration(
        color: currentPage == index ? kPrimaryColor : Colors.grey,
        borderRadius: BorderRadius.circular(10)),
  );
}

class DisplayItem extends StatelessWidget {
  const DisplayItem(
      {Key key, @required this.textMessage, @required this.imagePath})
      : super(key: key);

  final String textMessage;
  final String imagePath;

  @override
  Widget build(BuildContext context) {
    final double sceenWidth = MediaQuery.of(context).size.width;
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Text(
          textMessage,
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
