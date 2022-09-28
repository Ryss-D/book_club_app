import 'package:book_club_app/presentation/widgets/utils/jumping_dots_progresss_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});
  static const routeName = '/splashScreen';

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const JumpingDotsProgressIndicator(),
              Text(AppLocalizations.of(context)!.waiting),
            ],
          ),
        ),
      ),
    );
  }
}
