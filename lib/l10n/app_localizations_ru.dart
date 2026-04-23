// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Russian (`ru`).
class AppLocalizationsRu extends AppLocalizations {
  AppLocalizationsRu([String locale = 'ru']) : super(locale);

  @override
  String get appTitle => 'XoDos';

  @override
  String get advancedSettings => 'Расширенные настройки';

  @override
  String get restartAfterChange => 'Изменения вступят в силу после перезапуска';

  @override
  String get resetStartupCommand => 'Сбросить команду запуска';

  @override
  String get attention => 'Внимание';

  @override
  String get confirmResetCommand => 'Сбросить команду запуска?';

  @override
  String get cancel => 'Отмена';

  @override
  String get yes => 'Да';

  @override
  String get signal9ErrorPage => 'Страница ошибки Signal9';

  @override
  String get containerName => 'Имя контейнера';

  @override
  String get startupCommand => 'Команда запуска';

  @override
  String get vncStartupCommand => 'Команда запуска VNC';

  @override
  String get shareUsageHint =>
      'Вы можете использовать XoDos на всех устройствах в одной сети (например, телефонах и ПК в одной WiFi-сети).\n\nНажмите кнопку ниже, чтобы поделиться ссылкой.';

  @override
  String get copyShareLink => 'Копировать ссылку';

  @override
  String get x11InvalidHint => 'Функция недоступна при использовании X11';

  @override
  String get cannotGetIpAddress => 'Не удалось получить IP-адрес';

  @override
  String get shareLinkCopied => 'Ссылка скопирована';

  @override
  String get webRedirectUrl => 'URL перенаправления';

  @override
  String get vncLink => 'VNC ссылка';

  @override
  String get globalSettings => 'Глобальные настройки';

  @override
  String get enableTerminalEditing => 'Разрешить редактирование терминала';

  @override
  String get terminalMaxLines => 'Макс. строки терминала (нужен перезапуск)';

  @override
  String get pulseaudioPort => 'Порт PulseAudio';

  @override
  String get enableTerminal => 'Включить терминал';

  @override
  String get enableTerminalKeypad => 'Включить клавиатуру терминала';

  @override
  String get terminalStickyKeys => 'Залипающие клавиши';

  @override
  String get keepScreenOn => 'Не выключать экран';

  @override
  String get restartRequiredHint =>
      'Следующие параметры вступят в силу при следующем запуске.';

  @override
  String get startWithGUI => 'Запускать с GUI';

  @override
  String get reinstallBootPackage => 'Переустановить загрузочный пакет';

  @override
  String get getifaddrsBridge => 'Мост getifaddrs';

  @override
  String get fixGetifaddrsPermission =>
      'Исправить разрешение getifaddrs (Android 13)';

  @override
  String get fakeUOSSystem => 'Эмулировать систему UOS';

  @override
  String get displaySettings => 'Настройки дисплея';

  @override
  String get avncAdvantages =>
      'AVNC обеспечивает лучший контроль, чем noVNC:\nТачпад-режим, двойной тап для клавиатуры, буфер обмена, PiP и др.';

  @override
  String get avncSettings => 'Настройки AVNC';

  @override
  String get aboutAVNC => 'О AVNC';

  @override
  String get avncResolution => 'Начальное разрешение AVNC';

  @override
  String get resolutionSettings => 'Настройки разрешения';

  @override
  String get deviceScreenResolution => 'Разрешение экрана устройства:';

  @override
  String get width => 'Ширина';

  @override
  String get height => 'Высота';

  @override
  String get save => 'Сохранить';

  @override
  String get applyOnNextLaunch => 'Применится при следующем запуске';

  @override
  String get useAVNCByDefault => 'Использовать AVNC по умолчанию';

  @override
  String get termuxX11Advantages =>
      'Termux:X11 может быть быстрее VNC в некоторых случаях.\n\nОтличия от AVNC:\n- Два пальца = правый клик\n- Кнопка Назад = клавиатура\n\nЕсли экран черный — перезапустите приложение.';

  @override
  String get termuxX11Preferences => 'Настройки Termux:X11';

  @override
  String get useTermuxX11ByDefault => 'Использовать Termux:X11 по умолчанию';

  @override
  String get disableVNC => 'Отключить VNC (нужен перезапуск)';

  @override
  String get hidpiAdvantages =>
      'HiDPI даёт более четкое изображение… но снижает скорость.';

  @override
  String get hidpiEnvVar => 'Переменные HiDPI';

  @override
  String get hidpiSupport => 'Поддержка HiDPI';

  @override
  String get fileAccess => 'Доступ к файлам';

  @override
  String get fileAccessGuide => 'Гид по доступу к файлам';

  @override
  String get fileAccessHint =>
      'Запросите дополнительные разрешения для доступа к каталогам.';

  @override
  String get requestStoragePermission => 'Запросить доступ к хранилищу';

  @override
  String get requestAllFilesAccess => 'Запросить доступ ко всем файлам';

  @override
  String get ignoreBatteryOptimization => 'Игнорировать оптимизацию батареи';

  @override
  String get graphicsAcceleration => 'Графическое ускорение';

  @override
  String get experimentalFeature => 'Экспериментальная функция';

  @override
  String get graphicsAccelerationHint =>
      'Использует GPU для ускорения графики. Возможна нестабильность.\n\nVirgl ускоряет OpenGL ES.';

  @override
  String get virglServerParams => 'Параметры Virgl';

  @override
  String get virglEnvVar => 'Переменные Virgl';

  @override
  String get enableVirgl => 'Включить Virgl';

  @override
  String get turnipAdvantages =>
      'GPU Adreno могут использовать Turnip (Vulkan) и Zink (OpenGL).\n(Для Snapdragon не слишком старых)';

  @override
  String get turnipEnvVar => 'Переменные Turnip';

  @override
  String get enableTurnipZink => 'Включить Turnip+Zink';

  @override
  String get enableDRI3 => 'Включить DRI3';

  @override
  String get dri3Requirement => 'DRI3 требует Termux:X11 и Turnip';

  @override
  String get windowsAppSupport => 'Поддержка Windows-приложений';

  @override
  String get hangoverDescription =>
      'Запуск Windows приложений с Hangover!\n\nДве ступени эмуляции — низкая производительность.\n\nГрафическое ускорение может помочь.\n\nСбои нормальны.\n\nПереместите программы Windows на рабочий стол перед запуском.';

  @override
  String get installHangoverStable => 'Установить стабильный Hangover';

  @override
  String get installHangoverLatest =>
      'Установить последнюю версию Hangover (может не работать)';

  @override
  String get uninstallHangover => 'Удалить Hangover';

  @override
  String get clearWineData => 'Очистить данные Wine';

  @override
  String get wineCommandsHint =>
      'Команды Wine. Откройте GUI и ждите.\n\nОбычно:\nTiger T7510 6GB: >1 мин\nSnapdragon 870: ~10 сек';

  @override
  String get switchToJapanese => 'Сменить систему на японскую';

  @override
  String get userManual => 'Руководство пользователя';

  @override
  String get openSourceLicenses => 'Открытые лицензии';

  @override
  String get permissionUsage => 'Использование разрешений';

  @override
  String get privacyStatement =>
      '\nПриложение не собирает личные данные.\n\nОднако программы внутри контейнера могут это делать.\n\nРазрешения используются для:\nДоступа к файлам\nУведомлений и сервисов Termux:X11';

  @override
  String get supportAuthor => 'Поддержать разработчиков';

  @override
  String get recommendApp => 'Если приложение полезно — расскажите другим!';

  @override
  String get projectUrl => 'URL проекта';

  @override
  String get commandEdit => 'Редактировать команду';

  @override
  String get commandName => 'Имя команды';

  @override
  String get commandContent => 'Содержимое команды';

  @override
  String get deleteItem => 'Удалить';

  @override
  String get add => 'Добавить';

  @override
  String get resetCommand => 'Сбросить команду';

  @override
  String get confirmResetAllCommands => 'Сбросить все команды?';

  @override
  String get addShortcutCommand => 'Добавить быстрый команд';

  @override
  String get more => 'Еще';

  @override
  String get terminal => 'Терминал';

  @override
  String get control => 'Управление';

  @override
  String get enterGUI => 'Войти в GUI';

  @override
  String get enterNumber => 'Введите число';

  @override
  String get enterValidNumber => 'Введите правильное число';

  @override
  String get installingBootPackage => 'Установка загрузочного пакета';

  @override
  String get copyingContainerSystem => 'Копирование системных файлов';

  @override
  String get installingContainerSystem => 'Установка системы';

  @override
  String get installationComplete => 'Установка завершена';

  @override
  String get reinstallingBootPackage => 'Переустановка загрузочного пакета';

  @override
  String get issueUrl => 'Сообщить об ошибке';

  @override
  String get faqUrl => 'FAQ';

  @override
  String get solutionUrl => 'Инструкция';

  @override
  String get discussionUrl => 'Обсуждение';

  @override
  String get firstLoadInstructions =>
      'Первый запуск занимает 5–10 минут... без интернета.\n\nПосле загрузки откроется графический интерфейс.\n\nВ GUI:\n- Касание = левый клик\n- Долгое удержание = правый клик\n- Два пальца = клавиатура\n- Два пальца вверх/вниз = прокрутка\n\nНе закрывайте приложение во время установки.';

  @override
  String get updateRequest =>
      'Пожалуйста, используйте последнюю версию. Проверьте проект.';

  @override
  String get avncScreenResize => 'Адаптивный размер экрана';

  @override
  String get avncResizeFactor => 'Screen Scaling Ratio';

  @override
  String get avncResizeFactorValue => 'Current scaling is';

  @override
  String get waitingGames => 'Игра во время ожидания';

  @override
  String get extrusionProcess => 'Процесс экструзии';

  @override
  String get gameTitleSnake => 'Игра Змейка';

  @override
  String get gameTitleTetris => 'Тетрис';

  @override
  String get gameTitleFlappy => 'Flappy Bird';

  @override
  String score(Object score) {
    return 'Счёт: $score';
  }

  @override
  String get gameOver => 'Игра окончена! Нажмите, чтобы начать заново';

  @override
  String get startGame => 'Нажмите, чтобы начать';

  @override
  String get pause => 'Пауза';

  @override
  String get resume => 'Продолжить';

  @override
  String get extractionCompleteExitGame =>
      'Извлечение завершено! Выход из игрового режима.';

  @override
  String get mindTwisterGames => 'Игры для Ума';

  @override
  String get extractionInProgress =>
      'Воспроизведение - Извлечение в процессе...';

  @override
  String get playWhileWaiting => 'Играйте, пока ждете системные процессы';

  @override
  String get gameModeActive => 'Игровой Режим Активен';

  @override
  String get simulateExtractionComplete => 'Сымитировать Завершение Извлечения';

  @override
  String get installCommandsSection => 'Быстрые команды';

  @override
  String get backupRestore => 'Резервное копирование и восстановление';

  @override
  String get backup => 'Резервная копия';

  @override
  String get restore => 'Восстановить';

  @override
  String get backupSystem => 'Резервное копирование системы';

  @override
  String get restoreSystem => 'Восстановление системы';

  @override
  String get systemBackupRestore =>
      'Резервное копирование и восстановление системы';

  @override
  String get backupRestoreDescriptionShort =>
      'Создайте резервную копию или восстановите систему';

  @override
  String get backupRestoreDescription =>
      'Создайте резервную копию системы или восстановите её из предыдущей копии. Установки Wine также можно восстановить.';

  @override
  String get backupRestoreWarning =>
      'Предупреждение: Восстановление резервной копии перезапишет существующие системные файлы. Убедитесь, что у вас есть актуальная копия.';

  @override
  String get backupNote =>
      'Примечание: Файлы резервных копий сохраняются в /sd/xodos2backup.tar.xz';

  @override
  String get confirmBackup => 'Подтвердить резервное копирование';

  @override
  String get backupConfirmation =>
      'Система будет сохранена в /sd/xodos2backup.tar.xz. Продолжить?';

  @override
  String get backupInProgress => 'Выполняется резервное копирование...';

  @override
  String get backupComplete => 'Резервное копирование успешно завершено!';

  @override
  String get backupFailed => 'Ошибка резервного копирования';

  @override
  String get systemRestore => 'Восстановление системы';

  @override
  String get systemRestoreWarning =>
      'Система будет восстановлена из резервной копии с перезаписью файлов. Вы уверены?';

  @override
  String get restoreInProgress => 'Выполняется восстановление...';

  @override
  String get restoreFailed => 'Ошибка восстановления';

  @override
  String get installWine => 'Установить Wine';

  @override
  String get wineInstallationWarning =>
      'Wine будет установлен в систему x86_64 и заменён, если уже существует. Вы уверены?';

  @override
  String get installingWine => 'Установка Wine...';

  @override
  String get wineInstallationFailed => 'Ошибка установки Wine';

  @override
  String get fileSelectionFailed => 'Ошибка выбора файла';

  @override
  String get restartRequired => 'Требуется перезапуск';

  @override
  String get restartAppToApply =>
      'Перезапустите приложение, чтобы применить изменения.';

  @override
  String get close => 'Закрыть';

  @override
  String get install => 'Установить';

  @override
  String get ok => 'ОК';

  @override
  String get invalidPath => 'Неверный путь';

  @override
  String get unsupportedFormat => 'Неподдерживаемый формат';

  @override
  String get backupRestoreHint =>
      'Резервная копия создаёт /sd/xodos2backup.tar.xz\nВосстановление поддерживает .tar, .tar.gz, .tar.xz\nАрхивы Wine будут установлены в /opt/wine';

  @override
  String get wineInstallationComplete => 'Установка Wine завершена!';

  @override
  String get restoreComplete => 'Восстановление системы завершено!';

  @override
  String get checkTerminalForProgress =>
      'Проверьте терминал для просмотра прогресса...';

  @override
  String get importantNote => 'Важное примечание';

  @override
  String get enableAndroidVenus => 'Включить ANDROID_VENUS=1';

  @override
  String get androidVenusHint =>
      'Добавьте переменную окружения ANDROID_VENUS=1 в команду сервера Venus';

  @override
  String get venusSection => 'Venus (Vulkan)';

  @override
  String get venusAdvantages =>
      'Аппаратное ускорение Vulkan с использованием драйвера Vulkan Android';

  @override
  String get venusServerParams => 'Параметры сервера Venus';

  @override
  String get venusEnvVar => 'Переменные окружения Venus';

  @override
  String get enableVenus => 'Включить Venus (Android Vulkan)';

  @override
  String get virglSection => 'VirGL (OpenGL)';
}
