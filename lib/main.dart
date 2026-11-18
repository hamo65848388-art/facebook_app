import 'dart:async';
import 'package:flutter/material.dart';

void main() {
  runApp(const FacebookApp());
}

const Color blue = Color(0xFF1877F2);
const Color dark = Color(0xFF242526);
const Color grey = Color(0xFF65676B);
const Color lightGrey = Color(0xFFF0F2F5);

class FacebookApp extends StatelessWidget {
  const FacebookApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Facebook',
      theme: ThemeData(
        useMaterial3: true,
        fontFamily: 'Arial',
        colorScheme: ColorScheme.fromSeed(seedColor: blue),
        scaffoldBackgroundColor: Colors.white,
      ),
      home: const SplashScreen(),
    );
  }
}

/* =========================================================
   SPLASH SCREEN
========================================================= */

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    Timer(const Duration(seconds: 2), () {
      if (!mounted) return;

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (_) => const LoginScreen(),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/429820590_791043733050594_2437304548159507703_n.jpg',
              width: 115,
              height: 115,
              fit: BoxFit.contain,
            ),
          ],
        ),
      ),
    );
  }
}

/* =========================================================
   LOGIN SCREEN
========================================================= */

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  bool obscurePassword = true;

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 28),
          child: Column(
            children: [
              const SizedBox(height: 45),

              // Facebook rounded logo
              Container(
                width: 125,
                height: 125,
                decoration: BoxDecoration(
                  color: const Color(0xFFEAF2FF),
                  borderRadius: BorderRadius.circular(65),
                ),
                child: Center(
                  child: Container(
                    width: 75,
                    height: 75,
                    decoration: const BoxDecoration(
                      color: blue,
                      shape: BoxShape.circle,
                    ),
                    child: const Center(
                      child: Text(
                        'f',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 62,
                          fontWeight: FontWeight.bold,
                          height: 1,
                        ),
                      ),
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 32),

              // Email
              TextField(
                controller: emailController,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  hintText: 'Mobile Number or Email address',
                  hintStyle: const TextStyle(
                    color: Color(0xFF8A8D91),
                    fontSize: 14,
                  ),
                  filled: true,
                  fillColor: const Color(0xFFF0F2F5),
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 15,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(7),
                    borderSide: BorderSide.none,
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(7),
                    borderSide: BorderSide.none,
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(7),
                    borderSide: const BorderSide(
                      color: blue,
                      width: 1,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 12),

              // Password
              TextField(
                controller: passwordController,
                obscureText: obscurePassword,
                decoration: InputDecoration(
                  hintText: 'Password',
                  hintStyle: const TextStyle(
                    color: Color(0xFF8A8D91),
                    fontSize: 14,
                  ),
                  filled: true,
                  fillColor: const Color(0xFFF0F2F5),
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 15,
                  ),
                  suffixIcon: IconButton(
                    onPressed: () {
                      setState(() {
                        obscurePassword = !obscurePassword;
                      });
                    },
                    icon: Icon(
                      obscurePassword
                          ? Icons.visibility_outlined
                          : Icons.visibility_off_outlined,
                      color: grey,
                    ),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(7),
                    borderSide: BorderSide.none,
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(7),
                    borderSide: BorderSide.none,
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(7),
                    borderSide: const BorderSide(
                      color: blue,
                      width: 1,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 16),

              // Login button
              SizedBox(
                width: double.infinity,
                height: 47,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (_) => const HomeScreen(),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: blue,
                    foregroundColor: Colors.white,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(7),
                    ),
                  ),
                  child: const Text(
                    'Login',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 15),

              // Forgotten password
              TextButton(
                onPressed: () {},
                child: const Text(
                  'Forgotten Password ?',
                  style: TextStyle(
                    color: blue,
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),

              const SizedBox(height: 5),

              Row(
                children: [
                  const Expanded(
                    child: Divider(
                      color: Color(0xFFDADDE1),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 14),
                    child: Text(
                      'OR',
                      style: TextStyle(
                        color: grey,
                        fontSize: 12,
                      ),
                    ),
                  ),
                  const Expanded(
                    child: Divider(
                      color: Color(0xFFDADDE1),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 20),

              // Create account
              SizedBox(
                height: 44,
                child: OutlinedButton(
                  onPressed: () {},
                  style: OutlinedButton.styleFrom(
                    side: const BorderSide(
                      color: blue,
                      width: 1.2,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(7),
                    ),
                  ),
                  child: const Text(
                    'Create Account',
                    style: TextStyle(
                      color: blue,
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 40),

              const Text(
                'Meta',
                style: TextStyle(
                  color: Color(0xFF777777),
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ),
              ),

              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}

/* =========================================================
   HOME SCREEN
========================================================= */

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: lightGrey,

      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        surfaceTintColor: Colors.white,
        titleSpacing: 16,
        title: const Text(
          'Facebook',
          style: TextStyle(
            color: blue,
            fontSize: 26,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          _circleIcon(Icons.search),
          const SizedBox(width: 8),
          _circleIcon(Icons.chat_bubble_rounded),
          const SizedBox(width: 12),
        ],
      ),

      body: currentIndex == 0
          ? const HomeFeed()
          : Center(
        child: Text(
          currentIndex == 1
              ? 'Friends'
              : currentIndex == 2
              ? 'Notifications'
              : 'Menu',
          style: const TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),

      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        selectedItemColor: blue,
        unselectedItemColor: grey,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            activeIcon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.people_outline),
            activeIcon: Icon(Icons.people),
            label: 'Friends',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications_none),
            activeIcon: Icon(Icons.notifications),
            label: 'Notifications',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.menu),
            activeIcon: Icon(Icons.menu),
            label: 'Menu',
          ),
        ],
      ),
    );
  }

  Widget _circleIcon(IconData icon) {
    return Container(
      width: 38,
      height: 38,
      decoration: const BoxDecoration(
        color: Color(0xFFF0F2F5),
        shape: BoxShape.circle,
      ),
      child: Icon(
        icon,
        color: Colors.black,
        size: 21,
      ),
    );
  }
}

/* =========================================================
   HOME FEED
========================================================= */

class HomeFeed extends StatelessWidget {
  const HomeFeed({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const SizedBox(height: 8),

          _composer(),

          const SizedBox(height: 8),

          _stories(),

          const SizedBox(height: 8),

          _post(),

          const SizedBox(height: 30),
        ],
      ),
    );
  }

  /* ---------------- COMPOSER ---------------- */

  Widget _composer() {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.fromLTRB(12, 12, 12, 8),
      child: Column(
        children: [
          Row(
            children: [
              _avatar('assets/model4.jpg', 42),
              const SizedBox(width: 10),
              Expanded(
                child: Container(
                  height: 42,
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  alignment: Alignment.centerLeft,
                  decoration: BoxDecoration(
                    color: const Color(0xFFF0F2F5),
                    borderRadius: BorderRadius.circular(24),
                  ),
                  child: const Text(
                    "What's on your mind?",
                    style: TextStyle(
                      color: grey,
                      fontSize: 14,
                    ),
                  ),
                ),
              ),
            ],
          ),

          const SizedBox(height: 10),

          Row(
            children: [
              Expanded(
                child: _composerButton(
                  Icons.videocam,
                  const Color(0xFFF3425F),
                  'Live Video',
                ),
              ),
              Expanded(
                child: _composerButton(
                  Icons.photo_library,
                  const Color(0xFF45BD62),
                  'Photo/Video',
                ),
              ),
              Expanded(
                child: _composerButton(
                  Icons.emoji_emotions,
                  const Color(0xFFF7B928),
                  'Feeling',
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _composerButton(
      IconData icon,
      Color iconColor,
      String text,
      ) {
    return InkWell(
      onTap: () {},
      child: SizedBox(
        height: 38,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              color: iconColor,
              size: 22,
            ),
            const SizedBox(width: 5),
            Flexible(
              child: Text(
                text,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  color: grey,
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  /* ---------------- STORIES ---------------- */

  Widget _stories() {
    final stories = [
      {
        'image': 'assets/096ff7fd728e880bca931a69a1417a5f.jpg',
        'name': 'Create a Story',
      },
      {
        'image': 'assets/model1.jpg',
        'name': 'Ahmed',
      },
      {
        'image': 'assets/model2.jpg',
        'name': 'Sara',
      },
      {
        'image': 'assets/model3.jpg',
        'name': 'Omar',
      },
      {
        'image': 'assets/model4.jpg',
        'name': 'Mariam',
      },
    ];

    return Container(
      color: Colors.white,
      height: 190,
      padding: const EdgeInsets.symmetric(
        vertical: 10,
      ),
      child: ListView.separated(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        scrollDirection: Axis.horizontal,
        itemCount: stories.length,
        separatorBuilder: (_, __) => const SizedBox(width: 8),
        itemBuilder: (context, index) {
          return _storyCard(
            stories[index]['image']!,
            stories[index]['name']!,
            index == 0,
          );
        },
      ),
    );
  }

  Widget _storyCard(
      String image,
      String name,
      bool createStory,
      ) {
    return Container(
      width: 112,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: const Color(0xFFDADDE1),
        ),
        image: DecorationImage(
          image: AssetImage(image),
          fit: BoxFit.cover,
        ),
      ),
      child: Stack(
        children: [
          Positioned.fill(
            child: DecoratedBox(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.transparent,
                    Colors.black.withOpacity(.65),
                  ],
                ),
              ),
            ),
          ),

          if (createStory)
            Positioned(
              left: 38,
              top: 84,
              child: Container(
                width: 36,
                height: 36,
                decoration: const BoxDecoration(
                  color: blue,
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.add,
                  color: Colors.white,
                  size: 25,
                ),
              ),
            ),

          Positioned(
            left: 8,
            right: 8,
            bottom: 10,
            child: Text(
              name,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 12,
                fontWeight: FontWeight.bold,
                shadows: [
                  Shadow(
                    color: Colors.black,
                    blurRadius: 4,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  /* ---------------- POST ---------------- */

  Widget _post() {
    return Container(
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(12, 12, 10, 8),
            child: Row(
              children: [
                _avatar(
                  'assets/model1.jpg',
                  42,
                ),
                const SizedBox(width: 9),

                const Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Route',
                        style: TextStyle(
                          color: dark,
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 2),
                      Row(
                        children: [
                          Text(
                            '1h',
                            style: TextStyle(
                              color: grey,
                              fontSize: 11,
                            ),
                          ),
                          SizedBox(width: 4),
                          Icon(
                            Icons.public,
                            color: grey,
                            size: 12,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),

                const Icon(
                  Icons.more_horiz,
                  color: grey,
                ),
              ],
            ),
          ),

          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 12),
            child: Text(
              'Welcome to Route 👋',
              style: TextStyle(
                color: dark,
                fontSize: 14,
              ),
            ),
          ),

          const SizedBox(height: 10),

          // Route image exactly from assets
          Image.asset(
            'assets/394207767_709508957870739_4789263993603935944_n.jpg',
            width: double.infinity,
            height: 270,
            fit: BoxFit.cover,
          ),

          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 12,
              vertical: 8,
            ),
            child: Row(
              children: [
                Container(
                  width: 20,
                  height: 20,
                  decoration: const BoxDecoration(
                    color: blue,
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(
                    Icons.thumb_up,
                    color: Colors.white,
                    size: 12,
                  ),
                ),

                const SizedBox(width: 5),

                const Text(
                  'Like',
                  style: TextStyle(
                    color: grey,
                    fontSize: 12,
                  ),
                ),

                const Spacer(),

                const Text(
                  '12 Comments',
                  style: TextStyle(
                    color: grey,
                    fontSize: 12,
                  ),
                ),

                const SizedBox(width: 8),

                const Text(
                  '3 Shares',
                  style: TextStyle(
                    color: grey,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),

          const Divider(
            height: 1,
            color: Color(0xFFE4E6EB),
          ),

          Row(
            children: [
              _postAction(
                Icons.thumb_up_outlined,
                'Like',
              ),
              _postAction(
                Icons.mode_comment_outlined,
                'Comment',
              ),
              _postAction(
                Icons.share_outlined,
                'Share',
              ),
              _postAction(
                Icons.bookmark_border,
                'Save',
              ),
            ],
          ),

          const Divider(
            height: 1,
            color: Color(0xFFE4E6EB),
          ),
        ],
      ),
    );
  }

  Widget _postAction(
      IconData icon,
      String title,
      ) {
    return Expanded(
      child: InkWell(
        onTap: () {},
        child: SizedBox(
          height: 44,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                icon,
                color: grey,
                size: 19,
              ),
              const SizedBox(width: 5),
              Text(
                title,
                style: const TextStyle(
                  color: grey,
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _avatar(
      String image,
      double size,
      ) {
    return ClipOval(
      child: Image.asset(
        image,
        width: size,
        height: size,
        fit: BoxFit.cover,
      ),
    );
  }
}