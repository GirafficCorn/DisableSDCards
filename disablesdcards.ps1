$Folder = 'C:\Program Files\WindowsPowerShell\Modules\DellBIOSProvider'

if (Test-Path -Path $Folder)

{

    Import-Module DellBIOSProvider

    $Value = Get-Item -Path Dellsmbios:\MiscellaneousDevices\SDCard

    if ($Value.CurrentValue -eq 'Disabled')

    {

        Write-Output 'Already disabled'

        exit

    }

    Set-Item -Path Dellsmbios:\MiscellaneousDevices\SDCard -Value Disabled -Password (insert password here) -ErrorAction Continue

    Set-Item -Path Dellsmbios:\MiscellaneousDevices\SDCard -Value Disabled -Password (insert password here) -ErrorAction Continue

    Write-Output 'Successfully disabled'

    Exit

}

else

{

    Install-PackageProvider -Name NuGet -Force

    Set-PSRepository -Name 'PSGallery' -InstallationPolicy Trusted

    Install-Module DellBIOSProvider

    Import-Module DellBIOSProvider

    Set-Item -Path Dellsmbios:\MiscellaneousDevices\SDCard -Value Disabled -Password (insert password here)

    Write-Output 'Successfully disabled'

}
