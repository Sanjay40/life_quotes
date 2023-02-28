import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/services.dart';
import 'package:life_quotes/Screens/category_screen.dart';
import 'package:sqflite/sqflite.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'Screens/Quotes_Screen.dart';
import 'Screens/author_screen.dart';
import 'Screens/home_screen.dart';
import 'package:path_provider/path_provider.dart';
import 'package:google_fonts/google_fonts.dart';
import 'Utils/global.dart';

Future<void> copyDate() async{
  Directory documentDirectory =  await getApplicationDocumentsDirectory();
  String path = join(documentDirectory.path,'Quote.db');

  bool fileExists = await databaseExists(path);

  if(!fileExists){
    ByteData data = await rootBundle.load(join('images/QuoteTable.db'));

    List<int> bytes = data.buffer.asUint8List(data.offsetInBytes,data.lengthInBytes);
    await File(path).writeAsBytes(bytes);
  }
}

void main()async{
  WidgetsFlutterBinding.ensureInitialized();
  await copyDate();
  Directory documentsDirectory = await getApplicationDocumentsDirectory();
  String path = join(documentsDirectory.path, 'Quote.db');
  Database database = await openDatabase(path);

  list = await database.rawQuery('SELECT * FROM Quote');
  //print(list);
  for (var row in list) {
    print(row);
  }

  runApp(
    MaterialApp(
      theme: ThemeData(
          appBarTheme: AppBarTheme(
            titleTextStyle: GoogleFonts.poppins(
              color: Colors.black,
              fontWeight: FontWeight.w700,
              fontSize: 18,
            ),
          ),
          textTheme: TextTheme(
            bodyText2: GoogleFonts.poppins(),
          )
      ),
      routes: {
        '/' : (context) => const HomeScreen(),
        'category' : (context) => CategoryScreen(),
        'author' : (context) => AuthorScreen(),
        'Quotes' : (context) => QuotesScreen(),
      },
    ),
  );
}