import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:elections/features/elections/models/elections_model.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  Map<String, dynamic> testJson = {
    'electionsStartDate': Timestamp(2020, 20),
    'electionsEndDate': Timestamp(2020, 20),
    'candidates': ['candidate1', 'candidate2'],
  };
  group('test elections model', () {
    test('test elections model from json', () {
      // arrange
      // act
      final result = ElectionsModel.fromData(testJson, 'docId');
      // assert
      expect(result, isInstanceOf<ElectionsModel>());
      expect(result.candidates, isA<List>());
      expect(result.candidates.length, 2);
      expect(result.candidates[0], 'candidate1');
      expect(result.candidates[1], 'candidate2');
      expect(result.electionsStartDate, isA<DateTime>());
      expect(result.electionsEndDate, isA<DateTime>());
      expect(result.docId, 'docId');
    });
    test('test elections model to json', () {
      // arrange
      final electionsModel = ElectionsModel.fromData(testJson, 'docId');
      // act
      final result = electionsModel.toJson();
      // assert
      expect(result, isA<Map<String, dynamic>>());
      expect(result['candidates'], isA<List>());
      expect(result['candidates'].length, 2);
      expect(result['candidates'][0], 'candidate1');
      expect(result['candidates'][1], 'candidate2');
      expect(result['electionsStartDate'], isA<String>());
      expect(result['electionsEndDate'], isA<String>());
    });
  });
}
