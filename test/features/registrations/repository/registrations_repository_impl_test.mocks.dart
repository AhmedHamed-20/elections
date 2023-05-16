// Mocks generated by Mockito 5.4.0 from annotations
// in elections/test/features/registrations/repository/registrations_repository_impl_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i5;

import 'package:cloud_firestore/cloud_firestore.dart' as _i3;
import 'package:elections/core/constants/params.dart' as _i6;
import 'package:elections/features/registrations/data/base_registrations_data_source.dart'
    as _i4;
import 'package:elections/features/registrations/models/registration_model.dart'
    as _i7;
import 'package:firebase_auth/firebase_auth.dart' as _i2;
import 'package:mockito/mockito.dart' as _i1;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

class _FakeUserCredential_0 extends _i1.SmartFake
    implements _i2.UserCredential {
  _FakeUserCredential_0(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeQuerySnapshot_1<T extends Object?> extends _i1.SmartFake
    implements _i3.QuerySnapshot<T> {
  _FakeQuerySnapshot_1(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

/// A class which mocks [BaseRegistrationsDataSource].
///
/// See the documentation for Mockito's code generation for more information.
class MockBaseRegistrationsDataSource extends _i1.Mock
    implements _i4.BaseRegistrationsDataSource {
  MockBaseRegistrationsDataSource() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i5.Future<_i2.UserCredential> signUpWithEmailAndPassword(
          _i6.CreateUserParams? params) =>
      (super.noSuchMethod(
        Invocation.method(
          #signUpWithEmailAndPassword,
          [params],
        ),
        returnValue: _i5.Future<_i2.UserCredential>.value(_FakeUserCredential_0(
          this,
          Invocation.method(
            #signUpWithEmailAndPassword,
            [params],
          ),
        )),
      ) as _i5.Future<_i2.UserCredential>);
  @override
  _i5.Future<_i2.UserCredential> signInWithEmailAndPassword(
          _i6.SignInUserParams? params) =>
      (super.noSuchMethod(
        Invocation.method(
          #signInWithEmailAndPassword,
          [params],
        ),
        returnValue: _i5.Future<_i2.UserCredential>.value(_FakeUserCredential_0(
          this,
          Invocation.method(
            #signInWithEmailAndPassword,
            [params],
          ),
        )),
      ) as _i5.Future<_i2.UserCredential>);
  @override
  _i5.Future<void> saveUserToFireStore(
          _i7.FireStoreUserDataModel? saveUserToFireStoreModel) =>
      (super.noSuchMethod(
        Invocation.method(
          #saveUserToFireStore,
          [saveUserToFireStoreModel],
        ),
        returnValue: _i5.Future<void>.value(),
        returnValueForMissingStub: _i5.Future<void>.value(),
      ) as _i5.Future<void>);
  @override
  _i5.Future<String> uploadIdentityImage(
          _i6.UploadImageToStorageParams? params) =>
      (super.noSuchMethod(
        Invocation.method(
          #uploadIdentityImage,
          [params],
        ),
        returnValue: _i5.Future<String>.value(''),
      ) as _i5.Future<String>);
  @override
  _i5.Future<_i2.User?> checkUserIsSignedIn() => (super.noSuchMethod(
        Invocation.method(
          #checkUserIsSignedIn,
          [],
        ),
        returnValue: _i5.Future<_i2.User?>.value(),
      ) as _i5.Future<_i2.User?>);
  @override
  _i5.Future<_i3.QuerySnapshot<Map<String, dynamic>>> getAllUsersDoc(
          String? collectionName) =>
      (super.noSuchMethod(
        Invocation.method(
          #getAllUsersDoc,
          [collectionName],
        ),
        returnValue: _i5.Future<_i3.QuerySnapshot<Map<String, dynamic>>>.value(
            _FakeQuerySnapshot_1<Map<String, dynamic>>(
          this,
          Invocation.method(
            #getAllUsersDoc,
            [collectionName],
          ),
        )),
      ) as _i5.Future<_i3.QuerySnapshot<Map<String, dynamic>>>);
}
