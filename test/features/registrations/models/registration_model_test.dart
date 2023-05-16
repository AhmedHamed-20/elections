import 'package:elections/features/registrations/models/registration_model.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  const Map<String, dynamic> testJson = {
    'email': 'email',
    'name': 'name',
    'uid': 'uid',
    'isVote': true,
    'nationalNumber': 123456789,
    'identityImageUrl': 'identityImageUrl',
  };
  group('registrations model test', () {
    test('test registartions model from json', () {
      FireStoreUserDataModel fireStoreUserDataModel =
          FireStoreUserDataModel.fromJson(testJson);

      expect(fireStoreUserDataModel.email, testJson['email']);
      expect(fireStoreUserDataModel.name, testJson['name']);
      expect(fireStoreUserDataModel.uid, testJson['uid']);
      expect(fireStoreUserDataModel.isVote, testJson['isVote']);
      expect(fireStoreUserDataModel.nationalNumber, testJson['nationalNumber']);
      expect(fireStoreUserDataModel.identityImageUrl,
          testJson['identityImageUrl']);
    });

    test('test registartions model to json', () {
      FireStoreUserDataModel fireStoreUserDataModel =
          FireStoreUserDataModel.fromJson(testJson);
      expect(fireStoreUserDataModel.toJson(), testJson);
    });
  });
}
