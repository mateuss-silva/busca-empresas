import 'package:empresas_flutter/app/shared/utils/color_scheme_helper.dart';
import 'package:empresas_flutter/app/shared/widgets/overlay_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loader_overlay/loader_overlay.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GlobalLoaderOverlay(
      useDefaultLoading: false,
      overlayWidget: const OverlayWidget(),
      overlayColor: ColorSchemeHelper.overlayColor,
      child: MaterialApp.router(
        routeInformationParser: Modular.routeInformationParser,
        routerDelegate: Modular.routerDelegate,
        title: 'Empresas Flutter',
        theme: ThemeData(
          textTheme: GoogleFonts.rubikTextTheme(Theme.of(context).textTheme),
          primaryColor: ColorSchemeHelper.primaryColor,
          backgroundColor: Colors.white,
          errorColor: ColorSchemeHelper.errorColor,
          colorScheme: ColorScheme.fromSwatch().copyWith(
            primary: ColorSchemeHelper.primaryColor,
            secondary: ColorSchemeHelper.secondaryColor,
            surface: Colors.white,
            background: Colors.white,
            error: ColorSchemeHelper.errorColor,
            onPrimary: Colors.white,
            onSecondary: Colors.white,
            onSurface: Colors.black,
            onBackground: Colors.black,
            onError: Colors.white,
            brightness: Brightness.light,
          ),
        ),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
