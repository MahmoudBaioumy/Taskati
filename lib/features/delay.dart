import 'package:flutter/material.dart';
import 'package:flutter_application_2/core/network/local_storage.dart';
import 'package:flutter_application_2/core/utils/Text_style.dart';
import 'package:flutter_application_2/features/home/Home_view.dart';
import 'package:flutter_application_2/features/Upload/upload_view.dart';
import 'package:gap/gap.dart';
import 'package:lottie/lottie.dart';

class delay extends StatefulWidget {
  const delay({super.key});

  @override
  State<delay> createState() => _delayState();
}

class _delayState extends State<delay> {
  @override
  void initState() {
    //to check if state is true or false
    bool isupload = Applocal.getData(Applocal.ISUPLOAD_KEY) ?? false;
    Future.delayed(const Duration(seconds: 5), () {
      Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (context) => isupload ? const HomeView() : const camera()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Lottie.asset('assets/logo.json'),
            const SizedBox(
              height: 5,
            ),
            Text(
              'Taskati',
              style: getTitelStyle(
                  fontSize: 24, color: Theme.of(context).primaryColor),
            ),
            const Gap(15),
            Text(
              'it\'s Time to Get Organzied',
              style: getSmalStyle(color: Theme.of(context).primaryColor),
            ),
          ],
        ),
      ),
    );
  }
}
