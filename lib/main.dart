import 'package:gluestack_ui/gluestack_ui.dart';
import 'package:myntra_clone/screens/homescreen.dart';
import 'package:myntra_clone/utils/theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GluestackProvider(
      gluestackTokenConfig: GluestackTokenConfig(
        gsThemeToken: myTheme,
      ),
      child: GSApp(
        debugShowCheckedModeBanner: false,
        theme: GSThemeData.fromTheme('light_theme'),
        localizationsDelegates: const [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        home: const HomeScreen(),
      ),
    );
  }
}

