import 'package:counter_bloc/bloc/counter_bloc.dart';
import 'package:counter_bloc/pages/user_page.dart';
import 'package:counter_bloc/repository/user_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => CounterBloc(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primaryColor: Colors.green,
          primarySwatch: Colors.brown,
        ),
        home: RepositoryProvider(
          create: (context) => UserRepository()..getUsers(),
          child: const UserPage(),
        ),
      ),
    );
  }
}
