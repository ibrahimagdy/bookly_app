import 'package:bookly_app/core/routing/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import 'core/routing/routes.dart';
import 'core/utils/constants.dart';

class BooklyApp extends StatelessWidget{
  final AppRoutes appRoutes;
  const BooklyApp({super.key, required this.appRoutes});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          brightness: Brightness.dark,
          scaffoldBackgroundColor: kPrimaryColor,
          textTheme: GoogleFonts.montserratTextTheme(
            ThemeData.dark().textTheme
          ),
        ),
        initialRoute: Routes.splash,
        onGenerateRoute: appRoutes.generateRoute,
      ),
    );
  }
}