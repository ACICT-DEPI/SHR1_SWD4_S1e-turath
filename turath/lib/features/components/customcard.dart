import 'package:flutter/material.dart';

// ignore: must_be_immutable
class Customcard extends StatelessWidget {
 final  Widget? leading; 
 final String name;
 void Function()? onTap;

 Customcard({super.key ,required this.leading,required this.name, required this.onTap});


  @override
  Widget build(BuildContext context) {
    return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20 , vertical: 5),
            child: Container(
                width: MediaQuery.of(context).size.width / 1.05, 
                padding: const   EdgeInsets.symmetric(vertical: 12), 
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
                  leading:Container(
                    height: 100,
                    width: 100,
                    child: leading),
                  title: Text(
                    name,
                    style: const  TextStyle(color:  Color.fromARGB(255, 237, 228, 221)),
                  ),
                  trailing: const  Icon(Icons.arrow_forward_ios, color: Colors.grey),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  onTap: onTap
                    // Navigator.of(context).push(MaterialPageRoute(builder: (context) => const ProfileScreen()));
                  
                ),
              ),
          );
  }
}