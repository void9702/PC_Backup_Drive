#To run   & "C:\Users\void9\Desktop\Menu.ps1"

$usb_drive = try { $(Get-WmiObject Win32_LogicalDisk | Where-Object { $_.VolumeName -match "USB_BACKUP"}).DeviceID.ToString() } catch { exit 1 }

function Show-Menu
{
    param (
        [string]$Title = 'My Menu'
    )
    Clear-Host
    Write-Host "================ $Title ================"
    
    Write-Host "Desktop: Press '1' for this option."
    Write-Host "Documents: Press '2' for this option."
    Write-Host "Downloads: Press '3' for this option."
    Write-Host "Q: Press 'Q' to quit."
}

do
 {
     Show-Menu
     $selection = Read-Host "Please make a selection"
     switch ($selection)
     {
         '1' {
             Copy-Item -Path $env:USERPROFILE\Desktop\ -Destination $usb_drive\desktop_copy\ -Force -Recurse -PassThru
         } '2' {
             Copy-Item -Path $env:USERPROFILE\Downloads\ -Destination $usb_drive\downloads_copy\ -Force -Recurse -PassThru
         } '3' {
             Copy-Item -Path $env:USERPROFILE\Documents\ -Destination $usb_drive\documents_copy\ -Force -Recurse -PassThru
         } 'Q' {
             exit
         }
     }
     pause
 }
 until ($selection -eq 'q')

 exit
