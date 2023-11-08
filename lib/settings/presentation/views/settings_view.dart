import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:movies_app/core/resources/app_colors.dart';
import 'package:movies_app/core/resources/app_values.dart';
import 'package:movies_app/settings/localization/language.dart';
import 'package:movies_app/settings/localization/localization_bloc/language_bloc.dart';

class SettingsView extends StatelessWidget {
  const SettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    AppLocalizations localize = AppLocalizations.of(context)!;

    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
          overlayColor: MaterialStateProperty.all(Colors.transparent),
          onTap: () {
            Navigator.of(context).pop();
          },
          child: Container(
            margin: const EdgeInsets.all(AppMargin.m8),
            padding: const EdgeInsets.all(AppPadding.p8),
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: AppColors.iconContainerColor,
            ),
            child: const Icon(
              Icons.arrow_back_ios_new_rounded,
              color: AppColors.secondaryText,
              size: AppSize.s20,
            ),
          ),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            margin: const EdgeInsets.all(AppMargin.m16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  margin: const EdgeInsets.only(right: AppMargin.m16),
                  padding: const EdgeInsets.all(AppPadding.p8),
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppColors.iconContainerColor,
                  ),
                  child: const Icon(
                    Icons.language_rounded,
                    color: AppColors.secondaryText,
                    size: AppSize.s20,
                  ),
                ),
                Text(
                  localize.languages,
                  style: const TextStyle(
                    color: AppColors.secondaryText,
                    fontSize: AppSize.s16,
                  ),
                ),
              ],
            ),
          ),
          BlocBuilder<LanguageBloc, LanguageState>(
            builder: (context, state) {
              return ListView.separated(
                shrinkWrap: true,
                itemCount: Language.values.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: AppPadding.p16,
                    ),
                    child: ListTile(
                      onTap: () {
                        context.read<LanguageBloc>().add(
                              ChangeLanguage(
                                selectedLanguage: Language.values[index],
                              ),
                            );
                      },
                      title: Center(
                        child: Text(
                          Language.values[index].text,
                          style: const TextStyle(color: Colors.black),
                        ),
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      tileColor:
                          Language.values[index] == state.selectedLanguage
                              ? Colors.blue
                              : Colors.white,
                    ),
                  );
                },
                separatorBuilder: (context, index) {
                  return const SizedBox(height: 16.0);
                },
              );
            },
          ),
        ],
      ),
    );
  }
}
