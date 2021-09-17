import 'dart:math';

import 'package:flutter/material.dart';
import 'coin_data.dart';
import 'package:flutter/cupertino.dart';
import 'dart:io' show Platform;

class PriceScreen extends StatefulWidget {
  @override
  _PriceScreenState createState() => _PriceScreenState();
}

class _PriceScreenState extends State<PriceScreen> {
  String selectedCurrency = 'USD';

  DropdownButton<String> getDropDownButton() {
    List<DropdownMenuItem<String>> dropDownItems = [];
    for (int i = 0; i < currenciesList.length; i++) {
      String currency = currenciesList[i];
      var result = DropdownMenuItem(
        child: Text(currency),
        value: currency,
      );
      dropDownItems.add(result);
    }
    return DropdownButton(
      items: dropDownItems,
      value: selectedCurrency,
      onChanged: (value) {
        setState(() {
          selectedCurrency = value.toString();
          getData();
        });
      },
    );
  }

  CupertinoPicker getPicker() {
    List<Text> pickerItem = [];
    for (String currency in currenciesList) {
      pickerItem.add(Text(
        currency,
        style: TextStyle(color: Colors.white),
      ));
    }
    return CupertinoPicker(
      backgroundColor: Colors.lightBlue,
      itemExtent: 32,
      onSelectedItemChanged: (selectedIndex) {
        print(selectedIndex);
        setState(() {
          selectedCurrency = currenciesList[selectedIndex];
          getData();
        });
      },
      children: pickerItem,
    );
  }

  Widget getplatoformPicker() {
    if (Platform.isAndroid) {
      return getDropDownButton();
    }
    return getPicker();
  }

  String bitcoinvalue = '?';
  void getData() async {
    try {
      CoinData a = CoinData();
      double data = await a.getcoindata(selectedCurrency);
      setState(() {
        bitcoinvalue = data.toStringAsFixed(0);
        print(bitcoinvalue);
      });
    } catch (e) {
      print(e);
    }
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('🤑 Coin Ticker'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.fromLTRB(18.0, 18.0, 18.0, 0),
            child: Card(
              color: Colors.lightBlueAccent,
              elevation: 5.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 28.0),
                child: Text(
                  '1 BTC = $bitcoinvalue $selectedCurrency',
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
            color: Colors.lightBlue,
            child: getplatoformPicker(),
          ),
        ],
      ),
    );
  }
}
