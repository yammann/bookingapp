import 'package:e_store/core/constants/route.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplachView extends StatelessWidget {
  const SplachView({super.key});
  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: SplachViewAnimation());
  }
}

class SplachViewAnimation extends StatefulWidget {
  const SplachViewAnimation({super.key});

  @override
  State<SplachViewAnimation> createState() => _SplachViewAnimationState();
}

class _SplachViewAnimationState extends State<SplachViewAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<Offset> slaidAnimation;
  
  @override
  void initState() {
    super.initState();
    initSlidAnimation();

    navigateToHomeView();
  }

  void navigateToHomeView() {
    Future.delayed(const Duration(seconds: 3), () async{
     
      Get.offNamed(AppRoute.onBoarding);
    });
  }

  void initSlidAnimation() {
    animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 1));
    slaidAnimation = Tween<Offset>(begin: const Offset(1, 0), end: Offset.zero)
        .animate(animationController);

    animationController.forward();
  }

  @override
  void dispose() {
    super.dispose();
    animationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: slaidAnimation,
      builder: (context, _) {
        return SlideTransition(
            position: slaidAnimation, child: const SplachViewBody());
      },
    );
  }
}



class SplachViewBody extends StatelessWidget {
  const SplachViewBody({super.key});
  
  @override
  Widget build(BuildContext context) {
    
    return SizedBox(
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [Image.asset("assets/images/logo.png",width:200,height: 300,fit: BoxFit.fill,)],
      ),
    );
  }
}