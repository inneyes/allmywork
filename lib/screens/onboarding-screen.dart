import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:onboarding_screen/sign_in/sign_in.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  late PageController _pageController;

  int _pageIndex = 0;

  @override
  void initState() {
    _pageController = PageController(initialPage: 0);
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(8, 0, 8, 20),
          child: Column(
            children: [
              Expanded(
                child: PageView.builder(
                  itemCount: demo_data.length,
                  controller: _pageController,
                  onPageChanged: (index) {
                    setState(() {
                      _pageIndex = index;
                    });
                  },
                  itemBuilder: (context, index) => OnBoardingWidget(
                    image: demo_data[index].image,
                    title: demo_data[index].title,
                    description: demo_data[index].description,
                    backgroundColor: demo_data[index].backgroundColor,
                  ),
                ),
              ),
              Row(
                children: [
                  ...List.generate(
                      demo_data.length,
                      (index) => Padding(
                            padding: const EdgeInsets.only(right: 4),
                            child: DotIndicator(IsActive: index == _pageIndex),
                          )),
                  const Spacer(),
                  SizedBox(
                      height: 60,
                      width: 60,
                      child: ElevatedButton(
                        onPressed: () {
                          if (_pageIndex != demo_data.length - 1) {
                            _pageController.nextPage(
                                duration: const Duration(microseconds: 300),
                                curve: Curves.ease);
                          } else {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => SignInScreen()));
                          }
                        },
                        style: ElevatedButton.styleFrom(
                            shape: const CircleBorder(),
                            backgroundColor: Color.fromARGB(255, 187, 60, 143)),
                        child: const Icon(
                          Icons.arrow_forward,
                          color: Colors.white,
                          size: 30,
                        ),
                      )),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

class DotIndicator extends StatelessWidget {
  const DotIndicator({
    super.key,
    required this.IsActive,
  });

  final bool IsActive;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      height: IsActive ? 16 : 4,
      width: 4,
      decoration: BoxDecoration(
          color: IsActive ? Colors.blueGrey : Colors.blueGrey.withOpacity(0.4),
          borderRadius: const BorderRadius.all(Radius.circular(12))),
    );
  }
}

class OnBoard {
  final String image, title, description;
  Color backgroundColor;

  OnBoard({
    required this.image,
    required this.title,
    required this.description,
    required this.backgroundColor,
  });
}

final List<OnBoard> demo_data = [
  OnBoard(
      image: "assets/image/page1.png",
      title: "Cat Breeds",
      description:
          "Provide information about different cat breeds, their characteristics, and appearances.",
      backgroundColor: Colors.black),
  OnBoard(
      image: "assets/image/page2.png",
      title: "Cat Care Tips",
      description:
          "Share tips on how to take care of cats, including feeding, grooming, and providing a safe environment. ",
      backgroundColor: Colors.blue),
  OnBoard(
      image: "assets/image/page3.png",
      title: "Cat Behavior",
      description:
          "Educate users about common cat behaviors, such as playfulness, hunting instincts, and social interactions.",
      backgroundColor: Colors.yellow),
  OnBoard(
      image: "assets/image/page4.png",
      title: "Cat Health and Wellness",
      description:
          "Offer advice on keeping cats healthy, including vaccinations, regular check-ups, and signs of common health issues.",
      backgroundColor: Colors.redAccent),
  OnBoard(
      image: "assets/image/page5.png",
      title: "Cat Adoption and Rescues",
      description:
          "Encourage users to consider adopting a cat from a shelter or rescue organization, and provide information on the adoption process. ",
      backgroundColor: Colors.pinkAccent),
];

class OnBoardingWidget extends StatelessWidget {
  const OnBoardingWidget({
    super.key,
    required this.image,
    required this.title,
    required this.description,
    required this.backgroundColor,
  });

  final String image, title, description;
  final Color backgroundColor;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Spacer(),
        Image.asset(
          image,
          height: 280,
        ),
        const Spacer(),
        Text(
          title,
          textAlign: TextAlign.center,
          style: GoogleFonts.lato(
            textStyle: Theme.of(context).textTheme.displayLarge,
            fontSize: 20,
            fontWeight: FontWeight.w700,
            fontStyle: FontStyle.italic,
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        Text(
          description,
          textAlign: TextAlign.center,
          style: GoogleFonts.lato(
            textStyle: Theme.of(context).textTheme.displayLarge,
            fontSize: 20,
            fontWeight: FontWeight.w500,
            fontStyle: FontStyle.italic,
          ),
        ),
        const Spacer()
      ],
    );
  }
}
