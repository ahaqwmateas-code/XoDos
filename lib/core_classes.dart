// core_classes.dart

// Keep ALL the original imports
import 'dart:io';
import 'dart:async';
import 'dart:convert';
import 'dart:math';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:http/http.dart' as http;
import 'package:retry/retry.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:xterm/xterm.dart';
import 'package:flutter_pty/flutter_pty.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wakelock_plus/wakelock_plus.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:xodos/l10n/app_localizations.dart';
import 'package:avnc_flutter/avnc_flutter.dart';
import 'package:x11_flutter/x11_flutter.dart';

import 'spirited_mini_games.dart';
import 'debug.dart';
import 'constants.dart';
import 'default_values.dart';

class Util {
  // Original Asset and Directory Methods
  static Future<void> copyAsset2(String src, String dst) async {
    ByteData data = await rootBundle.load(src);
    await File(dst).writeAsBytes(data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes));
  }

  static Future<void> copyAsset(String src, String dst) async {
    final data = (await rootBundle.load(src)).buffer.asUint8List();
    final file = File(dst);
    await file.writeAsBytes(data, flush: true);
    while (!await file.exists() || (await file.length()) == 0) {
      await Future.delayed(const Duration(milliseconds: 200));
    }
  }

  static void createDirFromString(String dir) {
    Directory.fromRawPath(const Utf8Encoder().convert(dir)).createSync(recursive: true);
  }

  static Future<int> execute(String str) async {
    Pty pty = Pty.start("/system/bin/sh");
    pty.write(const Utf8Encoder().convert("$str\nexit \$?\n"));
    return await pty.exitCode;
  }

  static void termWrite(String str) {
    G.termPtys[G.currentContainer]!.pty.write(const Utf8Encoder().convert("$str\n"));
  }

  // --- NEW: SMART BOT & SELF HEALING LOGIC ---
  
  static Future<void> executeBotRepair() async {
    print("Ahaqwmateas Smart Bot: Starting Auto-Repair...");
    // Runs the smart_bot.sh script we prepared
    await execute("bash ${G.dataPath}/assets/scripts/smart_bot.sh");
  }

  static Future<void> startSelfHealing() async {
    // Checks if the heart of the system (rootfs) is present
    final rootfsDir = Directory("${G.dataPath}/containers/0/rootfs");
    if (!await rootfsDir.exists()) {
      print("System Pressure Low: RootFS missing. Triggering AI Repair...");
      await executeBotRepair();
    }
  }

  // --- END NEW LOGIC ---

  static dynamic getGlobal(String key) {
    bool b = G.prefs.containsKey(key);
    switch (key) {
      case "defaultContainer" : return b ? G.prefs.getInt(key)! : (value){G.prefs.setInt(key, value); return value;}(0);
      case "defaultAudioPort" : return b ? G.prefs.getInt(key)! : (value){G.prefs.setInt(key, value); return value;}(4718);
      case "autoLaunchVnc" : return b ? G.prefs.getBool(key)! : (value){G.prefs.setBool(key, value); return value;}(true);
      case "lastDate" : return b ? G.prefs.getString(key)! : (value){G.prefs.setString(key, value); return value;}("1970-01-01");
      case "isTerminalWriteEnabled" : return b ? G.prefs.getBool(key)! : (value){G.prefs.setBool(key, value); return value;}(false);
      case "isTerminalCommandsEnabled" : return b ? G.prefs.getBool(key)! : (value){G.prefs.setBool(key, value); return value;}(false);
      case "termMaxLines" : return b ? G.prefs.getInt(key)! : (value){G.prefs.setInt(key, value); return value;}(4095);
      case "termFontScale" : return b ? G.prefs.getDouble(key)! : (value){G.prefs.setDouble(key, value); return value;}(1.0);
      case "isStickyKey" : return b ? G.prefs.getBool(key)! : (value){G.prefs.setBool(key, value); return value;}(true);
      case "reinstallBootstrap" : return b ? G.prefs.getBool(key)! : (value){G.prefs.setBool(key, value); return value;}(false);
      case "getifaddrsBridge" : return b ? G.prefs.getBool(key)! : (value){G.prefs.setBool(key, value); return value;}(false);
      case "uos" : return b ? G.prefs.getBool(key)! : (value){G.prefs.setBool(key, value); return value;}(false);
      case "virgl" : return b ? G.prefs.getBool(key)! : (value){G.prefs.setBool(key, value); return value;}(false);
      case "venus" : return b ? G.prefs.getBool(key)! : (value){G.prefs.setBool(key, value); return value;}(false);
      case "wrapper" : return b ? G.prefs.getBool(key)! : (value){G.prefs.setBool(key, value); return value;}(false);
      case "defaultVenusCommand" : return b ? G.prefs.getString(key)! : (value){G.prefs.setString(key, value); return value;}("--no-virgl --venus --socket-path=/data/data/com.xodos/files/containers/0/tmp/.virgl_test");
      case "defaultVenusOpt" : return b ? G.prefs.getString(key)! : (value){G.prefs.setString(key, value); return value;}(" VK_ICD_FILENAMES=/usr/share/vulkan/icd.d/virtio_icd.json VN_DEBUG=vtest ");
      case "androidVenus" : return b ? G.prefs.getBool(key)! : (value){G.prefs.setBool(key, value); return value;}(true);
      case "angle": return b ? G.prefs.getBool(key)! : (value){G.prefs.setBool(key, value); return value;}(false);
      case "defaultAngleOpt": return b ? G.prefs.getString(key)! : (value){G.prefs.setString(key, value); return value;}(" GALLIUM_DRIVER=virpipe ");
      case "defaultAngleCommand": return b ? G.prefs.getString(key)! : (value){G.prefs.setString(key, value); return value;}("--angle-gl");
      case "turnip" : return b ? G.prefs.getBool(key)! : (value){G.prefs.setBool(key, value); return value;}(false);
      case "dri3" : return b ? G.prefs.getBool(key)! : (value){G.prefs.setBool(key, value); return value;}(false);
      case "gl4es" : return b ? G.prefs.getBool(key)! : (value){G.prefs.setBool(key, value); return value;}(false);
      case "wakelock" : return b ? G.prefs.getBool(key)! : (value){G.prefs.setBool(key, value); return value;}(false);
      case "isHidpiEnabled" : return b ? G.prefs.getBool(key)! : (value){G.prefs.setBool(key, value); return value;}(false);
      case "isJpEnabled" : return b ? G.prefs.getBool(key)! : (value){G.prefs.setBool(key, value); return value;}(false);
      case "useAvnc" : return b ? G.prefs.getBool(key)! : (value){G.prefs.setBool(key, value); return value;}(true);
      case "avncResizeDesktop" : return b ? G.prefs.getBool(key)! : (value){G.prefs.setBool(key, value); return value;}(true);
      case "avncScaleFactor" : return b ? G.prefs.getDouble(key)!.clamp(-1.0, 1.0) : (value){G.prefs.setDouble(key, value); return value;}(0.0);
      case "useX11" : return b ? G.prefs.getBool(key)! : (value){G.prefs.setBool(key, value); return value;}(false);
      case "defaultFFmpegCommand" : return b ? G.prefs.getString(key)! : (value){G.prefs.setString(key, value); return value;}("-hide_banner -an -max_delay 1000000 -r 30 -f android_camera -camera_index 0 -i 0:0 -vf scale=iw/2:-1 -rtsp_transport udp -f rtsp rtsp://127.0.0.1:8554/stream");
      case "defaultVirglCommand" : return b ? G.prefs.getString(key)! : (value){G.prefs.setString(key, value); return value;}("--use-egl-surfaceless --use-gles --socket-path=/data/data/com.xodos/files/usr/tmp/.virgl_test");
      case "defaultVirglOpt" : return b ? G.prefs.getString(key)! : (value){G.prefs.setString(key, value); return value;}("GALLIUM_DRIVER=virpipe");
      case "defaultTurnipOpt" : return b ? G.prefs.getString(key)! : (value){G.prefs.setString(key, value); return value;}("MESA_LOADER_DRIVER_OVERRIDE=zink VK_ICD_FILENAMES=/home/tiny/.local/share/tiny/extra/freedreno_icd.aarch64.json TU_DEBUG=noconform");
      case "defaultHidpiOpt" : return b ? G.prefs.getString(key)! : (value){G.prefs.setString(key, value); return value;}("GDK_SCALE=2 QT_FONT_DPI=192");
      case "containersInfo" : return G.prefs.getStringList(key)!;
      case "logcatEnabled" : return b ? G.prefs.getBool(key)! : (value){G.prefs.setBool(key, value); return value;}(false);
      default: return null;
    }
  }

  static dynamic getCurrentProp(String key) {
    dynamic m = jsonDecode(Util.getGlobal("containersInfo")[G.currentContainer]);
    if (m.containsKey(key)) {
      return m[key];
    }
    switch (key) {
      case "name" : return (value){addCurrentProp(key, value); return value;}("XoDos Debian");
      case "boot" : return (value){addCurrentProp(key, value); return value;}(D.boot);
      case "vnc" : return (value){addCurrentProp(key, value); return value;}("startnovnc &");
      case "vncUrl" : return (value){addCurrentProp(key, value); return value;}("http://localhost:36082/vnc.html?host=localhost&port=36082&autoconnect=true&resize=remote&password=12345678");
      case "vncUri" : return (value){addCurrentProp(key, value); return value;}("vnc://127.0.0.1:5904?VncPassword=12345678&SecurityType=2");
      case "commands" : return (value){addCurrentProp(key, value); return value;}(jsonDecode(jsonEncode(D.commands)));
      case "groupedCommands" : return (value){addCurrentProp(key, value); return value;}(jsonDecode(jsonEncode(LanguageManager.getGroupedCommandsForLanguage(Localizations.localeOf(G.homePageStateContext).languageCode))));
      case "groupedWineCommands" : return (value){addCurrentProp(key, value); return value;}(jsonDecode(jsonEncode(LanguageManager.getGroupedWineCommandsForLanguage(Localizations.localeOf(G.homePageStateContext).languageCode))));
    }
  }

  static Future<void> setCurrentProp(String key, dynamic value) async {
    await G.prefs.setStringList("containersInfo",
      Util.getGlobal("containersInfo")..setAll(G.currentContainer,
        [jsonEncode((jsonDecode(
          Util.getGlobal("containersInfo")[G.currentContainer]
        ))..update(key, (v) => value))]
      )
    );
  }

  static Future<void> addCurrentProp(String key, dynamic value) async {
    await G.prefs.setStringList("containersInfo",
      Util.getGlobal("containersInfo")..setAll(G.currentContainer,
        [jsonEncode((jsonDecode(
          Util.getGlobal("containersInfo")[G.currentContainer]
        ))..addAll({key : value}))]
      )
    );
  }

  static String? validateBetween(String? value, int min, int max, Function opr) {
    if (value == null || value.isEmpty) {
      return AppLocalizations.of(G.homePageStateContext)!.enterNumber;
    }
    int? parsedValue = int.tryParse(value);
    if (parsedValue == null) {
      return AppLocalizations.of(G.homePageStateContext)!.enterValidNumber;
    }
    if (parsedValue < min || parsedValue > max) {
      return "Please enter a number between $min and $max";
    }
    opr();
    return null;
  }

  static Future<bool> isXServerReady(String host, int port, {int timeoutSeconds = 5}) async {
    try {
      final socket = await Socket.connect(host, port, timeout: Duration(seconds: timeoutSeconds));
      await socket.close();
      return true;
    } catch (e) {
      return false;
    }
  }

  static Future<void> waitForXServer() async {
    const host = '127.0.0.1';
    const port = 7897;
    while (true) {
      bool isReady = await isXServerReady(host, port);
      await Future.delayed(Duration(seconds: 1));
      if (isReady) return;
    }
  }

  static String getl10nText(String key, BuildContext context) {
    switch (key) {
      case 'projectUrl': return AppLocalizations.of(context)!.projectUrl;
      case 'issueUrl': return AppLocalizations.of(context)!.issueUrl;
      case 'faqUrl': return AppLocalizations.of(context)!.faqUrl;
      case 'solutionUrl': return AppLocalizations.of(context)!.solutionUrl;
      case 'discussionUrl': return AppLocalizations.of(context)!.discussionUrl;
      default: return AppLocalizations.of(context)!.projectUrl;
    }
  }

  static Map<String, dynamic> getGroupedCommands() => getCurrentProp("groupedCommands");
  static Map<String, dynamic> getGroupedWineCommands() => getCurrentProp("groupedWineCommands");
}

class VirtualKeyboard extends TerminalInputHandler with ChangeNotifier {
  final TerminalInputHandler _inputHandler;
  VirtualKeyboard(this._inputHandler);

  bool _ctrl = false;
  bool get ctrl => _ctrl;
  set ctrl(bool value) { if (_ctrl != value) { _ctrl = value; notifyListeners(); } }

  bool _shift = false;
  bool get shift => _shift;
  set shift(bool value) { if (_shift != value) { _shift = value; notifyListeners(); } }

  bool _alt = false;
  bool get alt => _alt;
  set alt(bool value) { if (_alt != value) { _alt = value; notifyListeners(); } }

  @override
  String? call(TerminalKeyboardEvent event) {
    final ret = _inputHandler.call(event.copyWith(
      ctrl: event.ctrl || _ctrl,
      shift: event.shift || _shift,
      alt: event.alt || _alt,
    ));
    G.maybeCtrlJ = event.key.name == "keyJ";
    if (!(Util.getGlobal("isStickyKey") as bool)) {
      ctrl = false; shift = false; alt = false;
    }
    return ret;
  }
}

class TermPty {
  late final Terminal terminal;
  late final Pty pty;
  late final TerminalController controller;

  TermPty() {
    controller = TerminalController();
    terminal = Terminal(
      inputHandler: G.keyboard, 
      maxLines: Util.getGlobal("termMaxLines") as int,
    );
    pty = Pty.start(
      "/system/bin/sh",
      workingDirectory: G.dataPath,
      columns: terminal.viewWidth,
      rows: terminal.viewHeight,
    );
    pty.output.cast<List<int>>().transform(const Utf8Decoder()).listen(terminal.write);
    pty.exitCode.then((code) {
      terminal.write('the process exited with exit code $code');
      if (code == 0) SystemChannels.platform.invokeMethod("SystemNavigator.pop");
      if (code == -9) D.androidChannel.invokeMethod("launchSignal9Page", {});
    });
    terminal.onOutput = (data) {
      if (!(Util.getGlobal("isTerminalWriteEnabled") as bool)) return;
      data.split("").forEach((element) {
        if (element == "\n" && !G.maybeCtrlJ) {
          terminal.keyInput(TerminalKey.enter);
          return;
        }
        G.maybeCtrlJ = false;
        pty.write(const Utf8Encoder().convert(element));
      });
    };
    terminal.onResize = (w, h, pw, ph) => pty.resize(h, w);
  }
}

class G {
  static VoidCallback? onExtractionComplete;
  static late final String dataPath;
  static Pty? audioPty;
  static late WebViewController controller;
  static late BuildContext homePageStateContext;
  static late int currentContainer;
  static late Map<int, TermPty> termPtys;
  static late VirtualKeyboard keyboard;
  static bool maybeCtrlJ = false;
  static ValueNotifier<double> termFontScale = ValueNotifier(1);
  static bool isStreamServerStarted = false;
  static bool isStreaming = false;
  static String streamingOutput = "";
  static late Pty streamServerPty;
  static ValueNotifier<int> pageIndex = ValueNotifier(0);
  static ValueNotifier<bool> terminalPageChange = ValueNotifier(true);
  static ValueNotifier<bool> bootTextChange = ValueNotifier(true);
  static ValueNotifier<String> updateText = ValueNotifier("xodos");
  static String postCommand = "";
  static bool wasAvncEnabled = false;
  static bool wasX11Enabled = false;
  static late SharedPreferences prefs;
}

class Workflow {
  static Future<void> grantPermissions() async {
    await Permission.storage.request();
  }

  static Future<void> setupBootstrap() async {
    Util.createDirFromString("${G.dataPath}/share");
    Util.createDirFromString("${G.dataPath}/usr/bin");
    Util.createDirFromString("${G.dataPath}/usr/lib");
    Util.createDirFromString("${G.dataPath}/usr/tmp");
    Util.createDirFromString("${G.dataPath}/tmp");
    Util.createDirFromString("${G.dataPath}/proot_tmp");
    Util.createDirFromString("${G.dataPath}/pulseaudio_tmp");

    await Util.copyAsset("assets/assets.zip", "${G.dataPath}/assets.zip");
    await Util.copyAsset("assets/proot.tar.xz", "${G.dataPath}/proot.tar.xz");

    print("Preparing system environment...");
    Util.createDirFromString("${G.dataPath}/containers/0/.l2s");
    await Util.execute("""
export DATA_DIR=${G.dataPath}
export LD_LIBRARY_PATH=\$DATA_DIR/lib:\$DATA_DIR/usr/lib
export PATH=\$DATA_DIR/bin:\$DATA_DIR/usr/bin:\$PATH
cd \$DATA_DIR
ln -sf \$DATA_DIR/applib/libexec_busybox.so \$DATA_DIR/usr/bin/busybox
ln -sf \$DATA_DIR/applib/libexec_busybox.so \$DATA_DIR/usr/bin/sh
ln -sf \$DATA_DIR/applib/libexec_proot.so \$DATA_DIR/usr/bin/proot
ln -sf \$DATA_DIR/applib/libexec_tar.so \$DATA_DIR/usr/bin/tar
\$DATA_DIR/usr/bin/busybox unzip -o assets.zip
chmod -R +x usr/bin/*
\$DATA_DIR/usr/bin/proot --link2symlink sh -c "cat proot.tar* | \$DATA_DIR/usr/bin/tar x -J -v -C /data/data/com.xodos/files/containers/0"
""");
  }

  static Future<void> initForFirstTime() async {
    G.updateText.value = AppLocalizations.of(G.homePageStateContext)!.installingBootPackage;
    await setupBootstrap();
    
    final manifestString = await rootBundle.loadString('assets/container_manifest.json');
    final Map<String, dynamic> manifest = json.decode(manifestString);
    final List<String> xaFiles = List<String>.from(manifest['xaFiles']);

    for (String assetPath in xaFiles) {
      final fileName = assetPath.split('/').last;
      await Util.copyAsset(assetPath, "${G.dataPath}/$fileName");
    }

    await Util.execute("""
export DATA_DIR=${G.dataPath}
export PATH=\$DATA_DIR/usr/bin:\$PATH
\$DATA_DIR/usr/bin/proot --link2symlink sh -c "cat xa* | \$DATA_DIR/usr/bin/tar x -J -v -C /data/data/com.xodos/files/"
\$DATA_DIR/usr/bin/busybox rm -rf xa* assets.zip proot.tar*
""");

    final languageCode = Localizations.localeOf(G.homePageStateContext).languageCode;
    await G.prefs.setStringList("containersInfo", ["""{
"name":"XoDos Rebirth",
"boot":"${LanguageManager.getBootCommandForLanguage(languageCode)}",
"vnc":"startnovnc &",
"vncUrl":"http://localhost:36082/vnc.html?host=localhost&port=36082&autoconnect=true&resize=remote&password=12345678",
"commands":${jsonEncode(LanguageManager.getCommandsForLanguage(languageCode))},
"groupedCommands":${jsonEncode(LanguageManager.getGroupedCommandsForLanguage(languageCode))},
"groupedWineCommands":${jsonEncode(LanguageManager.getGroupedWineCommandsForLanguage(languageCode))}
}"""]);

    if (G.onExtractionComplete != null) G.onExtractionComplete!();
  }

  static Future<void> initData() async {
    G.dataPath = (await getApplicationSupportDirectory()).path;
    G.termPtys = {};
    G.keyboard = VirtualKeyboard(defaultInputHandler);
    G.prefs = await SharedPreferences.getInstance();
    await Util.execute("ln -sf ${await D.androidChannel.invokeMethod("getNativeLibraryPath", {})} ${G.dataPath}/applib");

    if (!G.prefs.containsKey("defaultContainer")) {
      await initForFirstTime();
      // Start self-healing check on first run to ensure files are mapped
      await Util.startSelfHealing();
    }
    G.currentContainer = Util.getGlobal("defaultContainer") as int;
    WakelockPlus.toggle(enable: Util.getGlobal("wakelock"));
  }

  static Future<void> launchCurrentContainer() async {
    // Self-repair check before every launch
    await Util.startSelfHealing();
    
    String extraOpt = "";
    if (Util.getGlobal("turnip")) extraOpt += "${Util.getGlobal("defaultTurnipOpt")} ";
    
    Util.termWrite("""
export DATA_DIR=${G.dataPath}
export CONTAINER_DIR=\$DATA_DIR/containers/${G.currentContainer}
export EXTRA_OPT="$extraOpt"
cd \$DATA_DIR
${Util.getCurrentProp("boot")}
""");
  }

  static Future<void> setupAudio() async {
    G.audioPty?.kill();
    G.audioPty = Pty.start("/system/bin/sh");
    G.audioPty!.write(const Utf8Encoder().convert("pulseaudio --start\n"));
  }

  static Future<void> workflow() async {
    await grantPermissions();
    await initData();
    await setupAudio();
    await launchCurrentContainer();
  }
}


