String? validateName(String? value) {
  // Check if the name is empty
  if (value == null || value.isEmpty) {
    return 'Name is required';
  }
  // Check if the name contains only letters and spaces
  final RegExp nameRegExp = RegExp(r'^[a-zA-Z\s]+$');
  if (!nameRegExp.hasMatch(value)) {
    return 'Name must contain only letters and spaces';
  }
  return null;
}

String? validateEmail(String? value) {
  // Check if the email is empty
  if (value == null || value.isEmpty) {
    return 'Email is required';
  }
  // Check if the email format is valid
  final RegExp emailRegExp = RegExp(
    r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
  );
  if (!emailRegExp.hasMatch(value)) {
    return 'Enter a valid email address';
  }
  return null;
}
String? validatePhoneNumber(String? value) {
  // Check if the phone number is empty
  if (value == null || value.isEmpty) {
    return 'Phone number is required';
  }
  // Check if the phone number format is valid
  final RegExp phoneRegExp = RegExp(
    r'^(?:\+88|01)?\d{9,11}$',
  );
  if (!phoneRegExp.hasMatch(value)) {
    return 'Enter a valid Bangladeshi phone number';
  }
  return null;
}
String? validateNumericPassword(String? value) {
  // Check if the password is empty
  if (value == null || value.isEmpty) {
    return 'Password is required';
  }
  // Check if the password is exactly 8 digits long and contains only numbers
  final RegExp passwordRegExp = RegExp(
    r'^\d{8}$',
  );
  if (!passwordRegExp.hasMatch(value)) {
    return 'Password must be exactly 8 digits long';
  }
  return null;
}
