import '../../../features/registrations/models/registration_model.dart';

abstract class BaseFireStoreService {
  Future<void> saveUserToFireStore(
      SaveUserToFireStoreModel saveUserToFireStoreModel);
}
