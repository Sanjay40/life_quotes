import 'dart:io';
import 'dart:math';
import 'dart:typed_data';
import 'package:path_provider/path_provider.dart';
import 'package:screenshot/screenshot.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:life_quotes/Utils/global.dart';
import 'package:clipboard/clipboard.dart';
import 'package:share_plus/share_plus.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';

class QuotesScreen extends StatefulWidget {
  const QuotesScreen({Key? key}) : super(key: key);

  @override
  State<QuotesScreen> createState() => _QuotesScreenState();
}

class _QuotesScreenState extends State<QuotesScreen> {

  Future saveImage(Uint8List bytes) async {
    await ImageGallerySaver.saveImage(bytes, name: "data", quality: 100);
  }
  ScreenshotController screenshotController = ScreenshotController();
  @override
  Widget build(BuildContext context) {
    Random r1 = Random();
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey.shade200,
        elevation: 0,
        leading: GestureDetector(
          onTap: (){
            Navigator.pop(context);
          },
          child: Icon(Icons.arrow_back,
            color: Colors.black,
          ),
        ),
        title: Text("Quotes",
          style: GoogleFonts.poppins(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: Colors.black,
            letterSpacing: 0.5,
          ),
        ),
      ),
      backgroundColor: Colors.grey.shade200,
      body: ListView(
        children: list.map((e){
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 13,vertical: 15),
            child: Container(
              height: 500,
              width: 300,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.shade500,
                      offset: Offset(1,3),
                      blurRadius: 5,
                    )
                  ]
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    height: 435,
                    decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.vertical(top: Radius.circular(10)),
                        image: DecorationImage(
                            image: NetworkImage("${list[Random().nextInt(12)]['bgImg']}"),
                            fit: BoxFit.cover
                        )
                    ),
                    alignment: Alignment.center,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text("${e['quote']}",
                        style: TextStyle(
                            color: Colors.white
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  SizedBox(height: 20,),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          onTap: (){
                            setState(() {
                              // imgChangeNum = r1.nextInt(12);
                            });
                          },
                          child: Icon(Icons.upload_file_rounded,
                            color: Colors.red,
                            size: 22,
                          ),
                        ),
                        GestureDetector(
                          onTap: (){
                            setState(() {
                              FlutterClipboard.copy(e['quote']).then(( value ) =>
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text("Text is Copied",
                                        style: GoogleFonts.poppins(
                                          fontWeight: FontWeight.w700,
                                          color: Colors.white,
                                          fontSize: 14,
                                        ),
                                      ),
                                      behavior: SnackBarBehavior.floating,
                                      backgroundColor: Colors.black,
                                      duration: Duration(seconds: 1),
                                    ),
                                  ),
                              );
                            });
                          },
                          child: Icon(Icons.copy,
                            color: Colors.blue,
                            size: 22,
                          ),
                        ),
                        GestureDetector(
                            onTap: () async {
                              final byte = await screenshotController.captureFromWidget(
                                Stack(alignment: Alignment.center, children: [
                                  Container(
                                    height: h,
                                    width: w,
                                    decoration: BoxDecoration(image: DecorationImage(image: NetworkImage("${e['bgImg']}"), fit: BoxFit.cover)),
                                    child: Center(
                                      child: Text(
                                        "${e['quote']}",
                                        style: const TextStyle(color: Colors.white, fontSize: 20),
                                      ),
                                    ),
                                  ),
                                ]),
                              );

                              final temp = await getTemporaryDirectory();
                              final path = '${temp.path}/image.jpg';
                              File(path).writeAsBytesSync(byte);
                              await Share.shareFiles([path]);

                            },
                            child: Icon(Icons.share_outlined,
                              color: Colors.red,
                              size: 22,
                            ),
                          ),
                        GestureDetector(
                          onTap: () async {
                            Uint8List imageBytes = await screenshotController.captureFromWidget(
                              Stack(
                                alignment: Alignment.center,
                                children: [
                                Container(
                                      height: h,
                                      width: w,
                                      decoration: BoxDecoration(image: DecorationImage(image: NetworkImage("${e['bgImg']}"), fit: BoxFit.cover)),
                                      child: Center(
                                        child: Text(
                                          "${e['quote']}",
                                          style: const TextStyle(color: Colors.white, fontSize: 20),
                                        ),
                                      ),
                                    ),
                                ],
                              ),
                            );
                            saveImage(imageBytes);
                            // Uint8List? imageBytes = await screenshotController.captureFromWidget(
                            //   Stack(alignment: Alignment.center, children: [
                            //     Container(
                            //       height: h,
                            //       width: w,
                            //       decoration: BoxDecoration(image: DecorationImage(image: NetworkImage("${e['bgImg']}"), fit: BoxFit.cover)),
                            //       child: Center(
                            //         child: Text(
                            //           "${e['quote']}",
                            //           style: const TextStyle(color: Colors.white, fontSize: 20),
                            //         ),
                            //       ),
                            //     ),
                            //   ]),
                            // );
                            // saveImage(imageBytes);
                            // ignore: use_build_context_synchronously
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text("Download.."),
                                behavior: SnackBarBehavior.floating,
                              ),
                            );
                          },
                          child: Icon(Icons.download_rounded,
                            color: Colors.pinkAccent,
                            size: 24,
                          ),
                        ),
                        GestureDetector(
                          onTap: (){
                            setState(() {
                              favourite.add(e);
                              print("favvvvv $favourite");
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text("Added To Favourites"),
                                  behavior: SnackBarBehavior.floating,
                                  duration: Duration(seconds: 2),
                                ),
                              );
                            });
                          },
                          child: Icon(Icons.star_border,
                            color: Colors.orange,
                            size: 26,
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
