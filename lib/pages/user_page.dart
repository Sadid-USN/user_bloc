import 'package:counter_bloc/models/user_model.dart';
import 'package:counter_bloc/repository/user_repository.dart';
import 'package:counter_bloc/userbloc/user_bloc.dart';
import 'package:counter_bloc/userbloc/user_event.dart';
import 'package:counter_bloc/userbloc/user_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserPage extends StatelessWidget {
  const UserPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => UserBloc(
        RepositoryProvider.of<UserRepository>(context),
      )..add(LoadUserEvent()),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('User Page'),
          centerTitle: true,
        ),
        body: BlocBuilder<UserBloc, UserState>(builder: (context, state) {
          if (state is UserLoadingState) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is UserLoadedState) {
            List<UserModel> users = state.users;
            return ListView.builder(
                padding: const EdgeInsets.all(8),
                itemCount: users.length,
                itemBuilder: ((context, index) {
                  return SizedBox(
                    height: 80,
                    child: Card(
                      color: Colors.brown.shade200,
                      child: ListTile(
                        leading: Text(users[index].firstName),
                        trailing: CircleAvatar(
                          radius: 30,
                          backgroundImage: NetworkImage(users[index].avatar),
                        ),
                      ),
                    ),
                  );
                }));
          }
          return Container();
        }),
      ),
    );
  }
}
