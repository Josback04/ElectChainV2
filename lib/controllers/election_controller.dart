import 'dart:math';

import 'package:tfc_vend_18_5h/controllers/controllers.dart';
import 'package:tfc_vend_18_5h/models/models.dart';
import 'package:tfc_vend_18_5h/services/database.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

//fonction pour générer le code d'accès à l'élection grace a un mix de int et stringz

const _chars = 'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';
Random _random = Random();

String getRandomString(int length) => String.fromCharCodes(Iterable.generate(
    length, (_) => _chars.codeUnitAt(_random.nextInt(_chars.length))));

class ElectionController extends GetxController {
  Rx<ElectionModel> _electionModel = ElectionModel().obs;
  ElectionModel currentElection = ElectionModel();

  ElectionModel get election => _electionModel.value;

  set election(ElectionModel value) => this._electionModel.value = value;

  bool endElection() {
    _electionModel.value.endDate = DateTime.now().toString();
    return true;
  }

  ElectionModel fromDocumentSnapshot(DocumentSnapshot doc) {
    ElectionModel _election = ElectionModel();

    _election.id = doc.id;
    _election.accessCode = doc['accessCode'];
    _election.description = doc['description'];
    _election.endDate = doc['endDate'];
    _election.name = doc['name'];
    _election.options = doc['options'];
    _election.startDate = doc['startDate'];
    _election.voted = doc['voted'];
    _election.owner = doc['owner'];
    return _election;
  }

  createElection(name, description, startDate, endDate) {
    ElectionModel election = ElectionModel(
        accessCode: getRandomString(6),
        name: name,
        voted: [],
        owner: Get.find<UserController>().user.id,
        description: description,
        startDate: startDate,
        endDate: endDate);
    DataBase().createElection(election);
  }

  candidatesStream(String _uid, String _electionId) {
    DataBase().candidatesStream(_uid, _electionId);
  }

// Code pour copier un document depuis le presse papier.
  copyAccessCode(String code) {
    Clipboard.setData(ClipboardData(text: code));
    Get.snackbar(
      'COPYING ACCESS CODE',
      'Access code copied successfully',
      backgroundColor: Colors.green,
      snackPosition: SnackPosition.TOP,
      barBlur: 0.0,
      overlayBlur: 0.0,
      margin: const EdgeInsets.only(top: 200.0),
      icon: Icon(
        Icons.check_circle,
        color: Colors.green,
      ),
      backgroundGradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Colors.indigo[300]!, Colors.blue]),
    );
  }

  getElection(String _uid, String _electionID) {
    DataBase().getElection(_uid, _electionID).then(
        (_election) => Get.find<ElectionController>().election = _election);
  }
}
