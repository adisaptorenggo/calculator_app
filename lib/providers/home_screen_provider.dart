import 'package:flutter/material.dart';

class HomeScreenProvider extends ChangeNotifier{

  String _isPrimeText = '';
  bool _isPrime = true;

  final List<String> _primeNumbers = [];

  void checkPrime(int number){
    print('checking');
    for (var i = 2; i <= number / 2; ++i) {

      if (number % i == 0) {
        _isPrime = false;
        break;
      }
    }

    if (number != 1) {
      if(_isPrime)
        isPrimeFunc(number);
      else
        isNotPrimeFunc(number);
    }
  }

  void isPrimeFunc(int number){
    _isPrimeText = number.toString() + ' is Prime Number';

    addNumber(number);
  }


  void isNotPrimeFunc(int number){
    _isPrimeText = number.toString() + ' is NOT Prime Number';
  }

  void addNumber(int number) {
    _primeNumbers.add(number.toString());
    notifyListeners();
  }

  void removeNumbers() {
    _primeNumbers.clear();
    notifyListeners();
  }

  String get isPrimeText => _isPrimeText;
  List<String> get primeNumbers => _primeNumbers;


}