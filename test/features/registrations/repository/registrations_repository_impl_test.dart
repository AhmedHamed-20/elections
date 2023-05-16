import 'package:elections/features/registrations/data/base_registrations_data_source.dart';
import 'package:elections/features/registrations/repository/registrations_repository_impl.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';

import 'registrations_repository_impl_test.mocks.dart';

@GenerateMocks([BaseRegistrationsDataSource])
void main() {
  late final BaseRegistrationsDataSource baseRegistrationsDataSource;
  late final RegistrationsRepositoryImpl registrationsRepositoryImpl;

  setUp(() {
    baseRegistrationsDataSource = MockBaseRegistrationsDataSource();
    registrationsRepositoryImpl =
        RegistrationsRepositoryImpl(baseRegistrationsDataSource);
  });

  group('test Registrations repository', () {
    test(
        'signUpWithEmailAndPassword should return UserCredential on right when success',
        () => null);
  });
}
