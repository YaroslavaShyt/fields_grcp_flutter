import 'package:fields_grcp/client/ui_widgets.dart';
import 'package:grpc/grpc.dart';
import 'package:fields_grcp/src/protos/fields.pbgrpc.dart';
import 'package:flutter/material.dart';

Future<FieldResponse> getFields(String value) async {
  final channel = ClientChannel('000.000.0.0', //your host
      port: 8080,
      options: const ChannelOptions(credentials: ChannelCredentials.insecure()));
  final client = FieldServiceClient(channel);

  final request = FieldRequest()..data = value;
  final response = await client.getFields(request);
  await channel.shutdown();
  return response;
}



class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController _controller = TextEditingController();
  late List<dynamic> data = [];
  final List<String> levels = ['Дуже низький', 'Низький', 'Середній', 'Підвищений', 'Високий', 'Дуже високий'];

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
      appBar: AppBar(
        title: const Text('Агроекологія поля'),
        backgroundColor: Colors.green,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
        const SizedBox(height: 50),
        Padding(padding: const EdgeInsets.only(left: 30, right: 30),
            child: TextFormField(
          controller: _controller,
          style: const TextStyle(
            fontSize: 20
          ),
                decoration: const InputDecoration(
                  labelText: 'Введіть назву поля',
                  labelStyle: TextStyle(
                    fontSize: 18,
                    color: Colors.grey,
                  ),
                  border: OutlineInputBorder(),)
        )),
        const SizedBox(height: 20,),
        OutlinedButton(onPressed: () async{
          final response = await getFields(_controller.text);
          final splitData = response.message.split('\n');
          setState(() {
            data = splitData;
          });

        }, child: const Text('Пошук')),
        const SizedBox(height: 20,),
        const Text('Знайдені дані:', style: TextStyle(fontSize: 25),),
         const SizedBox(height: 30,),
         Wrap(
          children: [
            for (var i = 0; i < colors.length; i++)
            Padding(padding: const EdgeInsets.only(left: 20),
              child: Column(children: [
              Container(
                height: 20,
                width: 20,
                decoration: BoxDecoration(
                    color: colors[i],
                    borderRadius: BorderRadius.circular(5)
                ),
              ),
               Text(levels[i], style: const TextStyle(fontSize: 15),)
            ],)),
        ],),
        const SizedBox(height: 30,),
        if(data.isNotEmpty)
        SizedBox(
            height: 400,
            child:
        Padding(
          padding: const EdgeInsets.only(left: 10, right: 10),
            child:ListView(children: [
              ListElement(data: data[0], category: 'Назва поля: '),
              ListElement(data: data[1], category: 'Площа: '),
              ListElement(data: data[2], category: 'bal: '),
              ListElement(data: data[3], category: 'pH: '),
              ListSpecialElement(data: data[4], category: 'Гумус: '),
              ListSpecialElement(data: data[5], category: 'Азот: '),
              ListSpecialElement(data: data[6], category: 'Фосфор: '),
              ListSpecialElement(data: data[7], category: 'Калій: '),
        ])))
      ],),
    ));
  }
}

