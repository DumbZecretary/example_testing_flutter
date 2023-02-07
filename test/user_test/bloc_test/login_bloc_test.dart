import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:note_location_app/common/status.dart';
import 'package:note_location_app/domain/user/bloc/login_bloc/bloc.dart';
import 'package:note_location_app/domain/user/bloc/login_bloc/event.dart';
import 'package:note_location_app/domain/user/bloc/login_bloc/repository/pref.dart';
import 'package:note_location_app/domain/user/bloc/login_bloc/state.dart';

class MockLocalLoginRepo extends Mock implements LoginRepoSharedPreference {}

void main() {
  loginBlocTest();
}

void loginBlocTest() {
  group(
    'LOGIN BLOC:',
    () {
      //================================================================================
      late LoginState? loginState;
      late MockLocalLoginRepo localRepo;

      //==SUCCESS=======================================================================

      blocTest(
        "Add user name - success",
        setUp: () {
          localRepo = MockLocalLoginRepo();
          loginState = const LoginState().initial();

          when(
            () => localRepo.saveLocalValue(value: "userName"),
          ).thenAnswer(
            (invocation) async {
              return true;
            },
          );
          when(
            () => localRepo.getLocalValue(),
          ).thenAnswer(
            (invocation) {
              return "userName";
            },
          );
        },
        tearDown: () {
          loginState = null;
        },
        build: () => LoginBloc(
          initState: loginState!,
          loginRepoSharedPreference: localRepo,
        ),
        act: (bloc) {
          bloc.add(
            const SaveUserLoginEvent(
              userName: "userName",
            ),
          );
        },
        expect: () {
          return [
            // Notify loading status
            const LoginState(
              status: Status(
                type: StatusType.loading,
                codes: {
                  CodeType.local: 100,
                },
                messages: {
                  MessageType.local: "save user ...",
                },
              ),
            ),

            const LoginState(
              status: Status(
                type: StatusType.loading,
                codes: {
                  CodeType.local: 100,
                },
                messages: {
                  MessageType.local: "save user ...",
                },
              ),
              userName: "userName",
            ),

            const LoginState(
              status: Status(
                type: StatusType.idle,
                codes: {
                  CodeType.local: 100,
                },
              ),
              userName: "userName",
            ),
          ];
        },
        verify: (bloc) {
          verify(() => localRepo.saveLocalValue(value: "userName")).called(1);
          verify(() => localRepo.getLocalValue()).called(1);
        },
      );

      //==ERROR=========================================================================
      blocTest(
        "Add user name - error",
        setUp: () {
          localRepo = MockLocalLoginRepo();
          loginState = const LoginState().initial();

          when(
            () => localRepo.saveLocalValue(value: "userName"),
          ).thenAnswer(
            (invocation) async {
              throw ("error");
            },
          );
          when(
            () => localRepo.getLocalValue(),
          ).thenAnswer(
            (invocation) {
              return "userName";
            },
          );
        },
        tearDown: () {
          loginState = null;
        },
        build: () => LoginBloc(
          initState: loginState!,
          loginRepoSharedPreference: localRepo,
        ),
        act: (bloc) {
          bloc.add(
            const SaveUserLoginEvent(
              userName: "userName",
            ),
          );
        },
        expect: () {
          return [
            // Notify loading status
            const LoginState(
              status: Status(
                type: StatusType.loading,
                codes: {
                  CodeType.local: 100,
                },
                messages: {
                  MessageType.local: "save user ...",
                },
              ),
            ),

            const LoginState(
              status: Status(
                type: StatusType.error,
                codes: {
                  CodeType.local: 100,
                },
              ),
            ),

            const LoginState(
              status: Status(
                type: StatusType.idle,
                codes: {
                  CodeType.local: 100,
                },
              ),
            ),
          ];
        },
      );

      blocTest(
        "Add ERROR",
        setUp: () {
          loginState = const LoginState().initial();
        },
        tearDown: () {
          loginState = null;
        },
        build: () => LoginBloc(
          initState: loginState!,
        ),
        act: (bloc) {
          // ignore: invalid_use_of_protected_member
          bloc.addError(
            "error",
          );
        },
        expect: () {
          return [
            const LoginState(
              status: Status(
                type: StatusType.error,
                messages: {
                  MessageType.local: "error",
                },
              ),
            ),
          ];
        },
      );
    },
  );
}
