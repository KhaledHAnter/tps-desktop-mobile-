class ValidatorUtils {
  static String? requiredField(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'حقل مطلوب';
    }

    return null;
  }

  static String? validateEmail(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Email is required';
    } else if (!RegExp(
            r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
        .hasMatch(value)) {
      return 'Invalid email address';
    }
    return null;
  }

  static String? validateName(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'الاسم مطلوب';
    } else if (!RegExp(r"^[\p{L} ,.'-]*$",
            caseSensitive: false, unicode: true, dotAll: true)
        .hasMatch(value)) {
      return 'الاسم غير صحيح';
    }
    return null;
  }

  static String? validatePassword(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Password is required';
    } else if (!RegExp(r'^(?=.*?[0-9]).{8,}$').hasMatch(value)) {
      return 'Invalid password';
    }
    return null;
  }

  static String? validatePasswordConfirmation(String? value, String? password) {
    if (value == null || value.trim().isEmpty) {
      return 'Password confirmation is required';
    } else if (!(value == password)) {
      return 'Password does not match';
    }
    return null;
  }

  static String? validateHighSecurityPassword(String? value) {
    RegExp regex =
        RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');
    if (value == null || value.trim().isEmpty) {
      return 'Password is required';
    } else {
      if (!regex.hasMatch(value)) {
        return 'Invalid password';
      } else {
        return null;
      }
    }
  }

  static String? validatePhoneNumberEG(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'رقم الجوال مطلوب';
    } else if (!RegExp(r'^(010|011|012|015)[0-9]{8}$').hasMatch(value)) {
      return 'رقم الجوال غير صحيح';
    }
    return null;
  }

  static String? validateNumberOnly(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'رقم الجوال مطلوب';
    } else if (!RegExp(r'^\d+$').hasMatch(value)) {
      return 'رقم الجوال غير صحيح';
    }
    return null;
  }

  static bool hasLowerCase(String password) {
    return RegExp(r'^(?=.*[a-z])').hasMatch(password);
  }

  static bool hasUpperCase(String password) {
    return RegExp(r'^(?=.*[A-Z])').hasMatch(password);
  }

  static bool hasNumber(String password) {
    return RegExp(r'^(?=.*?[0-9])').hasMatch(password);
  }

  static bool hasSpecialCharacter(String password) {
    return RegExp(r'^(?=.*?[#?!@$%^&*-])').hasMatch(password);
  }

  static bool hasMinLength(String password) {
    return RegExp(r'^(?=.{8,})').hasMatch(password);
  }
}
