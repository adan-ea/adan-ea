$apps = @(
    # Browsers
    "Brave.Brave.Nightly",
    "Google.Chrome",
    "Mozilla.Firefox.Nightly",

    # Development Tools
    "CoreyButler.NVMforWindows",
    "Git.Git",
    "JohannesMillan.superProductivity",
    "Microsoft.PowerShell",
    "Microsoft.VisualStudioCode",
    "Microsoft.WindowsTerminal",

    # Communication
    "Discord.Discord",
    "Discord.Discord.Canary",
    "Discord.Discord.PTB",
    "Mozilla.Thunderbird",
    "OpenWhisperSystems.Signal",

    # Media
    "Audacity.Audacity",
    "GIMP.GIMP",
    "Parsec.Parsec",
    "Spotify.Spotify",
    "VideoLAN.VLC",

    # System Utilities
    "7zip.7zip",
    "9NF8H0H7WMLT", # NVIDIA Control Panel
    "Bitwarden.Bitwarden",
    "Cybelsoft.DriversCloud",
    "File-New-Project.EarTrumpet",
    "Greenshot.Greenshot",
    "JanDeDobbeleer.OhMyPosh",
    "Microsoft.PowerToys",
    "ModernFlyouts.ModernFlyouts",
    "NickeManarin.ScreenToGif",
    "Nilesoft.Shell",
    "NordSecurity.NordVPN",
    "Nvidia.GeForceExperience",
    "SomePythonThings.WingetUIStore",
    "voidtools.Everything",

    # Gaming
    "Corsair.iCUE.4",
    "Elgato.StreamDeck",
    "Elgato.WaveLink",
    "EpicGames.EpicGamesLauncher",
    "Nvidia.GeForceExperience",
    "Playnite.Playnite",
    "Valve.Steam",
    "Voicemod.Voicemod"
)

if (!(Get-Package -Name winget -AllVersions | Select-Object Name)) {
    Write-Host "Winget is not installed. Installing..."
    Install-Package -Name winget -ProviderName Microsoft.VisualStudio.PackageManagement
    Write-Host "Winget installed."
}

# Install apps using Winget
$apps | ForEach-Object {
    $appName = $_
    Write-Host -ForegroundColor Black -BackgroundColor Green "[INFO]" -NoNewline
    Write-Host " Installing $appName..."

    try {
        winget install $appName -e -h --accept-package-agreements --accept-source-agreements # --exact --silent
        Write-Host -ForegroundColor Black -BackgroundColor Green "[INFO]" -NoNewline
        Write-Host " $appName installed."
    }
    catch {
        Write-Host -ForegroundColor Black -BackgroundColor Red "[ERROR]" -NoNewline
        Write-Host " Error installing $appName : $_"
    }
}

Install-Module Terminal-Icons
Install-Module -Name npm-completion