import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:note_location_app/domain/tracking/bloc/track_bloc/bloc.dart';
import 'package:note_location_app/domain/tracking/bloc/track_bloc/event.dart';
import 'package:note_location_app/domain/tracking/bloc/track_bloc/state.dart';
import 'package:note_location_app/domain/user/bloc/login_bloc/bloc.dart';
import 'package:note_location_app/domain/user/router/router.dart';

class ListScreen extends StatelessWidget {
  const ListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back_ios,
              size: 24,
              color: Colors.black,
            ),
            onPressed: () {
              context.pushReplacementNamed(
                UserScreenName.home,
              );
            },
          ),
          title: Text(
            "Welcome ${context.watch<LoginBloc>().state.userName}",
            style: const TextStyle(
              color: Colors.blue,
            ),
          ),
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () async {
            context.read<TrackingBloc>().add(
                  const AddTrackingEvent(),
                );
          },
          child: const Icon(
            Icons.add,
            color: Colors.white,
            size: 24,
          ),
        ),
        body: Container(
          padding: const EdgeInsets.all(
            16,
          ),
          color: Colors.transparent,
          child: BlocBuilder<TrackingBloc, TrackingState>(
              builder: (context, state) {
            return ListView.separated(
              itemBuilder: (context, index) {
                return Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(
                      8,
                    ),
                    border: Border.all(
                      width: 1,
                      color: Colors.blue,
                    ),
                  ),
                  alignment: Alignment.centerLeft,
                  child: Text(
                    state.data?[index] ?? "null",
                    softWrap: true,
                  ),
                );
              },
              separatorBuilder: (context, index) {
                return const SizedBox(
                  height: 12,
                );
              },
              itemCount: state.data?.length ?? 0,
            );
          }),
        ),
      ),
    );
  }
}
