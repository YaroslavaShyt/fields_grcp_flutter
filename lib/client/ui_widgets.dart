import 'package:flutter/material.dart';

final List<Color> colors = [Colors.blueGrey, Colors.blue, Colors.green, Colors.yellow, Colors.deepOrangeAccent, Colors.red];

class ListElement extends StatelessWidget {
  final String category;
  final String data;
  const ListElement({Key? key, required this.data, required this.category}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Column(
        children: [
          Row(children: [
              Text(category, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w600),),
              Text(data, style: const TextStyle(fontSize: 20),),
          ]),
          const SizedBox(height: 15,)
        ]);
  }
}

class ListSpecialElement extends StatelessWidget {
  final String category;
  final String data;
  const ListSpecialElement({Key? key, required this.data, required this.category}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [ Row(children: [
      Text(category, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w600),),
      Text(data, style: const TextStyle(fontSize: 20),),
      Container(
        height: 20,
        width: 20,
        decoration: BoxDecoration(
            color: defineColor(category, data[4]),
            borderRadius: BorderRadius.circular(5)
        ),
      ),
    ],),
        const SizedBox(height: 15,)
      ]);
  }}


  Color defineColor(String name, String value){
    var newValue = double.parse(value);
    if (name == 'Фосфор'){
      if(newValue <= 20){
        return colors[0];
      }else if (newValue <= 50){
        return colors[1];
      }else if(newValue <= 100){
        return colors[2];
      }else if(newValue <= 150){
        return colors[3];
      }else if(newValue <= 200){
        return colors[4];
      }else{
        return colors[5];
      }
    }else if(name == 'Калій'){
      if(newValue <= 20){
        return colors[0];
      }else if (newValue <= 40){
        return colors[1];
      }else if(newValue <= 80){
        return colors[2];
      }else if(newValue <= 120){
        return colors[3];
      }else if(newValue <= 180){
        return colors[4];
      }else{
        return colors[5];
      }
    }else if(name == 'Азот'){
      if (newValue <= 10){
        return colors[1];
      }else if(newValue <= 30){
        return colors[2];
      }else{
        return colors[5];
      }
    }else if(name == 'Гумус'){
      if(newValue <= 2.0){
        return colors[0];
      }else if (newValue <= 3.0){
        return colors[1];
      }else if(newValue <= 4.0){
        return colors[2];
      }else if(newValue <= 5.0){
        return colors[3];
      }else if(newValue <= 6.0){
        return colors[4];
      }else{
        return colors[5];
      }
    }
    return Colors.white;
  }
