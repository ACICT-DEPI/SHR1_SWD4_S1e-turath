import 'package:flutter/material.dart';

// ignore: must_be_immutable
class Customcategoriescard extends StatelessWidget {

 final String name ;
 final String image ;
 void Function()? onTap;

  Customcategoriescard ({super.key,required this.name, required this.image , required this.onTap});


  @override
  Widget build(BuildContext context) {
    return InkWell(
                  onTap: onTap,
                  child: Column(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(20.0),
                        child: Container(
                          height: 60,
                          width: 60,
                          color: const Color.fromARGB(255, 200, 135, 107),
                          child:  ImageIcon(
                             AssetImage(
                                image),
                            color: const Color.fromARGB(255, 237, 228, 221),
                            size: 15,
                          ),
                        ),
                      ),
                      const SizedBox(height: 8),
                       Text(name,
                          style: const TextStyle(
                              color: const Color.fromARGB(255, 237, 228, 221))),
                    ],
                  ),
                );
  }
}