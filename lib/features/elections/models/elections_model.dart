// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

class ElectionsModel extends Equatable {
  final DateTime electionsStartDate;
  final DateTime electionsEndDate;
  final List<String> candidates;
  final String docId;
  const ElectionsModel({
    required this.electionsStartDate,
    required this.electionsEndDate,
    required this.candidates,
    required this.docId,
  });

  factory ElectionsModel.fromData(Map<String, dynamic> json, String docId) {
    return ElectionsModel(
      electionsStartDate: (json['electionsStartDate'] as Timestamp).toDate(),
      electionsEndDate: (json['electionsEndDate'] as Timestamp).toDate(),
      candidates: List<String>.from(json['candidates']),
      docId: docId,
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'electionsStartDate': electionsStartDate.toIso8601String(),
      'electionsEndDate': electionsEndDate.toIso8601String(),
      'candidates': candidates,
    };
  }

  @override
  List<Object?> get props => [
        electionsStartDate,
        electionsEndDate,
        candidates,
        docId,
      ];
}
