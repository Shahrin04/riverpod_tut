import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_tut/page/change_notifier_page.dart';
import 'package:riverpod_tut/page/future_provider_page.dart';
import 'package:riverpod_tut/page/provider_page.dart';
import 'package:riverpod_tut/page/state_notifier_page.dart';
import 'package:riverpod_tut/page/state_provider.dart';
import 'package:riverpod_tut/page/stream_provider_page.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'RiverPod',),
    );
  }
}


class MyHomePage extends StatefulWidget {
  final String title;
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width * 0.8;
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          children: [
            ElevatedButton(onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => const ProviderPage()));
            },
                style: ElevatedButton.styleFrom(fixedSize: Size(width, 0)),
                child: const Text('Provider')),
            ElevatedButton(onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => const StateProviderPage()));
            },
                style: ElevatedButton.styleFrom(fixedSize: Size(width, 0)),
                child: const Text('State Provider')),
            ElevatedButton(onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => const FutureProviderPage()));
            },
                style: ElevatedButton.styleFrom(fixedSize: Size(width, 0)),
                child: const Text('Future Provider')),
            ElevatedButton(onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => const StreamProviderPage()));
            },
                style: ElevatedButton.styleFrom(fixedSize: Size(width, 0)),
                child: const Text('Stream Provider')),
            ElevatedButton(onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => const ChangeNotifierPage()));
            },
                style: ElevatedButton.styleFrom(fixedSize: Size(width, 0)),
                child: const Text('Change Notifier Provider')),
            ElevatedButton(onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => const StateNotifierPage()));
            },
                style: ElevatedButton.styleFrom(fixedSize: Size(width, 0)),
                child: const Text('State Notifier Provider')),
          ],
        ),
      ),
    );
  }
}

