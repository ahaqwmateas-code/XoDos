import 'package:flutter/material.dart';
import 'package:xterm/xterm.dart';
import 'package:flutter_pty/flutter_pty.dart';
import 'package:wakelock_plus/wakelock_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:url_launcher/url_launcher.dart';
import 'dart:io';
import 'core_classes.dart';
import 'light_blue_theme.dart';
import 'main.dart';

// ============================================================================
// MAIN HOME PAGE
// ============================================================================
class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool isLoadingComplete = false;

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () async {
      await _initialize();
    });
  }

  Future<void> _initialize() async {
    try {
      await Util.startSelfHealing();
      if (mounted) {
        setState(() => isLoadingComplete = true);
      }
    } catch (e) {
      print("Initialization error: $e");
      if (mounted) {
        setState(() => isLoadingComplete = true);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    G.homePageStateContext = context;

    return RTLWrapper(
      child: Scaffold(
        appBar: AppBar(
          title: Text(isLoadingComplete ? Util.getCurrentProp("name") : widget.title),
          backgroundColor: LightBlueTheme.cardBg,
          foregroundColor: LightBlueTheme.primaryBlue,
        ),
        body: isLoadingComplete
            ? ValueListenableBuilder(
                valueListenable: G.pageIndex,
                builder: (context, value, child) {
                  return IndexedStack(
                    index: G.pageIndex.value,
                    children: const [
                      TerminalPage(),
                      ControlPage(),
                    ],
                  );
                },
              )
            : Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color>(LightBlueTheme.primaryBlue),
                    ),
                    const SizedBox(height: 24),
                    const Text(
                      'Initializing XoDos Ultra AI...',
                      style: TextStyle(color: LightBlueTheme.primaryBlue, fontSize: 18),
                    ),
                  ],
                ),
              ),
        bottomNavigationBar: ValueListenableBuilder(
          valueListenable: G.pageIndex,
          builder: (context, value, child) {
            return Visibility(
              visible: isLoadingComplete,
              child: NavigationBar(
                selectedIndex: G.pageIndex.value,
                backgroundColor: LightBlueTheme.cardBg,
                indicatorColor: LightBlueTheme.primaryBlue,
                destinations: [
                  NavigationDestination(
                    icon: Icon(Icons.monitor, 
                      color: G.pageIndex.value == 0 ? LightBlueTheme.primaryBlue : LightBlueTheme.textSecondary),
                    label: 'Terminal',
                  ),
                  NavigationDestination(
                    icon: Icon(Icons.settings, 
                      color: G.pageIndex.value == 1 ? LightBlueTheme.primaryBlue : LightBlueTheme.textSecondary),
                    label: 'Control',
                  ),
                ],
                onDestinationSelected: (index) {
                  G.pageIndex.value = index;
                },
              ),
            );
          },
        ),
      ),
    );
  }
}

// ============================================================================
// TERMINAL PAGE
// ============================================================================
class TerminalPage extends StatefulWidget {
  const TerminalPage({super.key});

  @override
  State<TerminalPage> createState() => _TerminalPageState();
}

class _TerminalPageState extends State<TerminalPage> {
  late Terminal terminal;
  late PseudoTerminal pty;
  TextEditingController commandController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _initializeTerminal();
  }

  Future<void> _initializeTerminal() async {
    try {
      terminal = Terminal();
      pty = PseudoTerminal.start('bash');
      terminal.write('XoDos Ultra AI Terminal Ready\r\n');
    } catch (e) {
      print("Terminal initialization error: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: LightBlueTheme.darkBg,
      child: Column(
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: LightBlueTheme.cardBg,
                border: Border.all(color: LightBlueTheme.primaryBlue, width: 0.5),
              ),
              child: const Center(
                child: Text(
                  'Terminal View Ready',
                  style: TextStyle(color: LightBlueTheme.textSecondary),
                ),
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: LightBlueTheme.cardBg,
              border: Border(top: BorderSide(color: LightBlueTheme.primaryBlue, width: 0.5)),
            ),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: commandController,
                    style: const TextStyle(color: LightBlueTheme.textPrimary),
                    decoration: InputDecoration(
                      hintText: 'Enter command...',
                      hintStyle: const TextStyle(color: LightBlueTheme.textSecondary),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: const BorderSide(color: LightBlueTheme.primaryBlue),
                      ),
                      contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                    ),
                    onSubmitted: (cmd) {
                      if (cmd.isNotEmpty) {
                        Util.termWrite(cmd);
                        commandController.clear();
                      }
                    },
                  ),
                ),
                const SizedBox(width: 12),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: LightBlueTheme.primaryBlue,
                    foregroundColor: LightBlueTheme.darkBg,
                  ),
                  onPressed: () {
                    if (commandController.text.isNotEmpty) {
                      Util.termWrite(commandController.text);
                      commandController.clear();
                    }
                  },
                  child: const Icon(Icons.send),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    commandController.dispose();
    super.dispose();
  }
}

// ============================================================================
// CONTROL PAGE
// ============================================================================
class ControlPage extends StatefulWidget {
  const ControlPage({super.key});

  @override
  State<ControlPage> createState() => _ControlPageState();
}

class _ControlPageState extends State<ControlPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: LightBlueTheme.darkBg,
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            // App Icon
            Container(
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: LightBlueTheme.primaryBlue, width: 2),
              ),
              child: const Icon(Icons.apps, size: 100, color: LightBlueTheme.primaryBlue),
            ),
            const SizedBox(height: 24),

            // Quick Commands Section
            Card(
              color: LightBlueTheme.cardBg,
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Quick Commands',
                      style: TextStyle(
                        color: LightBlueTheme.primaryBlue,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 16),
                    const FastCommands(),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),

            // Settings Section
            Card(
              color: LightBlueTheme.cardBg,
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Settings',
                      style: TextStyle(
                        color: LightBlueTheme.primaryBlue,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 16),
                    const SettingPage(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ============================================================================
// FAST COMMANDS
// ============================================================================
class FastCommands extends StatefulWidget {
  const FastCommands({super.key});

  @override
  State<FastCommands> createState() => _FastCommandsState();
}

class _FastCommandsState extends State<FastCommands> {
  @override
  Widget build(BuildContext context) {
    final commands = Util.getCurrentProp("commands") as List<dynamic>? ?? [];

    return Column(
      children: [
        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: commands.map((cmd) {
            return ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: LightBlueTheme.primaryBlue,
                foregroundColor: LightBlueTheme.darkBg,
              ),
              onPressed: () {
                Util.termWrite(cmd["command"] ?? "");
                G.pageIndex.value = 0;
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('Executed: ${cmd["name"] ?? "Command"}'),
                    backgroundColor: LightBlueTheme.accentBlue,
                  ),
                );
              },
              child: Text(cmd["name"] ?? "Command"),
            );
          }).toList(),
        ),
        const SizedBox(height: 16),
        ElevatedButton.icon(
          style: ElevatedButton.styleFrom(
            backgroundColor: LightBlueTheme.accentBlue,
            foregroundColor: LightBlueTheme.darkBg,
          ),
          onPressed: () {
            _showAddCommandDialog();
          },
          icon: const Icon(Icons.add),
          label: const Text('Add Command'),
        ),
      ],
    );
  }

  void _showAddCommandDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: LightBlueTheme.cardBg,
        title: const Text('Add Command', style: TextStyle(color: LightBlueTheme.primaryBlue)),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              style: const TextStyle(color: LightBlueTheme.textPrimary),
              decoration: const InputDecoration(
                hintText: 'Command Name',
                hintStyle: TextStyle(color: LightBlueTheme.textSecondary),
              ),
            ),
            const SizedBox(height: 12),
            TextField(
              style: const TextStyle(color: LightBlueTheme.textPrimary),
              decoration: const InputDecoration(
                hintText: 'Command',
                hintStyle: TextStyle(color: LightBlueTheme.textSecondary),
              ),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel', style: TextStyle(color: LightBlueTheme.primaryBlue)),
          ),
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Add', style: TextStyle(color: LightBlueTheme.primaryBlue)),
          ),
        ],
      ),
    );
  }
}

// ============================================================================
// SETTING PAGE
// ============================================================================
class SettingPage extends StatefulWidget {
  const SettingPage({super.key});

  @override
  State<SettingPage> createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SwitchListTile(
          title: const Text('Auto-Fix Enabled', style: TextStyle(color: LightBlueTheme.textPrimary)),
          value: G.prefs.getBool('auto_fix') ?? true,
          onChanged: (value) {
            G.prefs.setBool('auto_fix', value);
            setState(() {});
          },
          activeColor: LightBlueTheme.primaryBlue,
        ),
        SwitchListTile(
          title: const Text('Auto-Refresh', style: TextStyle(color: LightBlueTheme.textPrimary)),
          value: G.prefs.getBool('auto_refresh') ?? true,
          onChanged: (value) {
            G.prefs.setBool('auto_refresh', value);
            setState(() {});
          },
          activeColor: LightBlueTheme.primaryBlue,
        ),
        const SizedBox(height: 16),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: LightBlueTheme.primaryBlue,
            foregroundColor: LightBlueTheme.darkBg,
          ),
          onPressed: () {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Settings saved!'),
                backgroundColor: LightBlueTheme.accentBlue,
              ),
            );
          },
          child: const Text('Save Settings'),
        ),
      ],
    );
  }
}
