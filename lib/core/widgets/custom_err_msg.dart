import 'package:flutter/material.dart';

class CustomErrMsg extends StatelessWidget {
  const CustomErrMsg({super.key, required this.errMsg});
  final String errMsg;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        errMsg,
      ),
    );
  }
}
