#####################
#   PREREQUISITES   #
#####################

# Boxstarter options
$Boxstarter.RebootOk=$true                                   # Allow reboots?
$Boxstarter.NoPassword=$false                                # Is this a machine with no login password?
$Boxstarter.AutoLogin=$true                                  # Auto-login after a reboot without password?

# .Net 3.5
cinst dotnet3.5 -y                                           # Not automatically installed. Includes .NET 2.0. Uses Windows Features to install.
if (Test-PendingReboot) { Invoke-Reboot }                    # Attempt a reboot if neccesary.

# Windows Settings
Update-ExecutionPolicy Unrestricted                          # Allow us to run more things.
Set-TaskbarSmall                                             # Sets the taskbar to small.
Get-ScheduledTask -TaskName *defrag* | Disable-ScheduledTask # Don't need to Defrag as we have an SSD.
Disable-InternetExplorerESC                                  #
Disable-GameBarTips                                          # Disable the annoying popup when windows thinks you are playing a game.
Disable-BingSearch                                           # Disable the pointless Bing in favour of Google.
Set-WindowsExplorerOptions 
    -EnableShowHiddenFilesFoldersDrives
    -EnableShowProtectedOSFiles
    -DisableShowFileExtensions
    -EnableShowFullPathInTitleBar
    -EnableOpenFileExplorerToQuickAccess
    -DisableShowRecentFilesInQuickAccess 
    -DisableShowFrequentFoldersInQuickAccess 
    -EnableExpandToOpenFolder 
    -EnableShowRibbon
Set-BoxstarterTaskbarOptions
    -Size Small 
    -Dock Bottom 
    -Combine Always 
    -AlwaysShowIconsOn 
    -MultiMonitorOn 
    -MultiMonitorMode All
    -MultiMonitorCombine Always

# Power Settings
powercfg /H OFF                                              # Turn off hibernation
powercfg -change -monitor-timeout-ac 0                       # When plugged in, monitor never times out
powercfg -change -monitor-timeout-dc 15                      # When using battery, monitor times out after 15 minutes
powercfg -change -standby-timeout-ac 0                       # When plugged in, PC never goes into standby
powercfg -change -standby-timeout-dc 30                      # When using battery, PC goes into standby after 30 minutes
powercfg -change -disk-timeout-ac 0                          # When plugged in, disk never stops
powercfg -change -disk-timeout-dc 30                         # When using battery, disk stops after 30 minutes
powercfg -change -hibernate-timeout-ac 0                     # When plugged in, PC never hibernates


##### CLEAUP THIS BIT #####
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

cinst PowerShell
cinst poshgit
cinst microsoft-windows-terminal
cinst 7zip.install -y
cinst GoogleChrome -y
cinst obs-studio -y
cinst obs-ndi -y
cinst git.install -y

cinst gitkraken -y
cinst postman -y
cinst fiddler4 -y
cinst azure-cli -y

# Messaging
cinst discord -y
cinst microsoft-teams -y
cinst slack -y
cinst whatsapp -y
cinst skype -y

cinst spotify --ignore-checksums -y

choco install notepadplusplus -y
cinst vscode -y
cinst vscode-insiders -y
choco install sourcetree -y
choco install git -y
choco install winrar -y
choco install adobereader -y
choco install windirstat -y
choco install clover -y 

# Manually
# Xmeters
# Visual Studio 2019
# Portal Azure
# Chrome Canary
# Edge Canary







#Not on Choco
# * Cisco VPN
# * Egnyte desktop sync
# * Axure

# Update Windows and reboot if necessary
Install-WindowsUpdate -AcceptEula -GetUpdatesFromMS
if (Test-PendingReboot) { Invoke-Reboot }


#Install-BoxstarterPackage -PackageName https://gist.githubusercontent.com/kasuken/d5e2ce84a9108002e81603fc3d42e492/raw/b5c5175ffa90c7665200a061db739a051abf0f74/devmachine.ps1 -DisableReboots
