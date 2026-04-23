// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Portuguese (`pt`).
class AppLocalizationsPt extends AppLocalizations {
  AppLocalizationsPt([String locale = 'pt']) : super(locale);

  @override
  String get appTitle => 'XoDos';

  @override
  String get advancedSettings => 'Configurações avançadas';

  @override
  String get restartAfterChange => 'As alterações terão efeito após reiniciar';

  @override
  String get resetStartupCommand => 'Redefinir comando de inicialização';

  @override
  String get attention => 'Aviso';

  @override
  String get confirmResetCommand => 'Redefinir comando de inicialização?';

  @override
  String get cancel => 'Cancelar';

  @override
  String get yes => 'Sim';

  @override
  String get signal9ErrorPage => 'Página de erro Signal9';

  @override
  String get containerName => 'Nome do contêiner';

  @override
  String get startupCommand => 'Comando de inicialização';

  @override
  String get vncStartupCommand => 'Comando de inicialização VNC';

  @override
  String get shareUsageHint =>
      'Você pode usar o XoDos em todos os dispositivos da mesma rede (ex.: celulares e computadores conectados ao mesmo WiFi).\n\nClique no botão abaixo para compartilhar o link com outros dispositivos.';

  @override
  String get copyShareLink => 'Copiar link';

  @override
  String get x11InvalidHint => 'Este recurso não está disponível ao usar X11';

  @override
  String get cannotGetIpAddress => 'Falha ao obter o endereço IP';

  @override
  String get shareLinkCopied => 'Link copiado';

  @override
  String get webRedirectUrl => 'URL de redirecionamento web';

  @override
  String get vncLink => 'Link VNC';

  @override
  String get globalSettings => 'Configurações globais';

  @override
  String get enableTerminalEditing => 'Ativar edição do terminal';

  @override
  String get terminalMaxLines => 'Linhas máximas do terminal (requer reinício)';

  @override
  String get pulseaudioPort => 'Porta PulseAudio';

  @override
  String get enableTerminal => 'Ativar terminal';

  @override
  String get enableTerminalKeypad => 'Ativar teclado do terminal';

  @override
  String get terminalStickyKeys => 'Teclas fixas do terminal';

  @override
  String get keepScreenOn => 'Manter tela ligada';

  @override
  String get restartRequiredHint =>
      'As opções abaixo terão efeito no próximo lançamento.';

  @override
  String get startWithGUI => 'Iniciar com GUI ativada';

  @override
  String get reinstallBootPackage => 'Reinstalar pacote de inicialização';

  @override
  String get getifaddrsBridge => 'Ponte getifaddrs';

  @override
  String get fixGetifaddrsPermission =>
      'Corrigir permissão getifaddrs no Android 13';

  @override
  String get fakeUOSSystem => 'Simular sistema como UOS';

  @override
  String get displaySettings => 'Configurações de exibição';

  @override
  String get avncAdvantages =>
      'AVNC oferece melhor controle que noVNC:\nModo touchpad, toque duplo para teclado, clipboard automático, PiP, etc.';

  @override
  String get avncSettings => 'Configurações AVNC';

  @override
  String get aboutAVNC => 'Sobre AVNC';

  @override
  String get avncResolution => 'Resolução inicial AVNC';

  @override
  String get resolutionSettings => 'Configurações de resolução';

  @override
  String get deviceScreenResolution => 'A resolução da sua tela é';

  @override
  String get width => 'Largura';

  @override
  String get height => 'Altura';

  @override
  String get save => 'Salvar';

  @override
  String get applyOnNextLaunch => 'Aplicar no próximo lançamento';

  @override
  String get useAVNCByDefault => 'Usar AVNC por padrão';

  @override
  String get termuxX11Advantages =>
      'Termux:X11 pode ser mais rápido que VNC em alguns casos.\n\nFunciona de forma diferente do AVNC:\n- Dois dedos = clique direito\n- Botão voltar = teclado\n\nSe a tela ficar preta, reinicie o app.';

  @override
  String get termuxX11Preferences => 'Preferências Termux:X11';

  @override
  String get useTermuxX11ByDefault => 'Usar Termux:X11 por padrão';

  @override
  String get disableVNC => 'Desativar VNC. Requer reinício';

  @override
  String get hidpiAdvantages =>
      'Ative HiDPI para melhor nitidez... com menor velocidade.';

  @override
  String get hidpiEnvVar => 'Variáveis HiDPI';

  @override
  String get hidpiSupport => 'Suporte HiDPI';

  @override
  String get fileAccess => 'Acesso a arquivos';

  @override
  String get fileAccessGuide => 'Guia de acesso a arquivos';

  @override
  String get fileAccessHint =>
      'Solicite permissões adicionais para acessar pastas especiais.';

  @override
  String get requestStoragePermission => 'Solicitar permissão de armazenamento';

  @override
  String get requestAllFilesAccess => 'Solicitar acesso a todos os arquivos';

  @override
  String get ignoreBatteryOptimization => 'Ignorar otimização de bateria';

  @override
  String get graphicsAcceleration => 'Aceleração gráfica';

  @override
  String get experimentalFeature => 'Recurso experimental';

  @override
  String get graphicsAccelerationHint =>
      'Utiliza a GPU para acelerar gráficos, mas pode causar instabilidade.\n\nVirgl acelera apps OpenGL ES.';

  @override
  String get virglServerParams => 'Parâmetros do servidor Virgl';

  @override
  String get virglEnvVar => 'Variáveis Virgl';

  @override
  String get enableVirgl => 'Ativar Virgl';

  @override
  String get turnipAdvantages =>
      'GPUs Adreno podem usar Turnip para Vulkan e Zink para OpenGL.\n(Recomendado para Snapdragon não muito antigos)';

  @override
  String get turnipEnvVar => 'Variáveis Turnip';

  @override
  String get enableTurnipZink => 'Ativar Turnip+Zink';

  @override
  String get enableDRI3 => 'Ativar DRI3';

  @override
  String get dri3Requirement => 'DRI3 requer Termux:X11 e Turnip';

  @override
  String get windowsAppSupport => 'Suporte a apps Windows';

  @override
  String get hangoverDescription =>
      'Execute apps Windows com Hangover!\n\nDuas camadas de emulação — não espere bom desempenho.\n\nAceleração gráfica pode ajudar.\n\nFalhas são comuns.\n\nMova apps Windows para a área de trabalho antes de executá-las.';

  @override
  String get installHangoverStable => 'Instalar Hangover estável';

  @override
  String get installHangoverLatest =>
      'Instalar Hangover mais recente (pode falhar)';

  @override
  String get uninstallHangover => 'Desinstalar Hangover';

  @override
  String get clearWineData => 'Limpar dados Wine';

  @override
  String get wineCommandsHint =>
      'Comandos comuns do Wine. Abra a GUI e aguarde.\n\nTempos típicos:\nTiger T7510 6GB: 1+ min\nSnapdragon 870 12GB: ~10 s';

  @override
  String get switchToJapanese => 'Mudar sistema para japonês';

  @override
  String get userManual => 'Manual do usuário';

  @override
  String get openSourceLicenses => 'Licenças de código aberto';

  @override
  String get permissionUsage => 'Uso de permissões';

  @override
  String get privacyStatement =>
      '\nO app não coleta seus dados.\n\nApps dentro do contêiner podem agir diferente.\n\nPermissões:\nAcesso a arquivos\nNotificações + acessibilidade no Termux:X11';

  @override
  String get supportAuthor => 'Apoiar desenvolvedores';

  @override
  String get recommendApp => 'Se achar útil, recomende!';

  @override
  String get projectUrl => 'URL do projeto';

  @override
  String get commandEdit => 'Editar comando';

  @override
  String get commandName => 'Nome do comando';

  @override
  String get commandContent => 'Conteúdo do comando';

  @override
  String get deleteItem => 'Excluir';

  @override
  String get add => 'Adicionar';

  @override
  String get resetCommand => 'Redefinir comando';

  @override
  String get confirmResetAllCommands => 'Redefinir todos os comandos?';

  @override
  String get addShortcutCommand => 'Adicionar atalho';

  @override
  String get more => 'Mais';

  @override
  String get terminal => 'Terminal';

  @override
  String get control => 'Controle';

  @override
  String get enterGUI => 'Entrar no GUI';

  @override
  String get enterNumber => 'Digite um número';

  @override
  String get enterValidNumber => 'Digite um número válido';

  @override
  String get installingBootPackage => 'Instalando pacote de boot';

  @override
  String get copyingContainerSystem => 'Copiando arquivos do sistema';

  @override
  String get installingContainerSystem => 'Instalando sistema';

  @override
  String get installationComplete => 'Instalação concluída';

  @override
  String get reinstallingBootPackage => 'Reinstalando pacote de boot';

  @override
  String get issueUrl => 'Relatório de erros';

  @override
  String get faqUrl => 'FAQ';

  @override
  String get solutionUrl => 'Guia de uso';

  @override
  String get discussionUrl => 'Discussão';

  @override
  String get firstLoadInstructions =>
      'O primeiro carregamento leva 5–10 minutos… sem internet.\n\nDepois abrirá a interface gráfica.\n\nNa GUI:\n- Toque = clique esquerdo\n- Pressão longa = clique direito\n- Dois dedos = teclado\n- Dois dedos deslizar = rolagem\n\nNão feche o app durante a instalação.';

  @override
  String get updateRequest => 'Use a versão mais recente. Verifique o projeto.';

  @override
  String get avncScreenResize => 'Tamanho adaptável';

  @override
  String get avncResizeFactor => 'Screen Scaling Ratio';

  @override
  String get avncResizeFactorValue => 'Current scaling is';

  @override
  String get waitingGames => 'Jogando enquanto espera';

  @override
  String get extrusionProcess => 'Processo de Extrusão';

  @override
  String get gameTitleSnake => 'Jogo da Cobra';

  @override
  String get gameTitleTetris => 'Tetris';

  @override
  String get gameTitleFlappy => 'Flappy Bird';

  @override
  String score(Object score) {
    return 'Pontuação: $score';
  }

  @override
  String get gameOver => 'Fim de jogo! Toque para reiniciar';

  @override
  String get startGame => 'Toque para Iniciar';

  @override
  String get pause => 'Pausa';

  @override
  String get resume => 'Continuar';

  @override
  String get extractionCompleteExitGame =>
      'Extração completa! Saindo do modo de jogo.';

  @override
  String get mindTwisterGames => 'Jogos de Mente';

  @override
  String get extractionInProgress => 'Reproduzindo - Extração em andamento...';

  @override
  String get playWhileWaiting =>
      'Jogue enquanto espera pelos processos do sistema';

  @override
  String get gameModeActive => 'Modo de Jogo Ativo';

  @override
  String get simulateExtractionComplete => 'Simular Extração Completa';

  @override
  String get installCommandsSection => 'Comandos rápidos';

  @override
  String get backupRestore => 'Backup e restauração';

  @override
  String get backup => 'Backup';

  @override
  String get restore => 'Restaurar';

  @override
  String get backupSystem => 'Fazer backup do sistema';

  @override
  String get restoreSystem => 'Restaurar sistema';

  @override
  String get systemBackupRestore => 'Backup e restauração do sistema';

  @override
  String get backupRestoreDescriptionShort =>
      'Faça backup ou restaure seu sistema';

  @override
  String get backupRestoreDescription =>
      'Crie um backup do seu sistema ou restaure a partir de um backup anterior. Instalações do Wine também podem ser restauradas.';

  @override
  String get backupRestoreWarning =>
      'Aviso: Restaurar um backup substituirá os arquivos existentes do sistema. Certifique-se de ter um backup atual antes de continuar.';

  @override
  String get backupNote =>
      'Nota: Os arquivos de backup são salvos em /sd/xodos2backup.tar.xz';

  @override
  String get confirmBackup => 'Confirmar backup';

  @override
  String get backupConfirmation =>
      'Isso fará backup do sistema em /sd/xodos2backup.tar.xz. Continuar?';

  @override
  String get backupInProgress => 'Backup em andamento...';

  @override
  String get backupComplete => 'Backup concluído com sucesso!';

  @override
  String get backupFailed => 'Falha no backup';

  @override
  String get systemRestore => 'Restauração do sistema';

  @override
  String get systemRestoreWarning =>
      'Isso restaurará o sistema a partir do backup e substituirá os arquivos existentes. Tem certeza?';

  @override
  String get restoreInProgress => 'Restauração em andamento...';

  @override
  String get restoreFailed => 'Falha na restauração';

  @override
  String get installWine => 'Instalar Wine';

  @override
  String get wineInstallationWarning =>
      'Isso instalará o Wine no sistema x86_64 e substituirá se já existir. Tem certeza?';

  @override
  String get installingWine => 'Instalando Wine...';

  @override
  String get wineInstallationFailed => 'Falha na instalação do Wine';

  @override
  String get fileSelectionFailed => 'Falha na seleção do arquivo';

  @override
  String get restartRequired => 'Reinício necessário';

  @override
  String get restartAppToApply =>
      'Reinicie o aplicativo para aplicar as alterações.';

  @override
  String get close => 'Fechar';

  @override
  String get install => 'Instalar';

  @override
  String get ok => 'OK';

  @override
  String get invalidPath => 'Caminho inválido';

  @override
  String get unsupportedFormat => 'Formato não suportado';

  @override
  String get backupRestoreHint =>
      'O backup cria /sd/xodos2backup.tar.xz\nA restauração suporta arquivos .tar, .tar.gz, .tar.xz\nArquivos do Wine serão instalados em /opt/wine';

  @override
  String get wineInstallationComplete => 'Instalação do Wine concluída!';

  @override
  String get restoreComplete => 'Restauração do sistema concluída!';

  @override
  String get checkTerminalForProgress =>
      'Verifique o terminal para acompanhar o progresso...';

  @override
  String get importantNote => 'Nota importante';

  @override
  String get enableAndroidVenus => 'Ativar ANDROID_VENUS=1';

  @override
  String get androidVenusHint =>
      'Adicione a variável de ambiente ANDROID_VENUS=1 ao comando do servidor Venus';

  @override
  String get venusSection => 'Venus (Vulkan)';

  @override
  String get venusAdvantages =>
      'Aceleração de hardware baseada em Vulkan usando o driver Vulkan do Android';

  @override
  String get venusServerParams => 'Parâmetros do servidor Venus';

  @override
  String get venusEnvVar => 'Variáveis de ambiente do Venus';

  @override
  String get enableVenus => 'Ativar Venus (Vulkan do Android)';

  @override
  String get virglSection => 'VirGL (OpenGL)';
}
