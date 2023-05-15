import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:elections/core/services/authFirebaseService/auth_service_impl.dart';
import 'package:elections/core/services/authFirebaseService/base_auth_service.dart';
import 'package:elections/core/services/firebaseStorageService/base_firebase_storage.dart';
import 'package:elections/core/services/firebaseStorageService/firebase_storage_service_impl.dart';
import 'package:elections/core/services/firestoreFirebaseService/base_firestore_service.dart';
import 'package:elections/core/services/firestoreFirebaseService/firestore_service_impl.dart';
import 'package:elections/features/registrations/repository/base_registrations_repository.dart';
import 'package:elections/features/registrations/repository/resgistrations_repository_impl.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get_it/get_it.dart';

import '../../features/registrations/data/base_registrations_data_source.dart';
import '../../features/registrations/data/registrations_data_source_impl.dart';
import '../../features/registrations/view_model/registration_cubit.dart';

GetIt serviceLocator = GetIt.instance;

class ServiceLocator {
  static void setup() {
    //firebase
    serviceLocator.registerLazySingleton<FirebaseFirestore>(
        () => FirebaseFirestore.instance);
    serviceLocator
        .registerLazySingleton<FirebaseAuth>(() => FirebaseAuth.instance);
    serviceLocator
        .registerLazySingleton<FirebaseStorage>(() => FirebaseStorage.instance);

    //firebaseServices
    serviceLocator.registerLazySingleton<BaseFireStoreService>(
        () => FireStoreServiceImpl(serviceLocator()));
    serviceLocator.registerLazySingleton<BaseFirebaseStorage>(
        () => FirebaseStorageServiceImpl(serviceLocator()));
    serviceLocator.registerLazySingleton<BaseAuthService>(
        () => AuthFirebaseService(serviceLocator()));

    //cubits
    serviceLocator.registerFactory<RegistrationCubit>(
        () => RegistrationCubit(serviceLocator()));

    //repository
    serviceLocator.registerLazySingleton<BaseRegistrationsRepository>(
        () => RegistrationsRepositoryImpl(serviceLocator()));

    //dataSources
    serviceLocator.registerLazySingleton<BaseRegistrationsDataSource>(() =>
        RegistartionsDataSourceImpl(
            serviceLocator(), serviceLocator(), serviceLocator()));
  }
}
