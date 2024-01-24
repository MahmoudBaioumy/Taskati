import 'package:flutter/material.dart';
import 'package:flutter_application_2/add_task.dart';

class delay extends StatefulWidget {
  const delay({super.key});

  @override
  State<delay> createState() => _delayState();
}

class _delayState extends State<delay> {
  @override
  void initState() {
  Future.delayed(Duration(seconds: 4), () {
   Navigator.of(context).pushReplacement(MaterialPageRoute(
   builder: (context) => add_task(),
   ));
   });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/delay.PNG'),
            SizedBox(
              height: 5,
            ),
            Text(
              'Taskati',
              style: TextStyle(fontSize: 35, fontWeight: FontWeight.w400),
            ),
            SizedBox(
              height: 15,
            ),
            Text(
              'it\'s Time to Get Organzied',
              style: TextStyle(color: Colors.grey, fontSize: 15),
            ),
          ],
        ),
      ),
    );
  }
}
