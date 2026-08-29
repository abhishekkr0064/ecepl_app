import 'package:ecepl_app/Bloc/Project_names/project_names_bloc.dart';
import 'package:ecepl_app/Data/Repository/Projects_name/projects_name_repository.dart';
import 'package:ecepl_app/Routers/router_import.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      builder: (context, child) {
        return MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (context) => ProjectNamesBloc(ProjectsRepository()),
            ),
          ],
          child: MaterialApp.router(
            title: 'ECEPL App',
            debugShowCheckedModeBanner: false,
            routerDelegate: AppRouter.router.routerDelegate,
            routeInformationProvider: AppRouter.router.routeInformationProvider,
            routeInformationParser: AppRouter.router.routeInformationParser,
          ),
        );
      },
    );
  }
}
