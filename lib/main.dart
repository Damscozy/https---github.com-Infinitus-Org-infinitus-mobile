import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:infinitus/core/routes/app_router.dart';
import 'package:infinitus/data/binding/appbinding.dart';
import 'package:infinitus/data/controller/theme_controller.dart';
import 'package:infinitus/presentation/utils/colors.dart';
import 'package:infinitus/presentation/utils/theme.dart';
import 'package:infinitus/presentation/widgets/customWidgets.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // ignore: prefer_const_constructors
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Infinitus',
      initialBinding: AppBinding(),
      theme: getLightTheme(),
      themeMode: ThemeMode.system,
      onGenerateRoute: generateRoute,
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final controller = Get.find<ThemeController>();
  int _counter = 0;
  bool isDarkMode = true;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  void _changeTheme() {
    setState(() {});
    isDarkMode ? getDarkTheme() : getLightTheme();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            customTitleText(
              'You have pushed the button this many times:',
              textAlign: TextAlign.center,
              textOverflow: TextOverflow.clip,
            ),
            Text(
              '$_counter',
              style: Get.textTheme.headline4,
            ),
            const Gap(20),
            IconButton(
              icon: Icon(
                controller.isDarkMode ? Icons.dark_mode : Icons.light_mode,
              ),
              onPressed: () => controller.toggleDarkMode(),
            ),
            IconButton(
              icon: Icon(
                isDarkMode ? Icons.dangerous : Icons.check,
              ),
              onPressed: () => _changeTheme(),
            ),
            GetBuilder<ThemeController>(
              builder: (_) => GestureDetector(
                onTap: () => _.toggleDarkMode(),
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  decoration: BoxDecoration(
                    color: AppColors.primary,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: customDescriptionText(
                    'Change Theme',
                    colors: controller.isDarkMode
                        ? AppColors.dashboardBlack
                        : AppColors.whiteColor,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
