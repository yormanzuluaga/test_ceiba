import 'package:ceiba_ui/ceiba_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_ceiba/feature/main_dashboard/bloc/user_bloc.dart';

class HomeMobile extends StatefulWidget {
  const HomeMobile({
    required this.child,
    super.key,
  });
  final Widget child;
  @override
  State<HomeMobile> createState() => _HomeMobileState();
}

class _HomeMobileState extends State<HomeMobile> {
  @override
  void initState() {
    super.initState();
    context.read<UserBloc>().add(GetUserEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.grey1,
      body: SafeArea(child: widget.child),
    );
  }
}
