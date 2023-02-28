import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:life_quotes/Utils/global.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  
  void initState(){
    
    Set<String> categories = Set<String>.from(list.map((e) => e['category']));

    uniqueList = categories.map((e) => {'category' : e}).toList();
  }
  
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xffFFFFFF),
        elevation: 0,
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
                onPressed: (){
                  Scaffold.of(context).openDrawer();
                },
                icon: Icon(Icons.menu_rounded,
                color: Colors.black,
                ),
            );
          },
        ),
        title: Text("Life Quotes and Sayings",
        style: GoogleFonts.poppins(
          fontWeight: FontWeight.w600
        ),
        ),
        actions: const [
          Icon(Icons.notifications_active,
          color: Colors.yellow,
          ),
          SizedBox(width: 10,),
          Icon(Icons.favorite,
          color: Colors.red,
          ),
          SizedBox(width: 5,),
        ],
      ),
      drawer: Drawer(
        width: 250,
        child: Column(
          children: [
            Expanded(flex : 1 ,
              child: Container(
             decoration: BoxDecoration(
               gradient: LinearGradient(
                 colors: [
                   Color(0xff0C919A),
                   Color(0xff0FA9B5),
                 ],
               )
             ),
                alignment: Alignment.center,
                child: Text("Life Quotes and Sayings",
                style: GoogleFonts.lobsterTwo(
                  color: Colors.white,
                  fontSize: 30,
                  fontWeight: FontWeight.w600,
                ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            Expanded(
                flex : 3 ,
                child: Container(
                  color: Colors.white,
                    child: Padding(
                      padding: const EdgeInsets.all(15),
                      child: Column(
                        children: [
                          SizedBox(height: 10,),
                          GestureDetector(
                            onTap: (){
                              Navigator.pushNamed(context, 'category');
                            },
                            child: Row(
                              children: [
                                Icon(Icons.topic,color: Colors.green,),
                                const SizedBox(width: 10,),
                                Text("By Topic",
                                  style: GoogleFonts.poppins(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 12,
                                      letterSpacing: 0.5
                                  ),
                                )
                              ],
                            ),
                          ),
                          SizedBox(height: 30,),
                          GestureDetector(
                            onTap: (){
                              Navigator.pushNamed(context,  'author');
                            },
                            child: Row(
                              children: [
                                Icon(Icons.person),
                                const SizedBox(width: 10,),
                                Text("By Author",
                                  style: GoogleFonts.poppins(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 12,
                                      letterSpacing: 0.5
                                  ),
                                )
                              ],
                            ),
                          ),
                          SizedBox(height: 30,),
                          Row(
                            children: [
                              Icon(Icons.star,color: Colors.yellow,),
                              const SizedBox(width: 10,),
                              Text("Favourite",
                                style: GoogleFonts.poppins(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 12,
                                    letterSpacing: 0.5
                                ),
                              )
                            ],
                          ),
                          SizedBox(height: 30,),
                          Row(
                            children: [
                              Icon(Icons.lightbulb_rounded,color: Colors.amber,),
                              const SizedBox(width: 10,),
                              Text("Quote Of The Day",
                                style: GoogleFonts.poppins(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 12,
                                    letterSpacing: 0.5
                                ),
                              )
                            ],
                          ),
                          SizedBox(height: 30,),
                          Row(
                            children: [
                              Icon(Icons.star,color: Colors.yellow,),
                              SizedBox(width: 10,),
                              Text("Favourite Pictures",
                                style: GoogleFonts.poppins(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 12,
                                    letterSpacing: 0.5
                                ),
                              )
                            ],
                          ),
                          SizedBox(height: 30,),
                          Row(
                            children: [
                              Icon(Icons.ondemand_video_rounded,color: Colors.red,),
                              const SizedBox(width: 10,),
                              Text("Videos",
                                style: GoogleFonts.poppins(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 12,
                                    letterSpacing: 0.5
                                ),
                              )
                            ],
                          ),
                        ]
                      ),
                    ),
                  ),
                ),
          ],
        ),
      ),
      body: ListView(
        physics: BouncingScrollPhysics(),
        children: [
          CarouselSlider(
            items: list.map((e){
              return ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Container(
                    margin: EdgeInsets.symmetric(vertical: 10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      image: DecorationImage(
                        image: NetworkImage("${e['bgImg']}"),
                        fit: BoxFit.fill
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
                ),
              );
            }).toList(),
            options: CarouselOptions(
              viewportFraction: 1,
              initialPage: 0,
              aspectRatio: 16 / 9,
              autoPlay: true,
              autoPlayInterval: const Duration(seconds: 5),
              autoPlayAnimationDuration: const Duration(milliseconds: 1200),
            ),
          ),
          SizedBox(height: 10,),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30,vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    GestureDetector(
                      onTap : (){
                        Navigator.pushNamed(context, 'category');
                      },
                      child: Container(
                        height: 50,
                        width: 50,
                        decoration: BoxDecoration(
                          color: Color(0xffA25684),
                          borderRadius: BorderRadius.circular(10)
                        ),
                        alignment: Alignment.center,
                        child: Icon(Icons.category_outlined,
                        color: Colors.white,
                          size: 28,
                        ),
                      ),
                    ),
                    SizedBox(height: 2,),
                    Text("Categories",
                    style: GoogleFonts.poppins(
                      color: Colors.black,
                      fontWeight: FontWeight.w500,
                      fontSize: 12
                    ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    GestureDetector(
                      onTap: (){
                        Navigator.pushNamed(context, 'Quotes');
                      },
                      child: Container(
                        height: 50,
                        width: 50,
                        decoration: BoxDecoration(
                            color: Color(0xff748AC4),
                            borderRadius: BorderRadius.circular(10)
                        ),
                        alignment: Alignment.center,
                        child: Icon(Icons.image_outlined,
                          color: Colors.white,
                          size: 28,
                        ),
                      ),
                    ),
                    SizedBox(height: 2,),
                    Text("Pic Quotes",
                      style: GoogleFonts.poppins(
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                          fontSize: 12
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Container(
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                          color: Color(0xffB7913E),
                          borderRadius: BorderRadius.circular(10)
                      ),
                      alignment: Alignment.center,
                      child: Icon(Icons.settings_rounded,
                        color: Colors.white,
                        size: 28,
                      ),
                    ),
                    SizedBox(height: 2,),
                    Text("Latest Quotes",
                      style: GoogleFonts.poppins(
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                          fontSize: 12
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Container(
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                          color: Color(0xff6C9978),
                          borderRadius: BorderRadius.circular(10)
                      ),
                      alignment: Alignment.center,
                      child: Icon(Icons.menu_book_outlined,
                        color: Colors.white,
                        size: 28,
                      ),
                    ),
                    SizedBox(height: 2,),
                    Text("Articles",
                      style: GoogleFonts.poppins(
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                          fontSize: 12
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),

          // ======== qutos by category ============

          SizedBox(height: 13,),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Quotes by category",
                style: GoogleFonts.poppins(
                  color: Colors.black,
                  fontWeight: FontWeight.w800,
                  fontSize: 14,
                ),
                ),
                GestureDetector(
                  onTap: (){
                    Navigator.pushNamed(context, 'category');
                  },
                  child: Text("See All >",
                    style: GoogleFonts.poppins(
                      color: Colors.red,
                      fontWeight: FontWeight.w600,
                      fontSize: 12,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            height: 390,
            //color: Colors.black,
            child: GridView.count(
              physics: const NeverScrollableScrollPhysics(),
              childAspectRatio: 2.1/2,
                crossAxisCount: 2,
              children: uniqueList.map((e) {
                return GestureDetector(
                  onTap: (){
                    Navigator.pushNamed(context, 'Quotes');
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0,vertical: 10),
                    child: Container(
                      decoration: BoxDecoration(
                        //color: Colors.black,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Container(
                              height: 140,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                image: DecorationImage(
                                  image: NetworkImage("${list[uniqueList.indexOf(e)]['bgImg']}"),
                                  fit: BoxFit.cover
                                )
                              ),
                              //color: Colors.red,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 8.0,vertical: 5),
                            child: Text("${e['category']}",
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 13,
                              color: Colors.black
                            ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              }).toList(),
            ),
          ),

          // ======== qutos by author ============

          SizedBox(height: 13,),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Quotes by Author",
                  style: GoogleFonts.poppins(
                    color: Colors.black,
                    fontWeight: FontWeight.w800,
                    fontSize: 14,
                  ),
                ),
                GestureDetector(
                  onTap: (){
                    Navigator.pushNamed(context,  'author');
                  },
                  child: Text("See All >",
                    style: GoogleFonts.poppins(
                      color: Colors.red,
                      fontWeight: FontWeight.w600,
                      fontSize: 12,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            height: 390,
            //color: Colors.black,
            child: GridView.count(
              physics: const NeverScrollableScrollPhysics(),
              childAspectRatio: 2.1/2,
              crossAxisCount: 2,
              children: uniqueList.map((e) {
                return GestureDetector(
                  onTap: (){
                    Navigator.pushNamed(context, 'Quotes');
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0,vertical: 10),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Color(0xffFDE490),
                        //color: Colors.black,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      alignment: Alignment.center,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0,vertical: 5),
                        child: Text("${e['category']}",
                          style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 13,
                              color: Colors.black
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              }).toList(),
            ),
          ),
        ],
      ),
      backgroundColor: Color(0xffFFFFFF),
    );
  }
}
