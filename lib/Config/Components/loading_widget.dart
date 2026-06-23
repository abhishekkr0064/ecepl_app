import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoadingWidget extends StatelessWidget {
  final double size;
  final Color loadingcolor;
  const LoadingWidget({
    super.key,
    this.size = 60,
    this.loadingcolor = Colors.blue,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: size,
      width: size,
      child: Platform.isAndroid
          ? CircularProgressIndicator(color: loadingcolor)
          : CupertinoActivityIndicator(color: loadingcolor),
    );
  }
}
