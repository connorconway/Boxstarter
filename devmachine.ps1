#####################
#   PREREQUISITES   #
#####################

cinst boxstarter.chocolatey                                  # Install boxstarter to begin.
BOXSTARTERSHELL                                              # Startup a boxstarter shell to use boxstarter commands.

#####################
#   WINDOWS CONFIG  #
#####################

Update-ExecutionPolicy Unrestricted                          # Allow us to run more things.
Get-ScheduledTask -TaskName *defrag* | Disable-ScheduledTask # Don't need to Defrag as we have an SSD.
Disable-InternetExplorerESC                                  #
Disable-GameBarTips                                          # Disable the annoying popup when windows thinks you are playing a game.
Disable-BingSearch                                           # Disable Bing in favour of Google.
Set-WindowsExplorerOptions -EnableShowHiddenFilesFoldersDrives -EnableShowProtectedOSFiles -DisableShowFileExtensions -EnableShowFullPathInTitleBar -EnableOpenFileExplorerToQuickAccess -DisableShowRecentFilesInQuickAccess -DisableShowFrequentFoldersInQuickAccess -EnableExpandToOpenFolder -EnableShowRibbon
Set-BoxstarterTaskbarOptions -Size Small -Dock Bottom -Combine Always -AlwaysShowIconsOn -MultiMonitorOn -MultiMonitorMode All -MultiMonitorCombine Always
powercfg /H OFF                                              # Turn off hibernation
powercfg -change -monitor-timeout-ac 60                      # When plugged in, monitor times out after 60 minutes
powercfg -change -monitor-timeout-dc 15                      # When using battery, monitor times out after 15 minutes
powercfg -change -standby-timeout-ac 90                      # When plugged in, PC goes into standby after 90 minutes
powercfg -change -standby-timeout-dc 30                      # When using battery, PC goes into standby after 30 minutes
powercfg -change -disk-timeout-ac 90                         # When plugged in, disk stops after 90 minutes
powercfg -change -disk-timeout-dc 30                         # When using battery, disk stops after 30 minutes
powercfg -change -hibernate-timeout-ac 0                     # When plugged in, PC never hibernates


##### CLEANUP THIS BIT #####
#
## When docked - Make sure that when I close the lid of my laptop it doesn't go to sleep
# retrieve the current power mode Guid
#$guid = (Get-WmiObject -Class win32_powerplan -Namespace root\cimv2\power -Filter "isActive='true'").InstanceID.tostring() 
#$regex = [regex]"{(.*?)}$" 
#$guidVal = $regex.Match($guid).groups[1].value #$regex.Match($guid) 
# Write-Host $guidVal
# Set close the lid power option to 'Do Nothing' for plugged in.
#powercfg -SETACVALUEINDEX $guidVal 4f971e89-eebd-4455-a8de-9e59040e7347 5ca83367-6e45-459f-a27b-476b1d01c936 0
#To see what other options are available - run the following:
# powercfg -Q $guidVal
#
###########################

#####################
#      SOFTWARE     #
#####################

cinst Microsoft-Hyper-V-All -source windowsFeatures
cinst dotnet3.5 -y                                       
cinst PowerShell -y
cinst poshgit -y
cinst microsoft-windows-terminal -y
cinst 7zip.install -y
cinst GoogleChrome -y
cinst obs-studio -y
cinst obs-ndi -y
cinst git.install -y
cinst gitkraken -y
cinst postman -y
cinst fiddler -y
cinst azure-cli -y
cinst discord -y
cinst microsoft-teams -y
cinst slack -y
cinst whatsapp -y
cinst skype -y
cinst spotify --ignore-checksums -y
cinst notepadplusplus -y
cinst vscode -y
cinst vscode-insiders -y
cinst sourcetree -y
cinst git -y
cinst winrar -y
cinst adobereader -y
cinst windirstat -y
cinst clover -y 
cinst sysinternals -y

# Manually
# Xmeters
# Visual Studio 2019
# Portal Azure

# chrome
cinst googlechrome -y
cinst lastpass-chrome -y

# Visual Studio Code Extensions
code --install-extension ms-vscode.csharp
code --install-extension formulahendry.code-runner
code --install-extension streetsidesoftware.code-spell-checker
code --install-extension msjsdiag.debugger-for-chrome
code --install-extension PeterJausovec.vscode-docker
code --install-extension dbaeumer.vscode-eslint
code --install-extension abusaidm.html-snippets
code --install-extension eg2.vscode-npm-script
code --install-extension ms-vscode.powershell
code --install-extension Ionide.ionide-fsharp
code --install-extension Shan.code-settings-sync
code --install-extension Ionide.ionide-fake
code --install-extension Ionide.ionide-paket
code --install-extension esbenp.prettier-vscode
code --install-extension eamodio.gitlens
code --install-extension robertohuertasm.vscode-icons

cinst visualstudio2019enterprise -y --package-parameters "--add Microsoft.VisualStudio.Workload.Azure --add Microsoft.VisualStudio.Workload.ManagedDesktop --add Microsoft.VisualStudio.Workload.NativeDesktop --add Microsoft.VisualStudio.Workload.NetCoreTools --add Microsoft.VisualStudio.Workload.NetWeb --add Microsoft.VisualStudio.Workload.NetCrossPlat --add Component.Xamarin.Profiler	--add Microsoft.Net.Core.Component.SDK.3.0	--includeRecommended --includeOptional --passive --productkey ''"

# Update Windows and reboot if necessary
Install-WindowsUpdate -AcceptEula -GetUpdatesFromMS
if (Test-PendingReboot) { Invoke-Reboot }

#example registry merging
#regedit /s RegistrySettings.reg
#Add a nuget repository to Visual Studio
# nuget sources Add -Name AcmeCompany -Source http://tfs.acmecompany.com:8080/tfs/CollectionName/_packaging/AcmeCompany/nuget/v3/index.json

#Install-BoxstarterPackage -PackageName https://gist.githubusercontent.com/kasuken/d5e2ce84a9108002e81603fc3d42e492/raw/b5c5175ffa90c7665200a061db739a051abf0f74/devmachine.ps1 -DisableReboots
