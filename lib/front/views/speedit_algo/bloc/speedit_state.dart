import 'package:flutter/material.dart';

@immutable
abstract class SpeeditState {}

class SpeeditClearState extends SpeeditState {}

class SpeeditResultState extends SpeeditState {
  final String articles;
  final String result;

  SpeeditResultState({required this.articles, required this.result});
}
