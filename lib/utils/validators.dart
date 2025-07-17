import 'package:form_validator/form_validator.dart';

class Validators {
  final reqValidator = ValidationBuilder().required().build();
  final reqEmailValidator =
      ValidationBuilder().required("Enter a valid email").email().build();
  final reqPhoneValidator = ValidationBuilder()
      .required("Enter a valid phone number")
      .phone()
      .build();
  final reqPasswordValidator = ValidationBuilder()
      .required()
      .minLength(6, "Password should be more than 5 characters")
      .build();
}
