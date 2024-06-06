import 'package:flutter/material.dart';

class SubmitButton extends StatelessWidget {
  const SubmitButton({
    super.key,
    this.tap,
    required this.isLoading,
  });

  final Function()? tap;
  final bool isLoading;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: isLoading
          ? const SizedBox(
              height: 60,
              width: double.infinity,
              child: Center(
                child: CircularProgressIndicator(),
              ),
            )
          : Container(
              decoration: BoxDecoration(
                  color: Colors.blue, borderRadius: BorderRadius.circular(10)),
              height: 60,
              width: double.infinity,
              child: InkWell(
                onTap: tap,
                child: const Center(
                  child: Text('Submit',
                      style: TextStyle(fontWeight: FontWeight.bold)),
                ),
              ),
            ),
    );
  }
}
