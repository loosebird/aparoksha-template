# Aparoksha Starter

Minimal starter template for an [Aparoksha](https://aparoksha.dev) app targeting:

- Windows via **WinUI**
- macOS via **AppKit**
- Linux via **libadwaita / GTK**

This template is intentionally small so you can publish it to GitHub and start customizing immediately.

## Included

- Swift Package project
- Minimal multi-window app
- Sidebar navigation with `FlatNavigation`
- Sample carousel view
- Sample alert with text input
- Helper scripts for macOS, Linux, and Windows

## Project structure

```text
AparokshaStarter/
├── Package.swift
├── README.md
├── .gitignore
├── scripts/
│   ├── run-linux.sh
│   ├── run-macos.sh
│   └── run-windows.ps1
└── Sources/
    └── AparokshaStarter/
        └── main.swift
```

## Requirements

- Swift 6 toolchain
- Internet access the first time Swift Package Manager resolves dependencies

### Linux requirements

Install GTK 4 and libadwaita development packages.

Examples:

```bash
# Fedora
sudo dnf install gtk4-devel libadwaita-devel

# Ubuntu / Debian
sudo apt install libgtk-4-dev libadwaita-1-dev
```

### macOS requirements

The default backend on macOS is `APPKIT`, so you can usually start there.

If you want to test the `ADWAITA` backend on macOS too:

```bash
brew install libadwaita
```

## Run

### Native default backend for your current OS

```bash
swift run AparokshaStarter
```

### Force a backend manually

```bash
# macOS native backend
APAROKSHA_FRAMEWORK=APPKIT swift run AparokshaStarter

# Linux / libadwaita backend
APAROKSHA_FRAMEWORK=ADWAITA swift run AparokshaStarter

# Windows / WinUI backend
APAROKSHA_FRAMEWORK=WINUI swift run AparokshaStarter
```

## Helper scripts

### macOS

```bash
chmod +x scripts/run-macos.sh
./scripts/run-macos.sh
```

### Linux

```bash
chmod +x scripts/run-linux.sh
./scripts/run-linux.sh
```

### Windows PowerShell

```powershell
./scripts/run-windows.ps1
```

## Customize

Start by editing these values in `Sources/AparokshaStarter/main.swift`:

- app id
- app name
- website URL
- issues URL
- developer name
- version
- pages and views

## Notes

- The upstream Aparoksha project is still evolving, so APIs may change.
- This template uses the upstream `main` branch because that is how the current umbrella package is wired.
- On each platform, prefer the native default backend first.

## Publish to GitHub

```bash
git init
git add .
git commit -m "feat: add initial Aparoksha starter template"
```

Then create a repository on GitHub and push normally.
