import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:shoes_app/features/cart/presentation/provider/card_provider.dart';


class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        title: Text(
          "My Cart",
          style: GoogleFonts.poppins(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),

      body: Consumer<CartProvider>(
        builder: (context, cart, child) {

          if (cart.items.isEmpty) {
            return Center(
              child: Column(
                mainAxisAlignment:
                MainAxisAlignment.center,
                children: [

                  const Icon(
                    Icons.shopping_cart_outlined,
                    size: 80,
                    color: Colors.grey,
                  ),

                  const SizedBox(height: 15),

                  Text(
                    "Your cart is empty",
                    style: GoogleFonts.poppins(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                    ),
                  ),

                  const SizedBox(height: 8),

                  Text(
                    "Add some shoes to your cart",
                    style: GoogleFonts.poppins(
                      fontSize: 14,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            );
          }

          return Column(
            children: [

              Expanded(
                child: ListView.builder(
                  padding: const EdgeInsets.all(15),
                  itemCount: cart.items.length,

                  itemBuilder: (context, index) {

                    final item =
                    cart.items[index];

                    return Container(
                      margin:
                      const EdgeInsets.only(
                        bottom: 15,
                      ),

                      padding:
                      const EdgeInsets.all(10),

                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius:
                        BorderRadius.circular(20),

                        boxShadow: const [
                          BoxShadow(
                            color: Colors.black12,
                            blurRadius: 8,
                            offset: Offset(0, 3),
                          ),
                        ],
                      ),

                      child: Row(
                        children: [

                          ClipRRect(
                            borderRadius:
                            BorderRadius.circular(15),

                            child: Image.asset(
                              item.image,
                              height: 90,
                              width: 90,
                              fit: BoxFit.cover,
                            ),
                          ),

                          const SizedBox(width: 15),

                          Expanded(
                            child: Column(
                              crossAxisAlignment:
                              CrossAxisAlignment.start,

                              children: [

                                Text(
                                  item.name,
                                  style:
                                  GoogleFonts.poppins(
                                    fontSize: 15,
                                    fontWeight:
                                    FontWeight.w500,
                                  ),
                                ),

                                const SizedBox(height: 5),

                                Text(
                                  "\$ ${item.price}",
                                  style:
                                  GoogleFonts.poppins(
                                    color: Colors.red,
                                    fontSize: 14,
                                    fontWeight:
                                    FontWeight.w600,
                                  ),
                                ),

                                const SizedBox(height: 8),

                                Row(
                                  children: [

                                    GestureDetector(
                                      onTap: () {
                                        cart.decreaseQuantity(
                                            index);
                                      },

                                      child:
                                      Container(
                                        height: 30,
                                        width: 30,

                                        decoration:
                                        BoxDecoration(
                                          color: Colors
                                              .orangeAccent,
                                          borderRadius:
                                          BorderRadius
                                              .circular(
                                              8),
                                        ),

                                        child:
                                        const Icon(
                                          Icons.remove,
                                          color:
                                          Colors.white,
                                          size: 18,
                                        ),
                                      ),
                                    ),

                                    Padding(
                                      padding:
                                      const EdgeInsets
                                          .symmetric(
                                        horizontal: 12,
                                      ),

                                      child: Text(
                                        "${item.quantity}",
                                        style:
                                        GoogleFonts
                                            .poppins(
                                          fontWeight:
                                          FontWeight.w500,
                                        ),
                                      ),
                                    ),

                                    GestureDetector(
                                      onTap: () {
                                        cart.increaseQuantity(
                                            index);
                                      },

                                      child:
                                      Container(
                                        height: 30,
                                        width: 30,

                                        decoration:
                                        BoxDecoration(
                                          color: Colors
                                              .orangeAccent,
                                          borderRadius:
                                          BorderRadius
                                              .circular(
                                              8),
                                        ),

                                        child:
                                        const Icon(
                                          Icons.add,
                                          color:
                                          Colors.white,
                                          size: 18,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),

                          IconButton(
                            onPressed: () {
                              cart.removeItem(index);
                            },

                            icon: const Icon(
                              Icons.delete_outline,
                              color: Colors.red,
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),

              // ==============================
              // TOTAL
              // ==============================

              Container(
                padding: const EdgeInsets.all(20),

                decoration: const BoxDecoration(
                  color: Colors.white,

                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 10,
                    ),
                  ],
                ),

                child: Column(
                  children: [

                    Row(
                      mainAxisAlignment:
                      MainAxisAlignment.spaceBetween,

                      children: [

                        Text(
                          "Total",
                          style:
                          GoogleFonts.poppins(
                            fontSize: 18,
                            fontWeight:
                            FontWeight.w500,
                          ),
                        ),

                        Text(
                          "\$ ${cart.totalPrice.toStringAsFixed(2)}",
                          style:
                          GoogleFonts.poppins(
                            fontSize: 18,
                            color: Colors.red,
                            fontWeight:
                            FontWeight.w600,
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 15),

                    SizedBox(
                      width: double.infinity,
                      height: 50,

                      child: ElevatedButton(
                        onPressed: () {},

                        style:
                        ElevatedButton.styleFrom(
                          backgroundColor:
                          Colors.orangeAccent,

                          shape:
                          RoundedRectangleBorder(
                            borderRadius:
                            BorderRadius.circular(
                                15),
                          ),
                        ),

                        child: Text(
                          "Checkout",
                          style:
                          GoogleFonts.poppins(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight:
                            FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}