import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:movies_app/core/resources/app_values.dart';

class AboutUsViews extends StatelessWidget {
  const AboutUsViews({super.key});

  @override
  Widget build(BuildContext context) {
    AppLocalizations localize = AppLocalizations.of(context)!;

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(AppPadding.p16),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                localize.aboutUs,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(localize.aboutApp)
            ],
          ),
        ),
      ),
    );
  }
}
