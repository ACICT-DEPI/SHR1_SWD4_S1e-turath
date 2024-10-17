import 'package:flutter/material.dart';
import 'package:turath/features/profile/newpassword_screen.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  
  bool _notificationsEnabled = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const  Color.fromARGB(255, 25, 25, 25),
      appBar: AppBar(
        backgroundColor: const  Color.fromARGB(255, 25, 25, 25),
        elevation: 0,
        leading: IconButton(
          icon: const  Icon(Icons.arrow_back, color:  const Color.fromARGB(255, 200, 135, 107)),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: const  Text(
          'Settings',
          style:  TextStyle(color:  const Color.fromARGB(255, 237, 228, 221), fontSize: 24),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            //search bar
            Container(
              padding: const EdgeInsets.all(5),
              height: 60, 
              width: MediaQuery.of(context).size.width / 1.05, 
              decoration: BoxDecoration(
                color: const   Color.fromARGB(255, 237, 228, 221),
                borderRadius: BorderRadius.circular(30),
              ),
              child: TextFormField(
                cursorColor: const  Color.fromARGB(255, 200, 135, 107),
                decoration: InputDecoration(
                  suffixIcon: const  Icon(
                    Icons.mic_none,
                    color:  Color.fromARGB(255, 200, 135, 107),
                    size: 30,
                  ),
                  prefixIcon: Icon(
                    Icons.search,
                    color: const  Color.fromARGB(255, 200, 135, 107).withOpacity(0.8),
                  ),
                  border: InputBorder.none,
                  label: Text(
                    "Search in settings",
                    style: TextStyle(
                      fontSize: 16,
                      color: const Color.fromARGB(255, 200, 135, 107).withOpacity(0.8),
                    ),
                  ),
                ),
              ),
            ),
            const  SizedBox(height: 40),

            //show notification
            Container(
              width: MediaQuery.of(context).size.width / 1.05, 
              padding: const EdgeInsets.symmetric(vertical: 12), 
              decoration: BoxDecoration(
                gradient: const  LinearGradient(
                  colors: [
                    const Color.fromARGB(255, 43, 42, 42),
                    const Color.fromARGB(255, 129, 127, 127)
                  ],
                  begin: Alignment.centerLeft,
                  end: Alignment.topRight,
                ),
                borderRadius: BorderRadius.circular(12),
              ),
              child: SwitchListTile(
                activeColor: const   Color.fromARGB(255, 200, 135, 107),
                contentPadding: const EdgeInsets.symmetric(horizontal: 16),
                title: const  Text('Show notifications',
                    style:  TextStyle(color:  Color.fromARGB(255, 237, 228, 221),fontSize: 16,)),
                secondary: const  Icon(Icons.notifications, color:  Color.fromARGB(255, 237, 228, 221)),
                value: _notificationsEnabled,
                onChanged: (bool value) {
                  setState(() {
                    _notificationsEnabled = value;
                  });
                },
              ),
            ),
            const  SizedBox(height: 20),

            // Change password
            Container(
              width: MediaQuery.of(context).size.width / 1.05, 
              padding: const EdgeInsets.symmetric(vertical: 12), 
              decoration: BoxDecoration(
                gradient: const  LinearGradient(
                  colors: [
                    const Color.fromARGB(255, 43, 42, 42),
                     const Color.fromARGB(255, 129, 127, 127)
                  ],
                  begin: Alignment.centerLeft,
                  end: Alignment.topRight,
                ),
                borderRadius: BorderRadius.circular(12),
              ),
              child: ListTile(
                leading: const  Icon(Icons.lock, color:  Color.fromARGB(255, 237, 228, 221)),
                title: const  Text(
                  'Change password',
                  style: const  TextStyle(color: Color.fromARGB(255, 237, 228, 221)),
                ),
                trailing: const  Icon(Icons.arrow_forward_ios, color: Colors.grey),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => const Newpassword()));
                },
              ),
            ),
            const SizedBox(height: 20),

            // Language
            Container(
              width: MediaQuery.of(context).size.width / 1.05, 
              padding: const EdgeInsets.symmetric(vertical: 12), 
              decoration: BoxDecoration(
                gradient: const  LinearGradient(
                  colors: [
                    Color.fromARGB(255, 43, 42, 42),
                     Color.fromARGB(255, 129, 127, 127)
                  ],
                  begin: Alignment.centerLeft,
                  end: Alignment.topRight,
                ),
                borderRadius: BorderRadius.circular(12),
              ),
              child: ListTile(
                leading: const  Icon(Icons.language, color:  Color.fromARGB(255, 237, 228, 221)),
                title: const  Text(
                  'Language',
                  style:  TextStyle(color:  const Color.fromARGB(255, 237, 228, 221)),
                ),
                trailing: const  Icon(Icons.arrow_forward_ios, color: Colors.grey),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                onTap: () {
                  // Navigator.of(context).push(MaterialPageRoute(builder: (context) => Language()));
                },
              ),
            ),
          ],
        ),
      ),
      /////////////////////////////////////////
      // bottomNavigationBar: NavBar(),
    );
  }
}
