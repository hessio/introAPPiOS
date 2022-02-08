import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';

class AppUser {
  String id;
  String name;
  int age;
  String profilePhotoPath;
  String bio = "";
  String location;
  String userGender;
  String preferredMatchGender;

  AppUser(
      {@required this.id,
      @required this.name,
      @required this.age,
      @required this.profilePhotoPath,
      @required this.userGender,
      @required this.preferredMatchGender,
      @required this.location,});

  AppUser.fromSnapshot(DocumentSnapshot snapshot) {
    id = snapshot['id'];
    name = snapshot['name'];
    age = snapshot['age'];
    profilePhotoPath = snapshot['profile_photo_path'];
    bio = snapshot.get('bio') ?? '';
    location = snapshot.get('location');
    userGender = snapshot.get('userGender');
    preferredMatchGender = snapshot.get('preferredMatchGender');
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'age': age,
      'profile_photo_path': profilePhotoPath,
      'bio': bio,
      'location': location,
      'userGender': userGender,
      'preferredMatchGender': preferredMatchGender
    };
  }
}
