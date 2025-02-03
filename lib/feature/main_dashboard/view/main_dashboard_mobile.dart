import 'package:ceiba_ui/ceiba_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:test_ceiba/app/routes/routes_names.dart';

import 'package:test_ceiba/feature/main_dashboard/bloc/user_bloc.dart';

class MainDashboardMobile extends StatelessWidget {
  MainDashboardMobile({super.key});
  final TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 12,
      ),
      child: Column(
        children: [
          SizedBox(
            height: AppSpacing.md,
          ),
          Text(
            'Usuario',
            style: UITextStyle.titles.title2Medium,
          ),
          SizedBox(
            height: AppSpacing.md,
          ),
          AppTextField(
            suffixIcon: Icons.search,
            controller: searchController,
            onChanged: (query) {
              if (query.length > 2) {
                context.read<UserBloc>().add(SearchUserEvent(query: query));
              } else {
                context.read<UserBloc>().add(SearchAboveUserEvent());
              }
            },
          ),
          BlocBuilder<UserBloc, UserState>(
            builder: (context, state) {
              return state.listUser != null && state.listUser!.isNotEmpty
                  ? Flexible(
                      child: ListView.builder(
                        physics: BouncingScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: state.listUser!.length,
                        itemBuilder: (context, index) {
                          final data = state.listUser![index];
                          return Padding(
                            padding: const EdgeInsets.symmetric(vertical: 12),
                            child: BaseCard(
                                child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                              child: Column(
                                children: [
                                  Align(
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                      data.name.toString(),
                                      style: UITextStyle.titles.title3Medium,
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      Icon(Icons.phone),
                                      SizedBox(
                                        width: 8,
                                      ),
                                      Text(
                                        data.phone.toString(),
                                        style: UITextStyle.paragraphs.paragraph1Regular,
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: AppSpacing.lg,
                                  ),
                                  Row(
                                    children: [
                                      Icon(Icons.email),
                                      SizedBox(
                                        width: 8,
                                      ),
                                      Text(
                                        data.email.toString(),
                                        style: UITextStyle.paragraphs.paragraph1Regular,
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: AppSpacing.lg,
                                  ),
                                  Align(
                                    alignment: Alignment.centerRight,
                                    child: TextButton(
                                        onPressed: () {
                                          context.read<UserBloc>().add(GetPostsEvent(id: data.id.toString()));
                                          context.go(RoutesNames.detail, extra: [
                                            data.name.toString(),
                                            data.id.toString(),
                                            data.email.toString(),
                                            data.phone.toString(),
                                          ]);
                                        },
                                        child: Text(
                                          'VER PUBLICACIONES',
                                          style: UITextStyle.links.link.copyWith(),
                                        )),
                                  )
                                ],
                              ),
                            )),
                          );
                        },
                      ),
                    )
                  : Center(child: CircularProgressIndicator());
            },
          ),
        ],
      ),
    );
  }
}
