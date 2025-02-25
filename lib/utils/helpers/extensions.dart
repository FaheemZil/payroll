import 'package:intl/intl.dart';

///Extension for datetime
extension DateTimeExtension<T> on DateTime {
  /// in format dd MMM yyyy example 18 Mar 2022

  String dmyString() {
    return DateFormat('dd MMM yyyy').format(this);
  }

  ///return 17-08-2023
  String dmyFormString() {
    return DateFormat('dd-MM-yyyy').format(this);
  }

  ///return 08-17-2023
  String mdyFormString() {
    return DateFormat('MM-dd-yyyy').format(this);
  }

  ///return '2023-08-16 for api post data
  String ymdString() {
    return DateFormat('yyyy-MM-dd').format(this);
  }
}

extension StringExtension on String {
  String getShortName() {
    final List<String> words = trim().split(' ');

    if (words.isEmpty || words.first == '') {
      return '';
    } else if (words.length == 1) {
      return words.first[0].toUpperCase();
    } else {
      return '${words.first[0].toUpperCase()}${words.last[0].toUpperCase()}';
    }
    //If it is  required to get first latter for each word then uncommit
    //below code
    /* 
    String initials = '';
    for (var word in words) {
      if (word.isNotEmpty) {
        initials += word[0].toUpperCase();
      }
    }

    return initials; */
  }

  String getFirstName() {
    final List<String> words = split(' ');
    if (words.length > 1) {
      words.removeLast();
    }
    return words.join(' ');
  }

  String capitalizeFirstLetter() {
    if (this == '') return '';
    return this[0].toUpperCase() + substring(1).toLowerCase();
  }

  String lastChars(int n) =>
      length > n ? substring(length - n) : substring(length);

  /// return *******1234
  String maskedBankAccount() {
    final visibleDigits = length >= 4 ? substring(length - 4) : this;
    final maskedPart = '*' * (length - visibleDigits.length);
    return '$maskedPart$visibleDigits';
  }

  String toWordCase() {
    if (isEmpty) return '';
    // TODO(sarad): look behind not supported in safari yet
    final String spaced = replaceAll(RegExp('(?<![A-Z_])(?=[A-Z])|_'), ' ');
    return spaced[0].toUpperCase() + spaced.substring(1);
  }

  /// Parse the string into a DateTime and to string
  String toDmyDate() {
    return DateFormat('MM/dd/yyyy').parse(this).dmyFormString();
  }

  String captilizeWord() =>
      split(' ').map((word) => word.capitalizeFirstLetter()).join(' ');

  // double toDouble() {
  //   final value = double.tryParse(StringUtils().numbersWithDecimals(this));
  //   return value ?? 0;
  // }
}
