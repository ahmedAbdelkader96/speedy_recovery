

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:json_annotation/json_annotation.dart';


part 'speedyUser.g.dart';





// https://docs.flutter.dev/development/data-and-backend/json#serializing-json-using-code-generation-libraries
// ---------------------------
// *** Run -> flutter pub run build_runner build --delete-conflicting-outputs
//---------------------------



@JsonSerializable(explicitToJson: true)
class SpeedyUser {


  String id;
  String name;
  String email;
  String dynamicLink;




  SpeedyUser({
    required this.id,
    required this.name,
    required this.email,
    required this.dynamicLink,


  });
  //#endregion
  // --------------------------
  //#region JSON Serialization
  factory SpeedyUser.fromJson(Map<String, dynamic> json) => _$SpeedyUserFromJson(json);
  Map<String, dynamic> toJson() => _$SpeedyUserToJson(this);
  factory SpeedyUser.fromFirestoreSnapshot(QueryDocumentSnapshot? snapshot) {
    var obj = SpeedyUser.fromJson(snapshot?.data() as Map<String, dynamic>);
    // String id = snapshot?.reference.id ?? '';
    // obj.cardId = id;
    return obj;
  }

  factory SpeedyUser.fromDocumentSnapshot(DocumentSnapshot? documentSnapshot) {
    var obj = SpeedyUser.fromJson(documentSnapshot?.data() as Map<String, dynamic>);
    // String id = snapshot?.reference.id ?? '';
    // obj.cardId = id;
    return obj;
  }

//#endregion
// --------------------------
}
