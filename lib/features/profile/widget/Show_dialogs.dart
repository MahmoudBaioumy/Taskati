import 'package:flutter/material.dart';
import 'package:flutter_application_2/core/network/local_storage.dart';
import 'package:flutter_application_2/core/utils/colorsapp.dart';
import 'package:flutter_application_2/features/profile/profile.dart';
import 'package:gap/gap.dart';

ShowNameDialog(context, name) {
  var formkey = GlobalKey<FormState>();
  var textCon = TextEditingController(text: name);
  showModalBottomSheet(
    isScrollControlled: true,
    context: context,
    backgroundColor: Theme.of(context).scaffoldBackgroundColor,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
          topLeft: Radius.circular(25), topRight: Radius.circular(25)),
    ),
    builder: (BuildContext context) {
      return Padding(
        padding: MediaQuery.of(context).viewInsets,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 30),
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(25),
              bottomRight: Radius.circular(25),
            ),
          ),
          child: Form(
              key: formkey,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextFormField(
                    controller: textCon,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'You Name mustn\t be empty';
                      }
                      return null;
                    },
                    style: TextStyle(color: Theme.of(context).primaryColor),
                    decoration:
                        const InputDecoration(hintText: 'Enter Your Name'),
                  ),
                  const Gap(20),
                  GestureDetector(
                    onTap: () {
                      if (formkey.currentState!.validate()) {
                        Applocal.cashData(Applocal.NAME_KEY, textCon.text);
                        Navigator.of(context).pop();
                        Navigator.of(context).pushReplacement(MaterialPageRoute(
                          builder: (context) => const profile(),
                        ));
                      }
                    },
                    child: Container(
                      height: 45,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: colorsapp.primarycolor,
                      ),
                      child: Center(
                        child: Text(
                          'Upload Your Name',
                          style: TextStyle(color: colorsapp.whitecolor),
                        ),
                      ),
                    ),
                  )
                ],
              )),
        ),
      );
    },
  );
}

ShowImageDialog(context, {onTapCamera, onTapGallery}) {
  showModalBottomSheet(
    isScrollControlled: true,
    context: context,
    backgroundColor: Theme.of(context).scaffoldBackgroundColor,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
          topLeft: Radius.circular(25), topRight: Radius.circular(25)),
    ),
    builder: (BuildContext context) {
      return Padding(
        padding: MediaQuery.of(context).viewInsets,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 30),
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(25),
              bottomRight: Radius.circular(25),
            ),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: onTapCamera,
                child: Container(
                  height: 50,
                  width: double.infinity,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: colorsapp.primarycolor,
                  ),
                  child: Text(
                    'Upload from Camera',
                    style: TextStyle(color: colorsapp.whitecolor),
                  ),
                ),
              ),
              const Gap(20),
              GestureDetector(
                onTap: onTapGallery,
                child: Container(
                  height: 50,
                  width: double.infinity,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: colorsapp.primarycolor,
                  ),
                  child: Text(
                    'Upload from Gallary',
                    style: TextStyle(color: colorsapp.whitecolor),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    },
  );
}
