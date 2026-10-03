import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:shoes_app/features/cart/presentation/provider/card_provider.dart';


class HomePage extends StatelessWidget {
  const HomePage({super.key});

  // ============================================================
  // CATEGORY ITEM
  // ============================================================

  Widget Categories_Items(
      String text,
      String img,
      ) {
    return Column(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(100),
          child: Image.asset(
            img,
            height: 80,
            width: 80,
            fit: BoxFit.cover,
          ),
        ),
        const SizedBox(height: 4),
        Text(text),
      ],
    );
  }

  // ============================================================
  // SHOES BOX
  // ============================================================

  Widget ShoesBox(
      BuildContext context,
      String img,
      String text,
      double price,
      ) {
    return Column(
      children: [
        Container(
          height: 170,
          width: 200,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
          ),
          child: Card(
            color: Colors.white,
            elevation: 10,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(50),
              child: Image.asset(
                img,
                height: 80,
                width: 80,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),

        const SizedBox(height: 15),

        SizedBox(
          width: 200,
          child: Padding(
            padding: const EdgeInsets.only(right: 70),
            child: Text(
              text,
              textAlign: TextAlign.left,
              style: GoogleFonts.poppins(
                fontWeight: FontWeight.w400,
                fontSize: 14,
                color: Colors.black,
              ),
            ),
          ),
        ),

        Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 30),
              child: Text(
                "\$ $price",
                textAlign: TextAlign.left,
                style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w600,
                  fontSize: 14,
                  color: Colors.red,
                ),
              ),
            ),

            const SizedBox(width: 5),

            // ======================================================
            // ADD TO CART BUTTON
            // ======================================================

            GestureDetector(
              onTap: () {
                Provider.of<CartProvider>(
                  context,
                  listen: false,
                ).addToCart(
                  image: img,
                  name: text,
                  price: price,
                );

                ScaffoldMessenger.of(context)
                    .showSnackBar(
                  SnackBar(
                    content: Text(
                      "$text added to cart",
                    ),
                    duration:
                    const Duration(seconds: 1),
                    backgroundColor:
                    Colors.orangeAccent,
                  ),
                );
              },

              child: SizedBox(
                height: 40,
                width: 80,
                child: const Card(
                  shadowColor: Colors.orangeAccent,
                  color: Colors.orangeAccent,
                  elevation: 8,
                  child: Icon(
                    Icons.add,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  // ============================================================
  // BUILD
  // ============================================================

  @override
  Widget build(BuildContext context) {
    final Size screen = MediaQuery.of(context).size;

    final double screenWidth = screen.width;
    final double screenHeight = screen.height;

    final double horizontalPadding =
    screenWidth < 360 ? 10 : 15;

    final double bannerHeight =
    screenHeight < 650
        ? 220
        : screenWidth > 600
        ? 300
        : 250;

    final double bannerTitleSize =
    screenWidth < 360 ? 28 : 32;

    return Scaffold(
      // ==========================================================
      // APP BAR
      // ==========================================================

      appBar: AppBar(
        backgroundColor: Colors.black,

        leading: IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.menu_sharp,
            color: Colors.white70,
          ),
        ),

        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.search_sharp,
              color: Colors.white70,
            ),
          ),
        ],
      ),

      backgroundColor: Colors.white,

      body: SafeArea(
        child: SingleChildScrollView(
          physics:
          const BouncingScrollPhysics(),

          child: Column(
            children: [

              const SizedBox(height: 30),

              // ======================================================
              // NEW RELEASE BANNER
              // ======================================================

              Padding(
                padding: EdgeInsets.only(
                  left: horizontalPadding,
                  right: horizontalPadding,
                  top: 10,
                ),

                child: SizedBox(
                  width: double.infinity,
                  height: bannerHeight,

                  child: ClipRRect(
                    borderRadius:
                    BorderRadius.circular(20),

                    child: Stack(
                      fit: StackFit.expand,

                      children: [

                        // Background image
                        Opacity(
                          opacity: 0.8,

                          child: Image.asset(
                            "assets/images/bg.jpg",
                            fit: BoxFit.cover,
                          ),
                        ),

                        // Banner text
                        Padding(
                          padding: EdgeInsets.all(
                            screenWidth < 360
                                ? 15
                                : 20,
                          ),

                          child: Column(
                            crossAxisAlignment:
                            CrossAxisAlignment.start,

                            children: [

                              const SizedBox(
                                height: 5,
                              ),

                              Text(
                                'New Release',

                                style:
                                GoogleFonts.poppins(
                                  fontSize:
                                  screenWidth < 360
                                      ? 16
                                      : 18,

                                  color: Colors.white,

                                  fontWeight:
                                  FontWeight.w300,
                                ),
                              ),

                              const SizedBox(height: 5),

                              Text(
                                'Nike Air\nMax90',

                                style:
                                GoogleFonts.poppins(
                                  fontSize:
                                  bannerTitleSize,

                                  color: Colors.white,

                                  fontWeight:
                                  FontWeight.w500,
                                ),
                              ),

                              const SizedBox(height: 5),

                              SizedBox(
                                height: 30,
                                width: 120,

                                child: OutlinedButton(
                                  onPressed: () {},

                                  style:
                                  OutlinedButton
                                      .styleFrom(
                                    backgroundColor:
                                    Colors.white,

                                    shadowColor:
                                    Colors.white60,

                                    side:
                                    const BorderSide(
                                      color:
                                      Colors.white,
                                      width: 1,
                                    ),
                                  ),

                                  child: Text(
                                    'Buy Now',

                                    style:
                                    GoogleFonts
                                        .abhayaLibre(
                                      fontWeight:
                                      FontWeight
                                          .w900,

                                      color: Colors
                                          .blue
                                          .shade900,

                                      fontSize: 16,
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
              ),

              const SizedBox(height: 15),

              // ======================================================
              // CATEGORIES
              // ======================================================

              Column(
                children: [

                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal:
                      horizontalPadding,
                    ),

                    child: Align(
                      alignment:
                      Alignment.centerLeft,

                      child: Text(
                        'Categories',

                        style:
                        GoogleFonts.abhayaLibre(
                          fontSize: 28,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 15),

                  // CATEGORY ITEMS
                  SingleChildScrollView(
                    scrollDirection:
                    Axis.horizontal,

                    physics:
                    const BouncingScrollPhysics(),

                    child: Padding(
                      padding: EdgeInsets.only(
                        left: horizontalPadding,
                        right: horizontalPadding,
                      ),

                      child: Row(
                        children: [

                          Categories_Items(
                            "BasketBall",
                            "assets/images/nike.jpg",
                          ),

                          const SizedBox(width: 15),

                          Categories_Items(
                            "BasketBall",
                            "assets/images/nike.jpg",
                          ),

                          const SizedBox(width: 15),

                          Categories_Items(
                            "BasketBall",
                            "assets/images/nike.jpg",
                          ),

                          const SizedBox(width: 15),

                          Categories_Items(
                            "BasketBall",
                            "assets/images/nike.jpg",
                          ),

                          const SizedBox(width: 5),

                          Categories_Items(
                            "BasketBall",
                            "assets/images/nike.jpg",
                          ),

                          const SizedBox(width: 15),

                          Categories_Items(
                            "BasketBall",
                            "assets/images/nike.jpg",
                          ),

                          const SizedBox(width: 15),

                          Categories_Items(
                            "BasketBall",
                            "assets/images/nike.jpg",
                          ),
                        ],
                      ),
                    ),
                  ),

                  const SizedBox(height: 25),

                  // ====================================================
                  // NEW MEN'S
                  // ====================================================

                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal:
                      horizontalPadding,
                    ),

                    child: Align(
                      alignment:
                      Alignment.centerLeft,

                      child: Text(
                        "New Men's",

                        style:
                        GoogleFonts.abhayaLibre(
                          fontSize: 28,
                          fontWeight:
                          FontWeight.w400,
                        ),
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 5),

              // ======================================================
              // FIRST SHOES ROW
              // ======================================================

              Padding(
                padding: EdgeInsets.only(
                  left: horizontalPadding,
                  right: horizontalPadding,
                ),

                child: SingleChildScrollView(
                  scrollDirection:
                  Axis.horizontal,

                  physics:
                  const BouncingScrollPhysics(),

                  child: Row(
                    children: [

                      ShoesBox(
                        context,
                        "assets/images/pair.jpg",
                        "Men's Shoes",
                        99.66,
                      ),

                      const SizedBox(width: 15),

                      ShoesBox(
                        context,
                        "assets/images/pair.jpg",
                        "Men's Shoes",
                        99.66,
                      ),

                      const SizedBox(width: 15),

                      ShoesBox(
                        context,
                        "assets/images/pair.jpg",
                        "Men's Shoes",
                        99.66,
                      ),

                      const SizedBox(width: 15),

                      ShoesBox(
                        context,
                        "assets/images/pair.jpg",
                        "Men's Shoes",
                        99.66,
                      ),

                      const SizedBox(width: 15),

                      ShoesBox(
                        context,
                        "assets/images/pair.jpg",
                        "Men's Shoes",
                        99.66,
                      ),

                      const SizedBox(width: 15),

                      ShoesBox(
                        context,
                        "assets/images/pair.jpg",
                        "Men's Shoes",
                        99.66,
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 35),

              // ======================================================
              // SECOND SHOES ROW
              // ======================================================

              SingleChildScrollView(
                scrollDirection:
                Axis.horizontal,

                physics:
                const BouncingScrollPhysics(),

                child: Padding(
                  padding: EdgeInsets.only(
                    left: horizontalPadding,
                    right: horizontalPadding,
                  ),

                  child: Row(
                    children: [

                      ShoesBox(
                        context,
                        'assets/images/pair.jpg',
                        "Men's Shoes",
                        99.56,
                      ),

                      const SizedBox(width: 15),

                      ShoesBox(
                        context,
                        'assets/images/pair.jpg',
                        "Men's Shoes",
                        99.56,
                      ),

                      const SizedBox(width: 15),

                      ShoesBox(
                        context,
                        'assets/images/pair.jpg',
                        "Men's Shoes",
                        99.56,
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 35),
            ],
          ),
        ),
      ),
    );
  }
}