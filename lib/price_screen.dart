import 'dart:io' show Platform;

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';

import './coin_data.dart';

class PriceScreen extends StatefulWidget {
  @override
  _PriceScreenState createState() => _PriceScreenState();
}

class _PriceScreenState extends State<PriceScreen> {
  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIOverlays([]);
  }

  String currencySelected = 'KZT';

  DropdownButton<String> getDropdownButton() {
    List<DropdownMenuItem<String>> dropdownItems = [];

    for (String currency in currenciesList) {
      dropdownItems.add(
        DropdownMenuItem(
          child: Center(child: Text(currency)),
          value: currency,
        ),
      );
    }

    return DropdownButton<String>(
      value: currencySelected,
      elevation: 4,
      items: dropdownItems,
      onChanged: (value) {
        setState(() {
          currencySelected = value;
        });
      },
    );
  }

  CupertinoPicker getPicker() {
    List<Widget> pickerItems = [];

    for (String currency in currenciesList) {
      pickerItems.add(Center(child: Text(currency)));
    }

    return CupertinoPicker(
        backgroundColor: Color(0xFF474753),
        itemExtent: 36.0,
        onSelectedItemChanged: (int value) {
          setState(() {
            currencySelected = currenciesList[value];
          });
        },
        children: pickerItems);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: SizedBox(
          child: Align(
            child: SvgPicture.asset(
              'assets/blockchain_svg.svg',
              semanticsLabel: 'Coin Ticker',
              height: 24.0,
              width: 24.0,
              color: Colors.white,
            ),
          ),
        ),
        title: Text('Coin Ticker'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.fromLTRB(18.0, 18.0, 18.0, 0),
            child: Card(
              color: Color(0xFF474753),
              elevation: 5.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 28.0),
                child: Text(
                  '1 BTC = ? USD',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
          Container(
            height: 150.0,
            alignment: Alignment.center,
            padding: EdgeInsets.only(bottom: 30.0),
            color: Color(0xFF474753),
            child: Theme(
              data: Theme.of(context)
                  .copyWith(canvasColor: Theme.of(context).primaryColor),
              child: DropdownButtonHideUnderline(
                child: Platform.isAndroid ? getDropdownButton() : getPicker(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
