import 'package:flutter/material.dart';

class RegistrationForm extends StatefulWidget {
  const RegistrationForm({super.key});
  @override
  State<RegistrationForm> createState() => RegistrationFormState();
}

class RegistrationFormState extends State<RegistrationForm> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final RegExp emailRegex = RegExp(
    r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
  );
  void cleartextFeilds() {
    _nameController.clear();
    _emailController.clear();
    _passwordController.clear();
    _confirmPasswordController.clear();
    _phoneController.clear();
  }

  final _formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(top: 50, left: 10, right: 10),
        child: Form(
          key: _formkey,
          child: ListView(
            children: [
              Text(
                'Create Your Account',
                style: TextStyle(fontSize: 30, fontWeight: .bold),
                textAlign: .center,
              ),
              Text(
                'Sign up by providing your information',
                style: TextStyle(fontSize: 16, color: Colors.blueGrey),
                textAlign: .center,
              ),
              const SizedBox(height: 20),
              buildTextField(_nameController, 'Name', false, (value) {
                if (value == null || value.isEmpty) {
                  return 'Name Required*';
                } else {
                  return null;
                }
              }),
              const SizedBox(height: 10),
              buildTextField(_emailController, 'Email', false, (value) {
                if (value == null || value.isEmpty) {
                  return 'Email Required*';
                } else if (!emailRegex.hasMatch(value)) {
                  return 'Enter a valid email';
                } else {
                  return null;
                }
              }),
              const SizedBox(height: 10),
              buildTextField(_phoneController, 'Phone', false, (value) {
                if (value == null || value.isEmpty) {
                  return 'Phone Required*';
                } else if (value.length < 11 || value.length > 11) {
                  return 'Enter a valid phone number ';
                } else {
                  return null;
                }
              }),
              const SizedBox(height: 10),
              buildTextField(_passwordController, 'Password', true, (value) {
                if (value == null || value.isEmpty) {
                  return 'Password is required';
                }

                if (value.length < 8) {
                  return 'Password must be at least 8 characters long';
                }

                if (!RegExp(r'[A-Z]').hasMatch(value)) {
                  return 'Password must contain at least one uppercase letter';
                }

                if (!RegExp(r'[a-z]').hasMatch(value)) {
                  return 'Password must contain at least one lowercase letter';
                }

                if (!RegExp(r'\d').hasMatch(value)) {
                  return 'Password must contain at least one number';
                }

                if (!RegExp(r'[@$!%*?#&]').hasMatch(value)) {
                  return 'Password must contain at least one special character';
                }

                return null;
              }),
              const SizedBox(height: 10),
              buildTextField(
                _confirmPasswordController,
                'Confirm Password',
                true,
                (value) {
                  if (value == null || value.isEmpty) {
                    return 'Confirm Password';
                  } else if (value != _passwordController.text) {
                    return "Password did'nt match";
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () async {
                  if (_formkey.currentState!.validate()) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('Your data is saved successfully'),
                      ),
                    );
                    cleartextFeilds();
                  }
                },

                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.lightBlue,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadiusGeometry.circular(0),
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                ),
                child: Text('Submit'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget buildTextField(
  final TextEditingController controller,
  String label,
  bool isPassword,
  final String? Function(String?)? validator,
) {
  return TextFormField(
    controller: controller,
    validator: validator,
    maxLines: 1,
    decoration: InputDecoration(
      label: Text(label),
      floatingLabelStyle: TextStyle(color: Colors.lightBlue),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.black45),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.lightBlue),
      ),
      errorBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.black45),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.lightBlue),
      ),
    ),
    cursorColor: Colors.lightBlue,
    cursorErrorColor: Colors.lightBlue,
    obscureText: isPassword,
    obscuringCharacter: '*',
  );
}
