import 'package:flutter/material.dart';
import 'package:marvelhq/constants.dart';

class BotaoPadrao extends StatelessWidget {
  BotaoPadrao({this.screenWidth, @required this.acao, this.insideTitle});
  final double screenWidth;
  final Function acao;
  final String insideTitle;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: screenWidth * 0.5,
      height: 40,
      decoration: BoxDecoration(
          color: kPrimaryColor, borderRadius: BorderRadius.circular(10)),
      child: FlatButton(
        onPressed: acao,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              insideTitle,
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            SizedBox(
              width: 10,
            ),
          ],
        ),
      ),
    );
  }
}
