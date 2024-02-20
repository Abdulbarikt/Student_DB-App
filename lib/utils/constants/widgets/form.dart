import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:image_picker/image_picker.dart';
import '../../../controller/addstudent/bloc/add_student_bloc.dart';
import '../../../controller/addstudent/bloc/details/bloc/details_bloc.dart';
import '../constants.dart';

// ignore: must_be_immutable
class CustomFormWidget extends StatelessWidget {
  var bloc;
  var image;
  bool option;
  bool enabled;
  String? name;
  int? age;
  String? address;
  String? contact;
  String? bloodgroup;
  String? batch;
  int? index;

  CustomFormWidget({
    super.key,
    required this.bloc,
    required this.option,
    required this.enabled,
    this.name,
    this.age,
    this.address,
    this.contact,
    this.bloodgroup,
    this.batch,
    this.index,
    this.image,
  });

  final TextEditingController nameEditingController = TextEditingController();
  final TextEditingController ageEditingController = TextEditingController();
  final TextEditingController numberEditingController = TextEditingController();
  final TextEditingController addressEditingController =
      TextEditingController();
  final TextEditingController bloodEditingController = TextEditingController();
  final TextEditingController stdEditingController = TextEditingController();
  var myfile;
  late Uint8List imagebytes;
  var compressed;
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    nameEditingController.text = name ?? "";
    ageEditingController.text = age?.toString() ?? "";
    numberEditingController.text = contact ?? "";
    addressEditingController.text = address ?? "";
    bloodEditingController.text = bloodgroup ?? "";
    stdEditingController.text = batch ?? "";
    return Form(
      key: _formKey,
      child: Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          TextFormField(
            decoration: InputDecoration(
              enabled: enabled,
              border: const OutlineInputBorder(),
              hintText: Constants.nameHint,
              label: Text(Constants.nameString),
            ),
            controller: nameEditingController,
          ),
          const SizedBox(height: 20),
          TextFormField(
            maxLength: 2,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              enabled: enabled,
              border: const OutlineInputBorder(),
              hintText: Constants.ageHint,
              label: Text(Constants.ageString),
            ),
            controller: ageEditingController,
          ),
          const SizedBox(height: 20),
          TextFormField(
            maxLength: 10,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              enabled: enabled,
              border: const OutlineInputBorder(),
              hintText: Constants.numberHint,
              label: Text(Constants.contactString),
            ),
            controller: numberEditingController,
          ),
          const SizedBox(height: 20),
          TextFormField(
            decoration: InputDecoration(
              enabled: enabled,
              border: const OutlineInputBorder(),
              hintText: Constants.addressHint,
              label: Text(Constants.addressString),
            ),
            controller: addressEditingController,
          ),
          const SizedBox(height: 20),
          TextFormField(
            decoration: InputDecoration(
              enabled: enabled,
              border: const OutlineInputBorder(),
              hintText: Constants.bloodHint,
              label: Text(Constants.bloodString),
            ),
            controller: bloodEditingController,
          ),
          const SizedBox(height: 20),
          TextFormField(
            decoration: InputDecoration(
              enabled: enabled,
              border: const OutlineInputBorder(),
              hintText: Constants.divisionHint,
              label: Text(Constants.divisionString),
            ),
            controller: stdEditingController,
          ),
          const SizedBox(height: 20),
          ElevatedButton(
              onPressed: imagePick, child: Constants.imageButtonText),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: option ? add : update,
            child:
                option ? Constants.addButtonText : Constants.updateButtonText,
          ),
        ],
      ),
    );
  }

  add() {
    bloc.add(AddClickedEvent(
      name: nameEditingController.text,
      address: addressEditingController.text,
      age: int.parse(ageEditingController.text),
      bloodgrp: bloodEditingController.text,
      number: numberEditingController.text,
      division: stdEditingController.text,
      image: compressed,
    ));
    _formKey.currentState!.reset();
  }

  update() {
    bloc.add(UpdateStudentEvent(
      index: index!,
      name: nameEditingController.text,
      address: addressEditingController.text,
      age: int.parse(ageEditingController.text),
      bloodgrp: bloodEditingController.text,
      number: numberEditingController.text,
      division: stdEditingController.text,
      image: compressed ?? image,
    ));
  }

  imagePick() async {
    myfile = await ImagePicker().pickImage(source: ImageSource.gallery);
    imagebytes = await myfile!.readAsBytes();
    compressed =
        await FlutterImageCompress.compressWithList(imagebytes, quality: 85);
  }
}
