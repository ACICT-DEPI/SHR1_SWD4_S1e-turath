import 'package:flutter/material.dart';  

class AboutusScreen extends StatelessWidget {  
  @override  
  Widget build(BuildContext context) {  
    return Scaffold( 
      backgroundColor: const Color.fromARGB(255, 25, 25, 25),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 25, 25, 25),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: const Color.fromARGB(255, 200, 135, 107)),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: const Text(
          'About Us',
          style: const TextStyle(color: const Color.fromARGB(255, 237, 228, 221), fontSize: 24),
        ),
      ),
      body: const Padding(  
        padding: const EdgeInsets.all(16.0),  
        child: const Column(  
          crossAxisAlignment: CrossAxisAlignment.start,  
          children: [  
            const Text(  
              'About Our Company',  
              style: const TextStyle(color: const Color.fromARGB(255, 237, 228, 221), fontSize: 24, fontWeight: FontWeight.bold),  
            ),  
            const SizedBox(height: 20),  
            const Text(  
              'Turath is a groundbreaking app designed to preserve and celebrate the rich cultural heritage of the world, connecting generations to the timeless traditions and stories that shape our history.',  
              style: const TextStyle(color: const Color.fromARGB(255, 237, 228, 221), fontSize: 16),  
            ),  
            const SizedBox(height: 20),  
            const Text(  
              'Contact us at: Turath@gmail.com',  
              style: const TextStyle(color: const Color.fromARGB(255, 237, 228, 221), fontSize: 16),  
            ),  
          ],  
        ),  
      ),  
    );  
  }  
}