import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:note_location_app/dependency/get_it.dart';
import 'package:note_location_app/domain/tracking/router/router.dart';
import 'package:note_location_app/domain/user/bloc/login_bloc/bloc.dart';
import 'package:note_location_app/domain/user/bloc/login_bloc/event.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _controllerUserName = TextEditingController(
    text: de.get<LoginBloc>().state.userName,
  );
  final _controllerPassword = TextEditingController();

  bool missingUsername = false;
  bool missingPassword = false;

  bool wrongFormatUsername = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            "Login",
            style: TextStyle(
              color: Colors.blueAccent,
            ),
          ),
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        body: Container(
          alignment: Alignment.center,
          color: Colors.transparent,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              const Spacer(),
              Container(
                padding: const EdgeInsets.symmetric(
                  vertical: 30,
                ),
                width: 200,
                child: TextField(
                  decoration: InputDecoration(
                    errorText: missingUsername
                        ? "Missing user name"
                        : wrongFormatUsername
                            ? "Wrong format"
                            : null,
                    labelText: "User name",
                  ),
                  controller: _controllerUserName,
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(
                  vertical: 30,
                ),
                width: 200,
                child: TextField(
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: "Password",
                    errorText: missingPassword ? "Missing password" : null,
                  ),
                  controller: _controllerPassword,
                ),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    missingPassword = false;
                    missingUsername = false;
                    wrongFormatUsername = false;
                  });
                  if (_controllerUserName.text.isEmpty ||
                      _controllerPassword.text.isEmpty) {
                    setState(() {
                      if (_controllerPassword.text.isEmpty) {
                        missingPassword = true;
                      }
                      if (_controllerUserName.text.contains(RegExp(r'[A-Z]'))) {
                        wrongFormatUsername = true;
                      }
                      if (_controllerUserName.text.isEmpty) {
                        missingUsername = true;
                      }
                    });
                  } else if (_controllerUserName.text
                      .contains(RegExp(r'[A-Z]'))) {
                    setState(() {
                      wrongFormatUsername = true;
                    });
                  } else {
                    setState(() {
                      missingPassword = false;
                      missingUsername = false;
                      wrongFormatUsername = false;
                    });
                    context.read<LoginBloc>().add(
                          SaveUserLoginEvent(
                            userName: _controllerUserName.text,
                          ),
                        );
                    context.pushReplacementNamed(TrackingScreenName.list);
                  }
                },
                child: Container(
                  margin: const EdgeInsets.only(
                    top: 32,
                  ),
                  height: 48,
                  width: 200,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(
                      color: Colors.blue,
                    ),
                  ),
                  child: const Text("Login"),
                ),
              ),
              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
