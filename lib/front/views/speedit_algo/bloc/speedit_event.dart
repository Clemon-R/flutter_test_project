import 'package:flutter/material.dart';

@immutable
abstract class SpeeditEvent {}

class SpeeditNewEntryEvent extends SpeeditEvent {
  final String articles;

  SpeeditNewEntryEvent({required this.articles});
}
