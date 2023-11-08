import 'package:flutter/material.dart';
import 'package:movies_app/core/resources/app_values.dart';

class SectionListView extends StatelessWidget {
  final int itemCount;
  final double height;
  final Widget Function(BuildContext context, int index) itemBuilder;

  const SectionListView({
    required this.height,
    required this.itemCount,
    required this.itemBuilder,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      primary: false,
      physics: const BouncingScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        childAspectRatio: 0.7,
        crossAxisSpacing: AppSize.s10,
        mainAxisSpacing: AppSize.s1,
        mainAxisExtent: AppSize.s240,
      ),
      padding: const EdgeInsets.symmetric(horizontal: AppPadding.p16),
      itemCount: itemCount,
      itemBuilder: itemBuilder,
    );
  }
}
