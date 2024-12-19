import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:farm_link_ai/core/cubit/SplashScreen/splashScreen_cubit.dart';
import 'package:farm_link_ai/core/cubit/SplashScreen/splashScreen_state.dart';
import 'package:farm_link_ai/consts/assets.dart' as consts;
import 'package:farm_link_ai/consts/constants.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => SplashCubit()..checkAndRequestPermissions(),
      child: Scaffold(
        body: BlocBuilder<SplashCubit, SplashState>(
          builder: (context, state) {
            if (state is SplashLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }


            return _SplashContent(state: state);
          },
        ),
      ),
    );
  }
}

class _SplashContent extends StatelessWidget {
  final SplashState state;

  const _SplashContent({required this.state});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage(consts.navbarImage),
          fit: BoxFit.cover,
        ),
      ),
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.bottomRight,
            colors: [
              Colors.black.withOpacity(.9),
              Colors.black.withOpacity(.4),
            ],
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              const Text(
                "Brand New Perspective",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                "Let's start with our summer collection.",
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
              const SizedBox(height: 100),
              AnimatedButton(
                text: getStarted,
                onTap: () {
                  GoRouter.of(context).go('/');
                },
                isPrimary: true,
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}

class AnimatedButton extends StatelessWidget {
  final String text;
  final VoidCallback onTap;
  final bool isPrimary;

  const AnimatedButton({
    Key? key,
    required this.text,
    required this.onTap,
    this.isPrimary = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 50,
        decoration: BoxDecoration(
          color: isPrimary ? Colors.white : Colors.transparent,
          border: isPrimary ? null : Border.all(color: Colors.white),
          borderRadius: BorderRadius.circular(50),
        ),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
              color: isPrimary ? Colors.black : Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
