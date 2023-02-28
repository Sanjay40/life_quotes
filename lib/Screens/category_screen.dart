import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:life_quotes/Utils/global.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({Key? key}) : super(key: key);

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xffFFFFFF),
        elevation: 0,
        leading: GestureDetector(
          onTap: (){
            Navigator.pop(context);
          },
          child: Icon(Icons.arrow_back,
          color: Colors.black,
          ),
        ),
        title: Text("Quotes by Category",
        style: GoogleFonts.poppins(
          fontSize: 18,
          fontWeight: FontWeight.w600,
          color: Colors.black,
          letterSpacing: 0.5,
        ),
        ),
      ),
      body: ListView.builder(
        itemCount: uniqueList.length,
          itemBuilder: (context,index){
            return GestureDetector(
              onTap: (){
                Navigator.pushNamed(context, 'Quotes');
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 15),
                child: Column(
                  children: [
                    Row(
                      children: [
                        CircleAvatar(
                          radius: 30,
                          backgroundColor: Colors.amber,
                          child: Text("${uniqueList[index]['category'][0]}${uniqueList[index]['category'][1]}",
                          style: GoogleFonts.lobsterTwo(
                            fontWeight: FontWeight.w600,
                            letterSpacing: 0.2,
                            fontSize: 25,
                            color: Colors.white
                          ),
                          ),
                        ),
                        SizedBox(width: 10,),
                        Text("${uniqueList[index]['category']}",
                        style: GoogleFonts.poppins(
                          fontSize: 16,
                          letterSpacing: 0.2,
                          fontWeight: FontWeight.w600
                        ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10,),
                    Align(
                      alignment: Alignment.topRight,
                      child: Container(
                        height: 0.4,
                        width: 330,
                        color: Colors.grey.shade200,
                      ),
                    )
                  ],
                ),
              ),
            );
          },
      ),
      backgroundColor: Color(0xffFFFFFF),
    );
  }
}
