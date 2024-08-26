import 'package:gluestack_ui/gluestack_ui.dart';
import 'package:myntra_clone/routes/router.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GluestackProvider(
      gluestackTokenConfig: GluestackTokenConfig(),
      child: GSTheme(
        data: GSThemeData.fromTheme('light_theme'),
        child: GSApp.router(
          debugShowCheckedModeBanner: false,
          theme: GSThemeData.fromTheme('light_theme'),
          routerConfig: router,
        ),
      ),
    );
  }
}
