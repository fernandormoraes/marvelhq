import 'package:flutter/material.dart';
import 'package:marvelhq/constants.dart';

// ignore: non_constant_identifier_names
Column Header() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.stretch,
    children: [
      RichText(
        text: TextSpan(
            text: 'Quase lá',
            style: TextStyle(
                color: Colors.black, fontWeight: FontWeight.bold, fontSize: 30),
            children: <TextSpan>[
              TextSpan(text: '!', style: TextStyle(color: kPrimaryColor))
            ]),
      ),
      Text('Apenas preencha os dados abaixo')
    ],
  );
}
