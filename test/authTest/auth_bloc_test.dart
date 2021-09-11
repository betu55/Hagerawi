import 'dart:async';

import 'package:http/http.dart' as http;
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hagerawi_app/auth/bloc/auth_event.dart';
import 'package:hagerawi_app/auth/bloc/auth_state.dart';
import 'package:hagerawi_app/auth/models/auth_model.dart';
import 'package:hagerawi_app/auth/repository/auth_repo.dart';
import 'package:hagerawi_app/auth/screens/signup.dart';
import 'package:hagerawi_app/auth/bloc/auth_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:mockito/mockito.dart';

class MockAuthRepo extends Mock implements AuthRepo {}

void main() {
  MockAuthRepo mockAuthRepo;
  mockAuthRepo = MockAuthRepo();

  setUp(() {
    mockAuthRepo = MockAuthRepo();
  });

  group('Login', () {
    final login = AuthModel(username: 'luhana', password: '1234');

    blocTest(
      'emits [WeatherLoading, WeatherLoaded] when successful',
      build: () {
        when(mockAuthRepo.register('username', 'password'))
            .thenAnswer((_) async => login);
        return AuthBloc(mockAuthRepo);
      },
      act: (bloc) {
        return bloc.add(LoginEvent('London', '1234'));
      },
      expect: () {
        LoggedIn('username', 'password');
        return [isA<LoggedIn>()];
      },
    );
  });
}
