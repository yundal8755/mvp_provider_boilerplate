import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:mvp_provider_boilerplate/app/router/routes.dart';
import 'package:mvp_provider_boilerplate/presentation/components/button/cool_button.dart';
import 'package:mvp_provider_boilerplate/presentation/pages/home/home_view_model.dart';
import 'package:mvp_provider_boilerplate/presentation/providers/task_provider.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late HomeViewModel viewModel;

  @override
  void initState() {
    super.initState();
    viewModel = HomeViewModel(this);

    WidgetsBinding.instance.addPostFrameCallback((_) {
      viewModel.initFetch();
    });
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<HomeViewModel>.value(
      value: viewModel,
      builder: (context, child) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Home'),
          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // KAKAO
                  CoolButton(
                    onPressed: () => context.push(AppRoute.signIn.path),
                    child: const Text('SNS 로그인 하러가기'),
                  ),

                  const Gap(12),

                  Consumer<TaskProvider>(
                    builder: (_, prov, __) {
                      if (prov.tasks.isEmpty) {
                        return const Text('할 일 없음');
                      }
                      return Expanded(
                        child: ListView.builder(
                            itemCount: prov.tasks.length,
                            itemBuilder: (context, index) {
                              final task = prov.tasks[index];
                              return Column(
                                children: [
                                  Text(task.title),
                                  const Gap(6),
                                  Text(task.description),
                                  const Gap(6),
                                  Text(task.isCompleted.toString()),
                                  const Gap(6),
                                  Text(task.taskId.toString()),
                                  const Gap(6),
                                  Text(task.userId.toString()),
                                  const Gap(6),
                                ],
                              );
                            }),
                      );
                    },
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
