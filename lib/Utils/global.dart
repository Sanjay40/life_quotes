import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';

List<Map<String,dynamic>> list = [];
List<Map<String,dynamic>> uniqueList = [];
  int imgChangeNum = 0;
int? favouriteNum;

List favourite = [];
// Future<int> updateStatic(
//     {Map<String, dynamic>? row, String? table, String? id}) async {
//   Database? db = await database;
//   return await db!
//       .update(table!, row!, where: '$columnId = ?', whereArgs: [id]);
// }


// class Variable{
//   static List<Map<String,dynamic>> drawer = [
//     {
//       'icon' : Icon(Icons.topic,color: Colors.green,),
//       'name' : 'By Topic'
//     },
//     {
//       'icon' : Icon(Icons.person),
//       'name' : 'By Author'
//     },
//     {
//       'icon' : Icon(Icons.star,color: Colors.yellow,),
//       'name' : 'Favourite'
//     },
//     {
//       'icon' : Icon(Icons.lightbulb_rounded,color: Colors.amber,),
//       'name' : 'Quote Of The Day'
//     },
//     {
//       'icon' : Icon(Icons.star,color: Colors.yellow,),
//       'name' : 'Favourite Pictures'
//     },
//     {
//       'icon' : Icon(Icons.ondemand_video_rounded,color: Colors.red,),
//       'name' : 'Videos'
//     },
//   ];
// }