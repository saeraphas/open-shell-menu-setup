# powershell Open-Shell Menu install
$dir = "c:\temp"
New-Item $dir -ItemType Directory -force
$url = "https://github.com/Open-Shell/Open-Shell-Menu/releases/download/v4.4.195/OpenShellSetup_4_4_195.exe"
$file = "$($dir)\OpenShellSetup_4_4_195.exe"
$url2 = "https://raw.githubusercontent.com/saeraphas/open-shell-menu-setup/refs/heads/main/Menu_Settings.xml"
$file2 = "$($dir)\Menu_Settings.xml"
$argumentlist = @("/qn","ADDLOCAL=StartMenu")
Invoke-WebRequest -Uri $url -outfile $file
Invoke-WebRequest -Uri $url2 -outfile $file2
Start-Process -FilePath $file -ArgumentList $argumentlist -verb runas
Start-Sleep -Seconds 10
$argumentlist = @("-xml","$file2")
Start-Process -FilePath "C:\Program Files\Open-Shell\StartMenu.exe" -ArgumentList $argumentlist
