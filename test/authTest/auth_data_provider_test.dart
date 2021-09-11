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
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';

class MockAuthBloc extends MockBloc<AuthEvent, AuthState> implements AuthBloc {}

void main() {
  MockAuthBloc mockAuthBloc;
  mockAuthBloc = MockAuthBloc();
  setUp(() {
    mockAuthBloc = MockAuthBloc();
  });

  test('Example mocked BLoC test', () {
    whenListen(
      mockAuthBloc,
      Stream.fromIterable([Neutral(), LoggedIn('username', 'password')]),
    );

    expectLater(
      mockAuthBloc,
      emitsInOrder([Neutral(), LoggedIn('username', 'password')]),
    );
  });
}
