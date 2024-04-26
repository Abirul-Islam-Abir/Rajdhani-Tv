import 'package:flutter/material.dart';

import '../../widgets/primary_btn.dart';

class ArchiveAndPremiumButton extends StatelessWidget {
  const ArchiveAndPremiumButton({
    super.key,
    required this.archive,
    required this.premium, required this.archiveTxt, required this.premiumTxt,
  });

  final Function() archive, premium;
  final String  archiveTxt,premiumTxt;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        PrimaryButton(
          onTap: archive,
          text: archiveTxt,
        ),
        PrimaryButton(
          onTap: premium,
          text: premiumTxt,
        ),
      ],
    );
  }
}