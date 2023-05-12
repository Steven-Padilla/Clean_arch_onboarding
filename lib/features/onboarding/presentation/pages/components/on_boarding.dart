import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:veterinaria_app/features/onboarding/presentation/blocState/onboarding_bloc.dart';

class OnBoarding extends StatefulWidget {
  const OnBoarding({super.key});

  @override
  State<OnBoarding> createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoarding> {
  int currentPage = 0;
  late PageController varController;
  @override
  void initState() {
    super.initState();
    context.read<OnboardingBloc>().add(GetOnboarding());
    varController = PageController(initialPage: 0);
  }

  @override
  void dispose() {
    super.dispose();
    varController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocBuilder<OnboardingBloc, OnboardingState>(
          builder: (context, state) {
            if (state is Loading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is Loaded) {
              return PageView.builder(
                controller: varController,
                itemCount: state.infoLength,
                onPageChanged: (int page) {
                  setState(() {
                    currentPage = page;
                  });
                },
                itemBuilder: (_, i) {
                  return SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 50),
                            child: Image.asset(
                              state.onboard[i].image,
                              height: 400,
                              width: 300,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 10),
                            child: Text(
                              state.onboard[i].title,
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 25,
                                  color: Colors.purple),
                            ),
                          ),
                          Text(
                            state.onboard[i].description,
                            style: const TextStyle(
                                fontSize: 15, color: Colors.grey),
                            textAlign: TextAlign.center,
                          ),
                          Expanded(
                            flex: 0,
                            child: Padding(
                              padding: const EdgeInsets.only(bottom: 100),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: List.generate(
                                  state.infoLength,
                                  (index) => buildPage(index),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 30),
                            child: SizedBox(
                              height: 50,
                              width: 300,
                              child: MaterialButton(
                                color: currentPage == state.infoLength - 1
                                    ? Colors.green
                                    : Colors.white,
                                onPressed: () async {
                                  currentPage == state.infoLength - 1
                                      ? Navigator.pushNamed(context, '/home')
                                      : varController.nextPage(
                                          duration:
                                              const Duration(milliseconds: 500),
                                          curve: Curves.easeInOut);
                                },
                                textColor: currentPage == state.infoLength - 1
                                    ? Colors.white
                                    : Colors.grey,
                                shape: RoundedRectangleBorder(
                                    side: const BorderSide(
                                        width: 1, color: Colors.grey),
                                    borderRadius: BorderRadius.circular(20)),
                                child: Text(
                                    currentPage == state.infoLength - 1
                                        ? 'Continuar'
                                        : "Siguiente",
                                    style: const TextStyle(fontSize: 16)),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              );
            } else if (state is Error) {
              return Center(
                child: Text(state.error,
                    style: const TextStyle(color: Colors.red)),
              );
            } else {
              return Container();
            }
          },
        ),
      ),
    );
  }

  AnimatedContainer buildPage(int index) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      margin: const EdgeInsets.only(right: 5),
      height: 5,
      width: currentPage == index ? 25 : 20,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color:
              currentPage == index ? Colors.red : Colors.grey.withOpacity(0.4)),
    );
  }
}
