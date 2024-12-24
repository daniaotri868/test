import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:restaurant_customer/features/app/presentation/controllers/app_bloc/app_bloc.dart';
import 'package:restaurant_customer/features/cart/presentation/bloc/cart_bloc.dart';
import '../features/app/domain/repositories/prefs_repository.dart';
import '../features/home/presentaion/bloc/home_bloc.dart';

class ServiceProvider extends StatelessWidget {
  final Widget child;

  const ServiceProvider({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ThemeMode theme = ThemeMode.light;

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      theme = await GetIt.I<StorageRepository>().getTheme;
    });

    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => GetIt.I<AppBloc>(),
          lazy: false,
        ),
        BlocProvider(
          create: (_) => GetIt.I<CartBloc>(),
        ),
        BlocProvider(create: (_) => GetIt.I<HomeBloc>()),
      ],
      child: child,
    );
  }
}
