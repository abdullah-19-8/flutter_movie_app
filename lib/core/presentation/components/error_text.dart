import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';


class ErrorText extends StatelessWidget {
  const ErrorText({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    AppLocalizations localize = AppLocalizations.of(context)!;

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          localize.oops,
          style: textTheme.titleMedium,
        ),
        Text(
          localize.errorMessage,
          style: textTheme.bodyLarge,
        ),
        Text(
          localize.tryAgainLater,
          style: textTheme.bodyLarge,
        ),
      ],
    );
  }
}
