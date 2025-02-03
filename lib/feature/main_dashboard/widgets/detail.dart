import 'package:ceiba_ui/ceiba_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:test_ceiba/app/routes/routes_names.dart';
import 'package:test_ceiba/feature/main_dashboard/bloc/user_bloc.dart';

class Detail extends StatelessWidget {
  const Detail({
    super.key,
    required this.id,
    required this.title,
    required this.email,
    required this.phone,
  });

  final String title;
  final String id;
  final String email;
  final String phone;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            context.go(RoutesNames.home);
          },
          icon: Icon(
            Icons.arrow_back_ios_new,
          ),
        ),
        centerTitle: true,
        title: Text(
          title,
          style: UITextStyle.titles.title2Medium,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        child: Column(
          children: [
            Row(
              children: [
                Text(
                  'Nombre: ',
                  style: UITextStyle.titles.title3Medium,
                ),
                Text(
                  title,
                  style: UITextStyle.paragraphs.paragraph1Regular,
                ),
              ],
            ),
            Row(
              children: [
                Text(
                  'Email: ',
                  style: UITextStyle.titles.title3Medium,
                ),
                Text(
                  email,
                  style: UITextStyle.paragraphs.paragraph1Regular,
                ),
              ],
            ),
            Row(
              children: [
                Text(
                  'Telefono: ',
                  style: UITextStyle.titles.title3Medium,
                ),
                Text(
                  phone,
                  style: UITextStyle.paragraphs.paragraph1Regular,
                ),
              ],
            ),
            BlocBuilder<UserBloc, UserState>(
              builder: (context, state) {
                return state.listPosts != null && state.listPosts!.isNotEmpty
                    ? Flexible(
                        child: ListView.builder(
                          physics: BouncingScrollPhysics(),
                          itemCount: state.listPosts!.length,
                          itemBuilder: (context, index) {
                            final data = state.listPosts![index];
                            return Column(
                              children: [
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    'Title: ',
                                    style: UITextStyle.titles.title3Medium,
                                  ),
                                ),
                                SizedBox(
                                  height: AppSpacing.md,
                                ),
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    data.title.toString(),
                                    style: UITextStyle.paragraphs.paragraph1Regular,
                                  ),
                                ),
                                SizedBox(
                                  height: AppSpacing.lg,
                                ),
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    'Body: ',
                                    style: UITextStyle.titles.title3Medium,
                                  ),
                                ),
                                SizedBox(
                                  height: AppSpacing.md,
                                ),
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    data.body.toString(),
                                    style: UITextStyle.paragraphs.paragraph1Regular,
                                  ),
                                ),
                                SizedBox(
                                  height: AppSpacing.lg,
                                ),
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    'User Id: ${data.userId.toString()}',
                                    style: UITextStyle.titles.title3Medium,
                                  ),
                                ),
                              ],
                            );
                          },
                        ),
                      )
                    : Center(
                        child: CircularProgressIndicator(),
                      );
              },
            ),
            SizedBox(
              height: AppSpacing.md,
            ),
          ],
        ),
      ),
    );
  }
}
