import 'package:tfc_vend_18_5h/screens/screens.dart';
import 'package:get/get.dart';
import 'package:tfc_vend_18_5h/models/add_vote_option.dart';
import 'package:tfc_vend_18_5h/models/models.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class CandidateController extends GetxController {
  CandidateModel fromDocumentSnapshot(DocumentSnapshot doc) {
    CandidateModel _candidate = CandidateModel();
    _candidate.name = doc['name'];
    _candidate.description = doc['description'];
    return _candidate;
  }
}
