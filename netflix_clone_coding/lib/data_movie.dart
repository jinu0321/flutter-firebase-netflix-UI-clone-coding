import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:netflix_clone_coding/model/model_movie.dart';
import 'package:flutter/material.dart';

class DataMovie {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  late CollectionReference<Map<String, dynamic>> collection;
  late DocumentReference<Map<String, dynamic>> movieDocRef;

  DataMovie() {
    collection = firestore.collection('movie');
    movieDocRef = collection.doc('movie1');
  }

  List<Movie> getData() {
    List<Movie> movies = [];



    return movies;
  }

}