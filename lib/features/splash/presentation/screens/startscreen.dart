import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shoes_app/features/home/presentation/screens/home_page.dart' show HomePage;


class Startscreen extends StatefulWidget {
  const Startscreen({super.key});

  @override
  State<Startscreen> createState() => _StartscreenState();
}

class _StartscreenState extends State<Startscreen> {
  final AssetImage shoeImage =
  const AssetImage("assets/images/shoes.png");

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    // Preload image before it is displayed
    precacheImage(shoeImage, context);
  }

  @override
  Widget build(BuildContext context) {
    final Size screen = MediaQuery.of(context).size;

    final double screenWidth = screen.width;
    final double screenHeight = screen.height;

    // Responsive image section
    final double imageHeight = screenHeight * 0.62;

    // Responsive title
    final double titleSize = screenWidth < 350
        ? 32
        : screenWidth < 600
        ? 38
        : 42;

    // Responsive description
    final double descriptionSize = screenWidth < 350
        ? 15
        : screenWidth < 600
        ? 18
        : 20;

    // Responsive buttons
    final double buttonWidth = screenWidth < 350
        ? 140
        : screenWidth < 600
        ? 160
        : 180;

    final double buttonHeight =
    screenHeight < 650 ? 52 : 60;

    return Scaffold(
      backgroundColor: Colors.black,

      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            return SingleChildScrollView(
              physics: const BouncingScrollPhysics(),

              child: ConstrainedBox(
                constraints: BoxConstraints(
                  minHeight: constraints.maxHeight,
                ),

                child: Column(
                  children: [

                    // =====================================================
                    // IMAGE + TEXT
                    // =====================================================

                    SizedBox(
                      height: imageHeight,
                      width: screenWidth,

                      child: Stack(
                        children: [

                          // -------------------------------------------------
                          // SHOE IMAGE
                          // -------------------------------------------------

                          Positioned.fill(
                            child: Container(
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: shoeImage,
                                  fit: BoxFit.cover,
                                  opacity: 0.6,
                                ),
                              ),
                            ),
                          ),

                          // -------------------------------------------------
                          // TEXT
                          // -------------------------------------------------

                          Positioned(
                            left: 20,
                            right: 20,
                            bottom:
                            screenHeight < 650 ? 25 : 35,

                            child: Column(
                              children: [

                                Text(
                                  "Walkology",
                                  textAlign: TextAlign.center,

                                  style:
                                  GoogleFonts.abhayaLibre(
                                    fontSize: titleSize,
                                    fontWeight:
                                    FontWeight.w700,
                                    color: Colors.white,

                                    shadows: const [
                                      Shadow(
                                        color:
                                        Colors.black87,
                                        blurRadius: 10.0,
                                        offset:
                                        Offset(5.0, 5.0),
                                      ),
                                    ],
                                  ),
                                ),

                                const SizedBox(height: 10),

                                Text(
                                  "Welcome to Walkology, your one-stop\n"
                                      "shop for the best footwear!",

                                  textAlign: TextAlign.center,

                                  style: GoogleFonts.poppins(
                                    fontSize:
                                    descriptionSize,
                                    fontWeight:
                                    FontWeight.w300,
                                    color: Colors.white,

                                    shadows: const [
                                      Shadow(
                                        color:
                                        Colors.black87,
                                        blurRadius: 10.0,
                                        offset:
                                        Offset(5.0, 5.0),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),

                    // =====================================================
                    // SIGN IN BUTTON
                    // =====================================================

                    SizedBox(
                      height:
                      screenHeight < 650 ? 20 : 30,
                    ),

                    SizedBox(
                      height: buttonHeight,
                      width: buttonWidth,

                      child: OutlinedButton(
                        onPressed: () {},

                        style:
                        OutlinedButton.styleFrom(
                          backgroundColor:
                          Colors.white,

                          shadowColor:
                          Colors.white60,

                          side: const BorderSide(
                            color: Colors.white,
                            width: 1,
                          ),
                        ),

                        child: Text(
                          'Sign In',

                          style:
                          GoogleFonts.abhayaLibre(
                            fontWeight:
                            FontWeight.w900,

                            color:
                            Colors.blue.shade900,

                            fontSize:
                            screenWidth < 350
                                ? 16
                                : 18,
                          ),
                        ),
                      ),
                    ),

                    // =====================================================
                    // SPACE
                    // =====================================================

                    SizedBox(
                      height:
                      screenHeight < 650 ? 20 : 30,
                    ),

                    // =====================================================
                    // SHOP NOW BUTTON
                    // =====================================================

                    SizedBox(
                      height: buttonHeight,
                      width: buttonWidth,

                      child: OutlinedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                              const HomePage(),
                            ),
                          );
                        },

                        style:
                        OutlinedButton.styleFrom(
                          backgroundColor:
                          Colors.blue.shade500,

                          shadowColor:
                          Colors.white60,

                          side: const BorderSide(
                            color: Colors.blue,
                            width: 1,
                          ),
                        ),

                        child: Text(
                          'Shop Now',

                          style:
                          GoogleFonts.abhayaLibre(
                            fontWeight:
                            FontWeight.w900,

                            color: Colors.white,

                            fontSize:
                            screenWidth < 350
                                ? 16
                                : 18,
                          ),
                        ),
                      ),
                    ),

                    SizedBox(
                      height:
                      screenHeight < 650 ? 20 : 30,
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}