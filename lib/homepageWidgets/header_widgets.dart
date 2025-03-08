import 'package:adhicine/homepageWidgets/empty_box.dart';
import 'package:flutter/material.dart';

import '../profile.dart';
import 'network_page.dart';

class HeaderWidget extends StatelessWidget {
  const HeaderWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(
            'Hi Harry!',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                ),

                child: IconButton(
                    onPressed: () => showConnectionAlert(context),
                    icon: Icon(
                      Icons.medical_services,
                      color: Colors.blue,
                      size: 20,
                    )),
                // ),
              ),
              const SizedBox(width: 10),
              // Container(
              //   width: 32,
              //   height: 32,
              //   decoration: BoxDecoration(
              //     shape: BoxShape.circle,
              //     image: const DecorationImage(
              //       image: NetworkImage(
              //           'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTLA994hpL3PMmq0scCuWOu0LGsjef49dyXVg&s'),
              //       fit: BoxFit.cover,
              //     ),
              //     border: Border.all(color: Colors.orange, width: 2),
              //   ),
              // ),
              GestureDetector(
                onTap: () {
                  // Navigate to a new screen
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SettingsScreen()),
                  );
                },
                child: Container(
                  width: 32,
                  height: 32,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: const DecorationImage(
                      image: NetworkImage(
                          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTLA994hpL3PMmq0scCuWOu0LGsjef49dyXVg&s'),
                      fit: BoxFit.cover,
                    ),
                    border: Border.all(color: Colors.orange, width: 2),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  void showConnectionAlert(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          insetPadding: const EdgeInsets.symmetric(horizontal: 40),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(22),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: double.infinity,
                padding:
                    const EdgeInsets.symmetric(vertical: 25, horizontal: 20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(22),
                ),
                child: Column(
                  children: [
                    const Text(
                      "Your Device is not",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Text(
                      "connected",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 25),

                    // Robot character
                    SizedBox(
                      height: 100,
                      width: 100,
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          // Blue circle background
                          Container(
                            height: 100,
                            width: 100,
                            decoration: BoxDecoration(
                              color: const Color(0xFFD3E0FF),
                              shape: BoxShape.circle,
                            ),
                          ),

                          // Robot face and body elements
                          Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              // Robot face - white pill shape with X eyes
                              Container(
                                width: 60,
                                height: 25,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: const [
                                    Text(
                                      "×",
                                      style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    SizedBox(width: 8),
                                    Text(
                                      "×",
                                      style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(height: 6),

                              // Robot mouth - black pill shape
                              Container(
                                width: 40,
                                height: 15,
                                decoration: BoxDecoration(
                                  color: Colors.black,
                                  borderRadius: BorderRadius.circular(8),
                                ),
                              ),

                              const SizedBox(height: 6),

                              // Robot body/screen
                              Container(
                                width: 40,
                                height: 30,
                                decoration: BoxDecoration(
                                  color: Colors.black,
                                  borderRadius: BorderRadius.circular(4),
                                ),
                                child: Center(
                                  child: Container(
                                    width: 28,
                                    height: 18,
                                    decoration: BoxDecoration(
                                      color: Colors.grey[800],
                                      borderRadius: BorderRadius.circular(2),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 5),

                    // Blue dot indicator

                    const SizedBox(height: 15),

                    // Connection text
                    const Text(
                      "Connect your device with",
                      style: TextStyle(
                        fontSize: 14,
                        color: Color(0xFF666666),
                      ),
                    ),

                    const SizedBox(height: 20),
                  ],
                ),
              ),

              // Connection buttons (bottom part with rounded corners)
              ClipRRect(
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(22),
                  bottomRight: Radius.circular(22),
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        height: 50,
                        color: const Color(0xFF6A8AF8),
                        child: const Center(
                          child: Icon(
                            Icons.bluetooth,
                            color: Colors.white,
                            size: 24,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      width: 1,
                      height: 50,
                      color: Colors.white,
                    ),
                    Expanded(
                      child: Container(
                        height: 50,
                        color: const Color(0xFF6A8AF8),
                        child: const Center(
                          child: Icon(
                            Icons.wifi,
                            color: Colors.white,
                            size: 24,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
