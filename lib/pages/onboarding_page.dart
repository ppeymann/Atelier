import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'index.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  final PageController _controller = PageController();

  int currentPage = 0;

  Future<void> finishOnboarding() async {
    final prefs = await SharedPreferences.getInstance();

    await prefs.setBool("seenOnboarding", true);

    if (!mounted) return;

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (_) => const LoginRegisterPage()),
    );
  }

  void skip() {
    _controller.animateToPage(
      2,
      duration: const Duration(microseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  Widget buildPage({required String subtitle}) {
    return Padding(
      padding: const EdgeInsets.all(30),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset("assets/images/gold_logo.png", width: 150, height: 150),

          // const SizedBox(height: 20),
          Text(
            "Atelier",
            style: TextStyle(
              fontSize: 40,
              fontWeight: FontWeight.bold,
              color: Theme.of(context).colorScheme.tertiary,
              fontFamily: "monro",
            ),
          ),

          Text(
            "Your Tailoring Studio",
            style: TextStyle(
              fontSize: 17,
              color: Theme.of(context).colorScheme.secondary,
            ),
          ),

          SizedBox(height: 50),

          Divider(
            color: Theme.of(context).colorScheme.onSecondary,
            indent: 150,
            endIndent: 150,
          ),

          SizedBox(height: 40),

          Text(
            subtitle,
            style: TextStyle(
              fontSize: 13,
              color: Theme.of(context).colorScheme.tertiary,
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/onboard_background.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsetsGeometry.symmetric(
                horizontal: 20,
                vertical: 10,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: skip,
                    child: Text(
                      "Skip",
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.tertiary,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: PageView(
                controller: _controller,
                onPageChanged: (index) {
                  setState(() {
                    currentPage = index;
                  });
                },
                children: [
                  buildPage(
                    subtitle:
                        "Manage all your orders, measurements, and customers in one simple place.",
                  ),

                  buildPage(
                    subtitle:
                        "Save your customers’ measurements so you never miss any detail again.",
                  ),

                  buildPage(
                    subtitle:
                        "Save time and deliver your tailoring orders with better speed and organization.",
                  ),
                ],
              ),
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                3,
                (index) => AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  margin: const EdgeInsets.all(4),
                  width: currentPage == index ? 24 : 8,
                  height: 8,
                  decoration: BoxDecoration(
                    color: currentPage == index
                        ? Theme.of(context).colorScheme.secondary
                        : Theme.of(context).colorScheme.onSecondary,
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ),

            const SizedBox(height: 30),

            Padding(
              padding: const EdgeInsets.all(20),

              child: currentPage == 2
                  ? SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: finishOnboarding,
                        child: const Text("Start"),
                      ),
                    )
                  : SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Theme.of(
                            context,
                          ).colorScheme.tertiary,
                        ),
                        onPressed: () {
                          _controller.nextPage(
                            duration: const Duration(milliseconds: 300),
                            curve: Curves.easeInOut,
                          );
                        },
                        child: const Text("Next"),
                      ),
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
