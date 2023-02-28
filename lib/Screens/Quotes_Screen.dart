import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:life_quotes/Utils/global.dart';
import 'package:clipboard/clipboard.dart';
import 'package:share_plus/share_plus.dart';

class QuotesScreen extends StatefulWidget {
  const QuotesScreen({Key? key}) : super(key: key);

  @override
  State<QuotesScreen> createState() => _QuotesScreenState();
}

class _QuotesScreenState extends State<QuotesScreen> {
  @override
  Widget build(BuildContext context) {
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
      body: ListView.builder(
        itemCount: list.length,
          itemBuilder: (context,index){
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
                              image: NetworkImage("${list[index]['bgImg']}"),
                              fit: BoxFit.cover
                          )
                      ),
                      alignment: Alignment.center,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text("${list[index]['quote']}",
                          style: TextStyle(
                              color: Colors.white
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                    SizedBox(height: 15,),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          GestureDetector(
                            onTap: (){
                              setState(() {
                                if(imgChangeNum <= 11)
                                  {
                                    imgChangeNum++;
                                    print(imgChangeNum);
                                  }
                                else if(imgChangeNum == 12)
                                  {
                                    imgChangeNum = 0;
                                  }
                              });
                            },
                            child: Icon(Icons.ac_unit,
                              color: Colors.green,
                              size: 30,
                            ),
                          ),
                          GestureDetector(
                            onTap: (){
                              setState(() {
                                FlutterClipboard.copy(list[index]['quote']).then(( value ) =>
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
                              size: 25,
                            ),
                          ),
                          GestureDetector(
                            onTap: (){
                              setState(() {
                                Share.share('text',subject: "demo");
                              });
                            },
                            child: Icon(Icons.share_outlined,
                              color: Colors.red,
                              size: 25,
                            ),
                          ),
                          Icon(Icons.download_rounded,
                            color: Colors.pinkAccent,
                            size: 30,
                          ),
                          Icon(Icons.star_border,
                            color: Colors.orange,
                            size: 30,
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            );
          }),
    );
  }
}
