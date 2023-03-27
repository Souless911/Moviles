import 'package:flutter/material.dart';

class TipTimeProvider with ChangeNotifier {
  var costController = TextEditingController();
  bool cerrado = false;
  int? _selectedRadio = null;
  int? get getSelectedRadio => _selectedRadio;
  var radioGroupValues = {
    20: "Amazing 20%",
    18: "Good 18%",
    15: "Ok 15%",
  };
  var total;

  // bool get getIsSelected => _isSelected;

  void tipcalculation() {
    //todo: fasdf
    try {
      if (_selectedRadio != null) {
        total = double.parse(costController.text) +
            (double.parse(costController.text) * (_selectedRadio! / 100));

        if (cerrado) {
          total = total.ceil();
        }
        if (total == total.toInt()) {
        } else {
          String faketotal = total.toStringAsFixed(2);
          total = faketotal;
        }
      } else {
        total = costController.text;
      }
    } catch (e) {
      print("Error ");
      total = "Error";
    }
    notifyListeners();
  }

  void setIsSelected(bool switchValue) {
    cerrado = switchValue;
    notifyListeners();
  }

  void setSelectedRadio(int? radioValue) {
    _selectedRadio = radioValue;
    notifyListeners();
  }
}
