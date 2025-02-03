// ignore_for_file: cast_nullable_to_non_nullable

part of 'router_config.dart';

Widget _homeHandler(BuildContext context, GoRouterState state, Widget child) {
  return HomePage(
    child: child,
  );
}

Page<Widget> _detailPageHandler(
  BuildContext context,
  GoRouterState state,
) {
  final data = state.extra! as List<String>;
  return NoTransitionPage(
      child: Detail(
    title: data[0],
    id: data[1],
    email: data[2],
    phone: data[3],
  ));
}
