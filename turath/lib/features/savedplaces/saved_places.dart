import 'package:flutter/material.dart';

// ignore: must_be_immutable
class SavedPlaces extends StatelessWidget {  
  List images = [  
    'images/sp1.jpg',  
    'images/sp2.jpg',  
    'images/sp3.jpg',  
    'images/sp4.jpg',  
  ];  
  List names = [  
    "Colosseum",  
    "Ayutthaya Historical Park",  
    "Neuschwanstein Castle",  
    "Bagan"  
  ];  
  List locations = ["Italy", "Thailand", "Germany", "Myanmar"];  
  static const IconData location_pin =  
      IconData(0xe3ac, fontFamily: 'MaterialIcons');

  SavedPlaces({super.key});  

  @override  
  Widget build(BuildContext context) {  
    return Scaffold(  
      backgroundColor: const Color.fromARGB(255, 25, 25, 25),  
      appBar: AppBar(  
        backgroundColor: const  Color.fromARGB(255, 25, 25, 25),  
        title: const  Text(  
          "Saved Places",  
          style:  const TextStyle(  
              fontSize: 25,  
              fontWeight: FontWeight.bold,  
              color: Color.fromARGB(255, 237, 228, 221)),  
        ),  
      ),  
      body: Padding(  
        padding: const EdgeInsets.all(10.0),  
        child: ListView.builder(  
          itemCount: 4,  
          itemBuilder: (context, index) {  
            return Container(  
              margin: const  EdgeInsets.only(bottom: 30),  
              child: Container(  
                decoration: BoxDecoration(  
                  gradient: const LinearGradient(  
                    colors: [  
                      Color.fromARGB(255, 57, 57, 57),  
                      Color.fromARGB(255, 129, 127, 127)  
                    ],  
                    begin: Alignment.centerLeft,  
                    end: Alignment.topRight,  
                  ),  
                  borderRadius: BorderRadius.circular(10),  
                ),  
                child: Padding(  
                  padding: const EdgeInsets.all(20.0),  
                  child: Row(  
                    crossAxisAlignment: CrossAxisAlignment.start,  
                    children: [  
                      Container(  
                        width: 90,  
                        height: 90,  
                        child: ListView.builder(  
                          scrollDirection: Axis.horizontal,  
                          itemCount: images.length,  
                          itemBuilder: (context, imgIndex) {  
                            return Container(  
                              width: 90,  
                              height: 90,  
                              margin: const  EdgeInsets.only(right: 5),  
                              decoration: BoxDecoration(  
                                borderRadius: BorderRadius.circular(10),  
                                image: DecorationImage(  
                                  fit: BoxFit.cover,  
                                  image: AssetImage(images[index]),  
                                ),  
                              ),  
                            );  
                          },  
                        ),  
                      ),
                      const  SizedBox(width: 10),   
                      Expanded(  
                        child: Column(  
                          crossAxisAlignment: CrossAxisAlignment.start,  
                          mainAxisSize: MainAxisSize.min,  
                          children: [  
                            Text(  
                              names[index],  
                              style: const  TextStyle(  
                                fontSize: 18,  
                                color: const  Color.fromARGB(255, 237, 228, 221),  
                                fontWeight: FontWeight.bold,  
                              ),  
                            ),  
                            const  SizedBox(height: 5),  
                            Row(  
                              children: [  
                                const  Icon(  
                                  location_pin,  
                                  color: const Color.fromARGB(255, 237, 228, 221),  
                                  size: 20,  
                                ),  
                                const  SizedBox(width: 5),  
                                Text(  
                                  locations[index],  
                                  style: const  TextStyle(  
                                    fontSize: 16,  
                                    color: const  Color.fromARGB(255, 237, 228, 221),  
                                  ),  
                                ),  
                              ],  
                            ),  
                            ElevatedButton(  
                              onPressed: () {
                                ////////////////////////////////////////////////
                              },  
                              child: const  Text(  
                                "More info",  
                                style: const  TextStyle(  
                                  color: const Color.fromARGB(255, 237, 228, 221),  
                                  fontSize: 18,  
                                ),  
                              ),  
                              style: ElevatedButton.styleFrom(  
                                minimumSize: const   Size.fromHeight(40),  
                                backgroundColor:  
                                    const  Color.fromARGB(255, 200, 135, 107),  
                                shape: RoundedRectangleBorder(  
                                  borderRadius: BorderRadius.circular(20),  
                                ),  
                              ),  
                            ),  
                          ],  
                        ),  
                      ),
                      Column(  
                        children: [  
                          IconButton(  
                            icon: const  Icon(Icons.bookmark_border),  
                            color: const  Color.fromARGB(255, 200, 135, 107),  
                            onPressed: () {
                              ////////////////////////////
                            },  
                          ),  
                          IconButton(  
                            icon: const Icon(Icons.share),  
                            color: const  Color.fromARGB(255, 200, 135, 107),  
                            onPressed: () {
                              //////////////////////////////
                            },  
                          ),  
                        ],  
                      ),  
                    ],  
                  ),  
                ),  
              ),  
            );  
          },  
        ),  
      ),  
      ////////////////////////////////////////
      // bottomNavigationBar: NavBar(),  
    );  
  }  
}