import 'package:flutter/material.dart';

import '../../widgets/primary_btn.dart';

class ArchiveAndPremiumButton extends StatelessWidget {
  const ArchiveAndPremiumButton({
    super.key,
    required this.archiveTap,
    required this.premiumTap,
  });

  final Function() archiveTap, premiumTap;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        PrimaryButton(
          onTap: archiveTap,
          text: 'Archives',
        ),
        PrimaryButton(
          onTap: premiumTap,
          text: 'Premium',
        ),
      ],
    );
  }
}