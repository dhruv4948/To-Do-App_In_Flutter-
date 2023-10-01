import 'package:to_do_app/home.dart';
import 'package:flutter/material.dart';
void main(){
  runApp(home());
}
class home  extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      title: "HomeScreen",
      theme: ThemeData(primarySwatch: Colors.cyan),
      debugShowCheckedModeBanner: false,
      home: MyWidget(),
    );
  }
}