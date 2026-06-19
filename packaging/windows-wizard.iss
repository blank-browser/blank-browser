#ifndef MiniInstallerPath
#define MiniInstallerPath "C:\src\chromium\src\out\Default\mini_installer.exe"
#endif

[Setup]
AppId={{4B0FE69F-9F2F-4D98-9D57-048C9356D54B}
AppName=Blank Browser
AppVerName=Blank Browser 1.0
AppVersion=1.0
AppPublisher=Blank Browser
AppPublisherURL=https://github.com/blank-browser/blank-browser
DefaultDirName={autopf}\Blank Browser
DisableDirPage=yes
DisableProgramGroupPage=yes
DisableWelcomePage=no
DisableReadyMemo=yes
Uninstallable=no
CreateUninstallRegKey=no
PrivilegesRequired=lowest
OutputDir=..\dist
OutputBaseFilename=BlankBrowserSetup-v1.0
SetupIconFile=..\branding\generated\blank-installer.ico
WizardImageFile=..\branding\generated\wizard-image.bmp
WizardSmallImageFile=..\branding\generated\wizard-small.bmp
WizardStyle=modern
Compression=none
SolidCompression=no
ArchitecturesAllowed=x64compatible
ArchitecturesInstallIn64BitMode=x64compatible

[Languages]
Name: "spanish"; MessagesFile: "compiler:Languages\Spanish.isl"

[Files]
Source: "{#MiniInstallerPath}"; DestDir: "{tmp}"; DestName: "mini_installer.exe"; Flags: deleteafterinstall

[Run]
Filename: "{tmp}\mini_installer.exe"; Description: "Install Blank Browser"; Flags: waituntilterminated; StatusMsg: "Installing Blank Browser..."
