import 'package:flutter/material.dart';

class TestView extends StatefulWidget {


  const TestView({super.key});

  @override
  State<TestView> createState() => _TestViewState();
}

class _TestViewState extends State<TestView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Test'),
      ),
      body: Center(
        child: ElevatedButton(onPressed: (){
          // Navigator.push(
          //         context,
          //         MaterialPageRoute(
          //           builder: (context) => DetailProduct(),
          //         ));
          Navigator.pop(context);
        }, 
        child: Text("Voltar para detalhe"),),
      ),
    );
  }
}