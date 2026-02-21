import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

mixin LoaderAndMessages<T extends ConsumerStatefulWidget> on ConsumerState<T> {
  bool isLoading = false;
  String? message;

  void showLoading() {
    if (!isLoading) {
      isLoading = true;
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (_) => LoadingAnimationWidget.threeArchedCircle(
          color: Colors.white,
          size: 60,
        ),
      );
    }
  }

  void hideLoading() {
    if (isLoading) {
      isLoading = false;
      Navigator.of(context).pop();
    }
  }

  void _showSnackBar(String? value, Color color) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Center(child: Text(value ?? "Ocorreu um erro inesperado")),
        backgroundColor: color,
      ),
    );
  }

  void showErrorSnackBar(String? value) => _showSnackBar(value, Colors.red);

  void showSuccessSnackBar(String? value) => _showSnackBar(value, Colors.green);

  void showInfoSnackBar(String? value) => _showSnackBar(value, Colors.blue);
}
