import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kachra_app/screens/drawer/drawer_final.dart';
import 'package:kachra_app/screens/waste_type.dart';

class RegRes extends StatelessWidget {
  const RegRes({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
          drawer: MyDrawer(),
          body: SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                      child: Builder(
                        builder: (BuildContext context) {
                          return IconButton(
                            onPressed: () {
                              Scaffold.of(context).openDrawer();
                            },
                            icon: Icon(Icons.menu, color: Colors.black, size: 35),
                          );
                        },
                      ),
                    ),
                  ],
                ),
                Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          height: MediaQuery.of(context).size.height * 0.4,
                          width: MediaQuery.of(context).size.width * 0.8,
                          decoration: BoxDecoration(
                            // color: Colors.black,
                            image: DecorationImage(
                                image: AssetImage('asset/image/scaner.png')),
                          ),
                        ),

                        // SizedBox(height: 30),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => WasteType(),
                                ));
                          },
                          child: Container(
                            height: 40,
                            width: MediaQuery.of(context).size.width * 0.5,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Color.fromRGBO(95, 128, 94, 1)),
                            child: Center(
                              child: Text(
                                'Scan QR Code',
                                style: GoogleFonts.montserrat(
                                    color: Color.fromRGBO(239, 239, 239, 1),
                                    fontWeight: FontWeight.w600,
                                    fontSize: 15),
                              ),
                            ),
                          ),
                        ),
                      ],
                    )),

                SizedBox(height: MediaQuery.of(context).size.height*0.1,)
              ],
            ),
          ),
        ));
  }
}