import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:wakelock_plus/wakelock_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'l10n/app_localizations.dart';
import 'pages.dart';
import 'core_classes.dart';
import 'ultra_ai.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  // Initialize Preferences and Global State
  G.prefs = await SharedPreferences.getInstance();
  
  // Enable Wakelock to keep screen on
  await WakelockPlus.enable();
  
  // Set Immersive Mode
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
  
  runApp(const XoDosApp());
}

class XoDosApp extends StatelessWidget {
  const XoDosApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'XoDos Ultra AI',
      debugShowCheckedModeBanner: false,
      theme: UltraAI.getFuturisticTheme(false),
      darkTheme: UltraAI.getFuturisticTheme(true),
      themeMode: ThemeMode.system,
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: AppLocalizations.supportedLocales,
      home: const MyHomePage(title: 'XoDos Ultra AI'),
    );
  }
}

class RTLWrapper extends StatelessWidget {
  final Widget child;
  const RTLWrapper({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    // Check if the current locale is RTL (like Arabic)
    final isRtl = Directionality.of(context) == TextDirection.rtl;
    return Directionality(
      textDirection: isRtl ? TextDirection.rtl : TextDirection.ltr,
      child: child,
    );
  }
}
