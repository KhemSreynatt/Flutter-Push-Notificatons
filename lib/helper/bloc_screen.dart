import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:push_notifications/bloc/user_state.dart';

import '../bloc/user_bloc.dart';

class BlocScreen extends StatefulWidget {
  const BlocScreen({super.key});

  @override
  State<BlocScreen> createState() => _BlocScreenState();
}

class _BlocScreenState extends State<BlocScreen> {
  @override
  Widget build(BuildContext context) {
    //  final userBloc = BlocProvider.of<UserBloc>(context);
    return Scaffold(
      appBar: AppBar(title: const Text("Bloc Learning")),
      body: BlocBuilder<UserBloc, UserState>(
        builder: (context, state) {
          if (state.isLoading == false) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state.listUser!.isEmpty) {
            return const Center(
              child: Text("Data Error"),
            );
          } else {
            return ListView.builder(
              itemCount: state.listUser!.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text("${state.listUser![index]}"),
                );
              },
            );
          }
        },
      ),
    );
  }
}
