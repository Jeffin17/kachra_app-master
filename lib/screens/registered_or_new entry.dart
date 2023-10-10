import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kachra_app/screens/reg_residents.dart';
import 'package:kachra_app/screens/start_page.dart';
import 'drawer/drawer_final.dart';
import 'new_entry.dart';

// PageName:Registered-or-NewEntry

class RegPage extends StatelessWidget {
  const RegPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          if (!FocusScope.of(context).hasPrimaryFocus) {
            FocusScope.of(context).unfocus();
          }
        },
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          backgroundColor: Colors.white,
          drawer: MyDrawer(),

          body: SafeArea(
            child: Column(

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



                SizedBox(
                  height: 125,
                ),
                Center(
                  child: Column(
                    children: [
                      Container(
                          width: 244,
                          height: 216,
                          child: Image.asset('asset/image/RegPage.png')),
                      SizedBox(
                        height: 35,
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const RegRes(),
                              ));
                        },
                        child: Container(
                          height: 50,
                          width: 300,
                          decoration: BoxDecoration(
                              color: app_color,
                              borderRadius: BorderRadius.circular(15)),
                          margin: EdgeInsets.all(5.0),
                          child: Center(
                            child: Text(
                              'Registered Residents',
                              style: (GoogleFonts.montserrat(
                                  color: app_color3,
                                  fontWeight: FontWeight.w600)),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 10,),
                      GestureDetector(
                        onTap: () {
                          // Navigator.push(context, MaterialPageRoute(builder: (context) => ,));
                        },
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const EnterDetails(),
                                ));
                          },
                          child: Container(
                            height: 50,
                            width: 300,
                            decoration: BoxDecoration(
                                color: app_color2,
                                borderRadius: BorderRadius.circular(15)),
                            margin: EdgeInsets.all(5.0),
                            child: Center(
                              child: Text(
                                'New Entry',
                                style: (GoogleFonts.montserrat(
                                    color: app_color4,
                                    fontWeight: FontWeight.w600)),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
    );
  }
}
