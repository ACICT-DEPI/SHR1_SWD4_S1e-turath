import 'package:flutter/material.dart';
import 'package:turath/features/profile/settings_screen.dart';

class Newpassword extends StatefulWidget {
  const Newpassword({super.key});

  @override
  State<Newpassword> createState() => _NewpasswordState();
}

class _NewpasswordState extends State<Newpassword> {
  bool passwordVisible = false;
  bool confirmPasswordVisible = false;

  final _formKey = GlobalKey<FormState>(); 
  final TextEditingController _newPasswordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 25, 25, 25),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 25, 25, 25),
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Color.fromARGB(255, 200, 135, 107)),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: Text(
          'Change Password',
          style: TextStyle(color: Color.fromARGB(255, 237, 228, 221), fontSize: 24),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Form(
            key: _formKey, 
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 40),
                TextFormField(
                  controller: _newPasswordController,
                  cursorColor: Color.fromARGB(255, 237, 228, 221),
                  obscureText: !passwordVisible,
                  keyboardType: TextInputType.visiblePassword,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.symmetric(vertical: 20.0),
                    border: OutlineInputBorder(borderSide: BorderSide(
                          color: Color.fromARGB(255, 237, 228, 221))),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          color: Color.fromARGB(255, 237, 228, 221))),
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          color: Color.fromARGB(255, 237, 228, 221))),
                  labelText: 'New Password',
                  labelStyle: TextStyle(
                    color: Color.fromARGB(255, 237, 228, 221),
                    ),
                    prefixIcon: Icon(Icons.lock, color: Color.fromARGB(255, 237, 228, 221)),
                    suffixIcon: IconButton(
                      icon: Icon(
                        passwordVisible ? Icons.visibility : Icons.visibility_off,
                        color: Color.fromARGB(255, 237, 228, 221),
                      ),
                      onPressed: () => setState(() {
                        passwordVisible = !passwordVisible;
                      }),
                    ),
                  ),
                  style: TextStyle(color: Color.fromARGB(255, 237, 228, 221)),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your new password';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 20),
                TextFormField(
                  controller: _confirmPasswordController,
                  cursorColor: Color.fromARGB(255, 237, 228, 221),
                  obscureText: !confirmPasswordVisible,
                  keyboardType: TextInputType.visiblePassword,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.symmetric(vertical: 20.0),
                    border: OutlineInputBorder(borderSide: BorderSide(
                          color: Color.fromARGB(255, 237, 228, 221))),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          color: Color.fromARGB(255, 237, 228, 221))),
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          color: Color.fromARGB(255, 237, 228, 221))),
                  labelText: 'Confirm Password',
                  labelStyle: TextStyle(
                    color: Color.fromARGB(255, 237, 228, 221),
                    ),
                    prefixIcon: Icon(Icons.lock, color: Color.fromARGB(255, 237, 228, 221)),
                    suffixIcon: IconButton(
                      icon: Icon(
                        confirmPasswordVisible ? Icons.visibility : Icons.visibility_off,
                        color: Color.fromARGB(255, 237, 228, 221),
                      ),
                      onPressed: () => setState(() {
                        confirmPasswordVisible = !confirmPasswordVisible;
                      }),
                    ),
                  ),
                  style: TextStyle(color: Color.fromARGB(255, 237, 228, 221)),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please confirm your password';
                    }
                    if (value != _newPasswordController.text) {
                      return 'Passwords do not match';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 30),
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => SettingsScreen()),
                      );
                    }
                  },
                  child: Text(
                    "Confirm",
                    style: TextStyle(
                      color: Color.fromARGB(255, 237, 228, 221),
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size.fromHeight(55),
                    backgroundColor: Color.fromARGB(255, 200, 135, 107),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      ////////////////////////
      // bottomNavigationBar: NavBar(),
    );
  }
}