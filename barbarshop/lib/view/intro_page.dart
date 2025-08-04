import 'package:barbarshop/view/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  PageController _controller = PageController();
  bool onLastPage = false;

  // Data for all intro pages
  final List<IntroPageData> introPages = [
    IntroPageData(
      imagePath: 'assets/image/introImg1.png',
      fallbackIcon: Icons.content_cut,
      backgroundColor: Color(0xFF8B4513),
      tagText: '💼 Business Manager',
      title: 'Manage Your\nBarber Business',
      description: 'Track earnings, manage customers, and grow your barbershop efficiently with our professional tools.',
    ),
    IntroPageData(
      imagePath: 'assets/image/introImg2.png',
      fallbackIcon: Icons.people,
      backgroundColor: Color(0xFF2196F3),
      tagText: '👥 Client Database',
      title: 'Customer\nManagement',
      description: 'Store customer details, preferences, and appointment history to provide better service.',
    ),
    IntroPageData(
      imagePath: 'assets/image/introImg3.png',
      fallbackIcon: Icons.analytics,
      backgroundColor: Color(0xFFFF9800),
      tagText: '📊 Financial Tracker',
      title: 'Track Your\nEarnings',
      description: 'Monitor daily income, expenses, and business growth analytics to maximize your profits.',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF5F5F5),
      body: Stack(
        children: [
          PageView.builder(
            controller: _controller,
            itemCount: introPages.length,
            onPageChanged: (index) {
              setState(() {
                onLastPage = (index == introPages.length - 1);
              });
            },
            itemBuilder: (context, index) {
              return IntroPage(data: introPages[index]);
            },
          ),

          // Bottom Navigation Section
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              height: 120,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 20,
                    offset: Offset(0, -5),
                  ),
                ],
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Skip Button
                    onLastPage
                        ? SizedBox(width: 60)
                        : GestureDetector(
                      onTap: () {
                        _controller.jumpToPage(introPages.length - 1);
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                        child: Text(
                          'Skip',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.grey[600],
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),

                    // Page Indicator
                    SmoothPageIndicator(
                      controller: _controller,
                      count: introPages.length,
                      effect: ExpandingDotsEffect(
                        dotColor: Colors.grey[300]!,
                        activeDotColor: Color(0xFF8B4513),
                        dotHeight: 8,
                        dotWidth: 8,
                        expansionFactor: 4,
                        spacing: 6,
                      ),
                    ),

                    // Next/Done Button
                    GestureDetector(
                      onTap: () {
                        if (onLastPage) {
                          // Navigate to home screen
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(builder: (context) => HomePage()),
                          );
                        } else {
                          _controller.nextPage(
                            duration: Duration(milliseconds: 500),
                            curve: Curves.easeInOut,
                          );
                        }
                      },
                      child: Container(
                        width: 60,
                        height: 60,
                        decoration: BoxDecoration(
                          color: Color(0xFF8B4513),
                          borderRadius: BorderRadius.circular(30),
                          boxShadow: [
                            BoxShadow(
                              color: Color(0xFF8B4513).withOpacity(0.3),
                              blurRadius: 15,
                              offset: Offset(0, 5),
                            ),
                          ],
                        ),
                        child: Icon(
                          onLastPage ? Icons.check : Icons.arrow_forward,
                          color: Colors.white,
                          size: 24,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// Data model for intro pages
class IntroPageData {
  final String imagePath;
  final IconData fallbackIcon;
  final Color backgroundColor;
  final String tagText;
  final String title;
  final String description;

  IntroPageData({
    required this.imagePath,
    required this.fallbackIcon,
    required this.backgroundColor,
    required this.tagText,
    required this.title,
    required this.description,
  });
}

class IntroPage extends StatelessWidget {
  final IntroPageData data;

  const IntroPage({
    super.key,
    required this.data,
  });

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return SingleChildScrollView(
      child: Container(
        height: screenHeight,
        padding: EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          children: [
            SizedBox(height: 60),

            Container(
              height: screenHeight * 0.45,
              width: double.infinity,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  // Background Circle
                  Container(
                    width: screenWidth * 0.75,
                    height: screenWidth * 0.75,
                    decoration: BoxDecoration(
                      color: data.backgroundColor.withOpacity(0.1),
                      shape: BoxShape.circle,
                    ),
                  ),
                  // Inner Circle
                  Container(
                    width: screenWidth * 0.65,
                    height: screenWidth * 0.65,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          blurRadius: 20,
                          offset: Offset(0, 8),
                        ),
                      ],
                    ),
                    child: ClipOval(
                      child: Image.asset(
                        data.imagePath,
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) {
                          return Icon(
                            data.fallbackIcon,
                            size: 80,
                            color: data.backgroundColor,
                          );
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // Text Section
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Title with Animation Effect
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 6),
                    decoration: BoxDecoration(
                      color: data.backgroundColor.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(
                      data.tagText,
                      style: TextStyle(
                        fontSize: 12,
                        color: data.backgroundColor,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),

                  SizedBox(height: 16),

                  Text(
                    data.title,
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                      height: 1.2,
                    ),
                    textAlign: TextAlign.center,
                  ),

                  SizedBox(height: 12),

                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: Text(
                      data.description,
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey[600],
                        height: 1.5,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(height: 140),
          ],
        ),
      ),
    );
  }
}