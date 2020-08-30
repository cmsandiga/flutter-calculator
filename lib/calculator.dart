class Calculation {
  List<String> a = [];

  void add(String input) {
    RegExp regExp = RegExp("[+\\-x%]");

    if (a.isEmpty) {
      if (!regExp.hasMatch(input)) {
        a.add(input);
      }
    } else if (regExp.hasMatch(a.last)) {
      if (!RegExp("[+\\-x%].").hasMatch(input)) {
        a.add(input);
      }
    } else {
      if (regExp.hasMatch(input)) {
        if (RegExp(".").hasMatch(a.last)) a.last += ".0";
        a.add(input);
      } else {
        a.last += input;
      }
    }
  }

  String getString() {
    String result = "";
    a.forEach((element) {
      result += element;
    });
    return result;
  }

  void deleteAll() => a = [];

  void deleteOne() {
    if (a.length > 0) {
      if (a.last.length > 1) {
        a.last = a.last.substring(0, a.last.length - 1);
      } else {
        a.removeLast();
      }
    }
  }

  double getResult() {
    for (int i = 0; i < a.length; i++) {
      if (a[i] == "x") {
        a[i - 1] = "${double.parse(a[i - 1]) * double.parse(a[i + 1])}";
        a.removeAt(i);
        a.removeAt(i);
        i--;
      } else if (a[i] == "/") {
        a[i - 1] = "${double.parse(a[i - 1]) / double.parse(a[i + 1])}";
        a.removeAt(i);
        a.removeAt(i);
        i--;
      }
    }

    for (int i = 0; i < a.length; i++) {
      if (a[i] == "+") {
        a[i - 1] = "${double.parse(a[i - 1]) + double.parse(a[i + 1])}";
        a.removeAt(i);
        a.removeAt(i);
        i--;
      } else if (a[i] == "-") {
        a[i - 1] = "${double.parse(a[i - 1]) - double.parse(a[i + 1])}";
        a.removeAt(i);
        a.removeAt(i);
        i--;
      }
    }
    return double.parse(a[0]);
  }
}
