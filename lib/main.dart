import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
// import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(MyApp());
}

int activeIndex = 0;
final profilePicture = [
  'assets/koceje1.jpg',
  'assets/kodarrell1.jpg',
  'assets/konico1.jpg',
  'assets/ebet1.jpg',
  'assets/ivan1.jpg',
];
final profilePicture2 = [
  'assets/koceje2.jpg',
  'assets/kodarrell1.jpg',
  'assets/konico1.jpg',
  'assets/ebet1.jpg',
  'assets/ivan1.jpg',
];
final nama = [
  'Christopher J.',
  'Darrel C.',
  'Nico S.',
  'Elizabeth C.',
  'Ivan S.',
];
final deskripsi = [
  'Cowok',
  'Cowok',
  'Cowok',
  'Cewek',
  'Cowok',
];
final instagram = [
  '@chrisjul06',
  '@darrelcr_',
  '@nico.s.t',
  '@elizabethcelineee',
  '@ivan_sunjaya',
];

final linkIg = {'chrisjul06': 'https://www.instagram.com/chrisjul06/'};

// ignore: must_be_immutable
class MyApp extends StatelessWidget {
  MyApp({super.key});
  PageController controller = PageController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Directionality(
        textDirection: TextDirection.ltr,
        child: Scaffold(
          backgroundColor: Colors.white,
          body: Column(
            children: [
              AppBar(
                leading: const Icon(Icons.computer, color: Colors.white),
                backgroundColor: Colors.grey[900],
                title: const Text(
                  'IT WGG 2024',
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.white),
                ),
                centerTitle: true,
              ),
              const SizedBox(height: 10),
              CarouselSlider.builder(
                itemCount: profilePicture.length,
                itemBuilder: (context, index, realIndex) {
                  final urlImage = profilePicture[index];
                  return GestureDetector(
                    onTap: () {
                      int tappedIndex = index;
                      showCupertinoModalPopup(
                          context: context,
                          builder: (BuildContext builder) {
                            return CupertinoPopupSurface(
                              child: SingleChildScrollView(
                                child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Container(
                                        color: Colors.black,
                                        width:
                                            MediaQuery.of(context).size.width,
                                        child: Column(
                                          children: [
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(20.0),
                                              child: CircleAvatar(
                                                radius: 80,
                                                backgroundImage: AssetImage(
                                                    profilePicture2[
                                                        tappedIndex]),
                                              ),
                                            ),
                                            const SizedBox(width: 20),
                                            Column(
                                              children: [
                                                Text(nama[tappedIndex],
                                                    style: const TextStyle(
                                                        fontSize: 36,
                                                        color: Colors.white,
                                                        decoration:
                                                            TextDecoration
                                                                .none)),
                                                const SizedBox(
                                                  height: 10,
                                                ),
                                                Text(
                                                  deskripsi[tappedIndex],
                                                  style: const TextStyle(
                                                    fontSize: 24,
                                                    color: Colors.white,
                                                    decoration:
                                                        TextDecoration.none,
                                                  ),
                                                ),
                                                Text(
                                                  instagram[tappedIndex],
                                                  style: const TextStyle(
                                                      fontSize: 24,
                                                      color: Colors.white,
                                                      decoration: TextDecoration
                                                          .underline,
                                                      decorationColor:
                                                          Colors.white),
                                                ),
                                                const Text(
                                                  'linkedin.com',
                                                  style: TextStyle(
                                                      fontSize: 24,
                                                      color: Colors.white,
                                                      decoration: TextDecoration
                                                          .underline,
                                                      decorationColor:
                                                          Colors.white),
                                                )
                                                // GestureDetector(onTap: () { error//
                                                //   String username =
                                                //       instagram[tappedIndex]
                                                //           .substring(1);
                                                //   String? urlString =
                                                //       linkIg[username];
                                                //   if (urlString != null) {
                                                //     launchUrl(
                                                //         Uri.parse(urlString));
                                                //   } else {
                                                //     print("error");
                                                //   }
                                                // })
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                      Container(
                                        color: CupertinoColors.black,
                                        alignment: Alignment.bottomCenter,
                                        width:
                                            MediaQuery.of(context).size.width,
                                        height: 100,
                                        child: Container(
                                          width:
                                              MediaQuery.of(context).size.width,
                                          color: Colors.red,
                                          child: CupertinoButton(
                                            child: const Text(
                                              'Close',
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 24),
                                            ),
                                            onPressed: () {
                                              Navigator.of(context).pop();
                                            },
                                          ),
                                        ),
                                      ),
                                    ]),
                              ),
                            );
                          });
                    },
                    child: buildImage(urlImage, index),
                  );
                },
                options: CarouselOptions(
                    enableInfiniteScroll: true,
                    autoPlay: true,
                    height: 400,
                    onPageChanged: (index, reason) {
                      setState(() {
                        activeIndex = index;
                      });
                    }),
              ),
              const SizedBox(height: 12),
              Lottie.asset('animations/animasiKomputer.json',
                  height: 205, width: MediaQuery.of(context).size.width),
            ],
          ),
        ),
      ),
    );
  }

  void setState(Null Function() param0) {}
}

Widget buildImage(String profilePicture, int index) {
  return Container(
    margin: const EdgeInsets.symmetric(horizontal: 5),
    child: Image.asset(profilePicture, fit: BoxFit.cover),
  );
}
