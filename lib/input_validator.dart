

class InputValidator {

  String validateName(String? value) {
    if(value!.isEmpty){
      return 'Enter First Name';
    }
    String pattern =
        r"^([a-zA-Z]{1,}[a-zA-z]{1,}'?-?[a-zA-Z]{1,}?([a-zA-Z]{0,})?)";
    RegExp regex = RegExp(pattern);
    if (!regex.hasMatch(value)) {
      return 'Please enter valid first name';
    } else {
      return 'success';
    }
  }
  String validateFullName(String value) {
    if(value.isEmpty){
      return 'Enter FUll Name';
    }
    String pattern =
        r"^([a-zA-Z]{2,}[a-zA-z]{1,}'?-?[a-zA-Z]{2,}?([a-zA-Z]{1,})?)";
    RegExp regex = RegExp(pattern);
    if (!regex.hasMatch(value)) {
      return 'Please enter valid full name';
    } else {
      return 'success';
    }
  }
  String validateLastName(String value) {
    if(value.isEmpty){
      return 'Enter Last Name';
    }
    String pattern =
        r"^([a-zA-Z]{1,}[a-zA-z]{1,}'?-?[a-zA-Z]{1,}?([a-zA-Z]{0,})?)";
    RegExp regex = RegExp(pattern);
    if (!regex.hasMatch(value)) {
      return 'Please enter valid last name';
    } else {
      return 'success';
    }
  }

  String validateMobile(String value) {
    if (value.isEmpty) {
      return 'Enter Phone Number';
    }
    String pattern = r'^(\+\d{1,2}?)?\d{10}$';
    RegExp regExp = RegExp(pattern);
    if (value.isEmpty) {
      return 'Please enter mobile number';
    }
    else if(!value.toString().startsWith('+')) {
      return 'Phone Number Starts with + followed by code then number (Hint +923346567876)';
    }
    else if (!regExp.hasMatch(value)) {
      return 'Please Enter Valid Mobile Number';
    }
    return 'success';
  }

  String validateAge(String value) {
    if (value.isEmpty) {
      return 'Enter Phone Number';
    }
    String pattern = r'^(\d{1,3}?)?$';
    RegExp regExp = RegExp(pattern);
    if (value.isEmpty) {
      return 'Please enter mobile number';
    }
    else if (!regExp.hasMatch(value)) {
      return 'Please Enter Valid Mobile Number';
    }
    return 'success';
  }

  String validateEmail(String value) {
    if (value.isEmpty) {
      return 'Enter Email Address';
    }
    String pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = RegExp(pattern);
    if (!regex.hasMatch(value)) {
      return 'Wrong email, please use a correct email';
    } else {
      return 'success';
    }
  }

  String validateInput(String value) {
    if (value.isEmpty) {
      return 'Enter Some Text';
    } else {
      return 'success';
    }
  }

  bool _isNumeric(String result) {
    return double.tryParse(result) != null;
  }

  String validate(String input) {
    if (input.isEmpty) {
      return 'Enter Email/Phone Number';
    }
    else {
      bool isNumber = _isNumeric(input);
      if (isNumber == true) {
        return validateMobile(input);
      }
      else {
        return validateEmail(input.trim());
      }
    }
  }
}