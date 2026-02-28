import 'package:cinebox/ui/core/themes/resource.dart';
import 'package:cinebox/ui/core/themes/widgets/loader_messages.dart';
import 'package:cinebox/ui/login/commands/login_with_google_command.dart';
import 'package:cinebox/ui/login/widgets/login_view_model.dart';
import 'package:cinebox/ui/login/widgets/sign_in_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen>
    with LoaderAndMessages {
  @override
  Widget build(BuildContext context) {
    ref.listen(
      loginWithGoogleCommandProvider,
      (_, state) {
        state.whenOrNull(
          data: (_) {
            Navigator.pushReplacementNamed(context, '/home');
          },
          error: (error, stackTrace) {
            showErrorSnackBar('Erro ao realizar login');
          },
        );
      },
    );

    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            R.ASSETS_IMAGES_BG_LOGIN_PNG,
            fit: BoxFit.cover,
            height: double.infinity,
            width: double.infinity,
          ),
          Container(
            constraints: BoxConstraints.expand(),
            color: Colors.black.withAlpha(170),
          ),
          Container(
            constraints: BoxConstraints.expand(),
            padding: const EdgeInsets.only(top: 108),
            child: Column(
              spacing: 48,
              children: [
                Image.asset(
                  R.ASSETS_IMAGES_LOGO_PNG,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: Consumer(
                    builder: (_, ref, __) {
                      final state = ref.watch(loginWithGoogleCommandProvider);
                      return SignInButton(
                        isLoading: state.isLoading,
                        onPressed: () {
                          final viewModel = ref.read(loginViewModelProvider);
                          viewModel.googleLogin();
                        },
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
