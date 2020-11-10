#####################
# PREREQUISITES
#####################

# Boxstarter options
$Boxstarter.RebootOk=$true # Allow reboots?
$Boxstarter.NoPassword=$false # Is this a machine with no login password?
$Boxstarter.AutoLogin=$true # Save my password securely and auto-login after a reboot

#### .NET 3.5 ####

cinst dotnet3.5 -y # Not automatically installed. Includes .NET 2.0. Uses Windows Features to install.
if (Test-PendingReboot) { Invoke-Reboot }

#### WINDOWS SETTTINGS #####

# Basic setup
Update-ExecutionPolicy Unrestricted
Set-TaskbarSmall
Get-ScheduledTask -TaskName *defrag* | Disable-ScheduledTask
Disable-InternetExplorerESC
Disable-GameBarTips
Disable-BingSearch

Set-WindowsExplorerOptions -EnableShowHiddenFilesFoldersDrives -EnableShowProtectedOSFiles -DisableShowFileExtensions -EnableShowFullPathInTitleBar -EnableOpenFileExplorerToQuickAccess -DisableShowRecentFilesInQuickAccess -DisableShowFrequentFoldersInQuickAccess -EnableExpandToOpenFolder -EnableShowRibbon

Set-BoxstarterTaskbarOptions -Size Small -Dock Bottom -Combine Always -AlwaysShowIconsOn -MultiMonitorOn -MultiMonitorMode All -MultiMonitorCombine Always



# Console
cinst PowerShell
cinst poshgit
cinst microsoft-windows-terminal

################################# POWER SETTINGS #################################

# Turn off hibernation
powercfg /H OFF

# Change Power saving options (ac=plugged in dc=battery)
powercfg -change -monitor-timeout-ac 0
powercfg -change -monitor-timeout-dc 15
powercfg -change -standby-timeout-ac 0
powercfg -change -standby-timeout-dc 30
powercfg -change -disk-timeout-ac 0
powercfg -change -disk-timeout-dc 30
powercfg -change -hibernate-timeout-ac 0

## When docked - Make sure that when I close the lid of my laptop it doesn't go to sleep

# retrieve the current power mode Guid
$guid = (Get-WmiObject -Class win32_powerplan -Namespace root\cimv2\power -Filter "isActive='true'").InstanceID.tostring() 
$regex = [regex]"{(.*?)}$" 
$guidVal = $regex.Match($guid).groups[1].value #$regex.Match($guid) 
# Write-Host $guidVal
# Set close the lid power option to 'Do Nothing' for plugged in.
powercfg -SETACVALUEINDEX $guidVal 4f971e89-eebd-4455-a8de-9e59040e7347 5ca83367-6e45-459f-a27b-476b1d01c936 0
#To see what other options are available - run the following:
# powercfg -Q $guidVal


#####################
# SOFTWARE
#####################

# 7Zip
cinst 7zip.install -y

# Some browsers
cinst GoogleChrome -y
cinst chromium -y
cinst firefox -y
cinst firefox-dev --pre -y
cinst Opera -y
cinst microsoft-edge -y
cinst microsoft-edge-insider -y
cinst microsoft-edge-insider-dev -y

#Plugins and Runtime
cinst javaruntime -y

# Geek tools
cinst obs-studio -y
cinst obs-ndi -y
cinst streamlabs-obs -y
# cinst twitch --ignore-checksums -y

# Dev Tools
cinst git.install -y
cinst nvm -y
cinst cascadiacode -y
cinst vscode -y
cinst vscode-insiders -y
cinst gitkraken -y
cinst github-desktop -y
cinst postman -y
cinst fiddler -y
cinst teamviewer -y
cinst azure-cli -y

# Messaging
cinst discord -y
cinst microsoft-teams -y
cinst slack -y
cinst whatsapp -y
cinst telegram -y
cinst microsoft-teams -y
cinst skype -y

# Tools
cinst foxitreader -y
cinst vlc -y
cinst ccleaner -y
cinst rescuetime -y
cinst nordvpn -y
cinst powertoys -y
cinst 1password -y

# Graphic Tools
cinst paint.net -y

# Audio Tools
cinst audacity -y
cinst lightworks -y
cinst screentogif -y
cinst spotify --ignore-checksums -y

# Manually
# Xmeters
# Visual Studio 2019
# Portal Azure
# Chrome Canary
# Edge Canary

#Browsers
choco install googlechrome -y
choco install firefox -y

#Other dev tools
choco install fiddler4 -y
choco install brackets -y
choco install notepadplusplus -y
choco install nodejs.install -y
choco install sourcetree -y
choco install ruby -y
choco install ruby2.devkit -y
choco install python2 -y
choco install tortoisesvn -y
choco install git -y
choco install atom -y

#Other essential tools
choco install winrar -y
choco install adobereader -y
choco install skype -y
choco install dropbox -y
choco install windirstat -y
choco install virtualbox -y
#cinst genymotion -y # use Xamarin player instead?
choco install jdk8 -y
#choco install maven -y # This package installs into C:/bin which is too annoying 
choco install join.me -y
choco install clover -y # windows explorer tabs

#Not on Choco
# * Cisco VPN
# * Egnyte desktop sync
# * Axure

# Update Windows and reboot if necessary
Install-WindowsUpdate -AcceptEula -GetUpdatesFromMS
if (Test-PendingReboot) { Invoke-Reboot }


---
Install-BoxstarterPackage -PackageName https://gist.githubusercontent.com/kasuken/d5e2ce84a9108002e81603fc3d42e492/raw/b5c5175ffa90c7665200a061db739a051abf0f74/devmachine.ps1 -DisableReboots
