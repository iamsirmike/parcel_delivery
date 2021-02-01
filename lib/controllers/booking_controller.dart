import 'package:flutter/material.dart';

class BookingController {
  static final GlobalKey<FormState> bookFormKey = GlobalKey<FormState>();
  String _recepientname;
  String _phone;
  String _itemsname;
  String _description;

  //getters
  String get recepientname => _recepientname;
  String get phone => _phone;
  String get itemsname => _itemsname;
  String get description => _description;

  //setters
  set setRecepientName(String recepientName) {
    if (recepientName != null) {
      _recepientname = recepientName;
    }
  }

  set setPhone(String phone) {
    if (phone != null) {
      _phone = phone;
    }
  }

  set setItemsName(String itemsName) {
    if (itemsname != null) {
      _itemsname = itemsName;
    }
  }

  set setDescription(String description) {
    if (description != null) {
      _description = description;
    }
  }

  book() async {
    if (!bookFormKey.currentState.validate()) {
      return;
    }
    bookFormKey.currentState.save();
    try {
      print('Validated and come be saved');
      //TODO: Save booking to database
    } catch (e) {
      throw e;
    }
  }
}
