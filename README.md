# Aparoksha Starter

> **Documentation:** A project Wiki is available with setup guides, examples, architecture notes, and platform-specific details: <https://github.com/loosebird/aparoksha-template/wiki>

Minimal starter template for an [Aparoksha](https://aparoksha.dev) app targeting:

- Windows via **WinUI**
- macOS via **AppKit**
- Linux via **libadwaita / GTK**

This template is intentionally small so you can publish it to GitHub and start customizing immediately.

## Why this template includes CI

It makes sense to keep GitHub Actions in the template.

Aparoksha is a cross-platform desktop framework, so architecture and OS regressions are easy to miss if you only build locally. Shipping the template with CI gives you a ready-to-use baseline for:

- Linux `x86_64`
- Linux `arm64`
- Windows `x86_64`
- Windows `arm64`
- macOS `arm64`
- macOS `x86_64`
- an extra macOS universal binary build

You can always simplify the workflow later if your app becomes platform-specific.

## Included

- Swift Package project
- Minimal multi-window app
- Sidebar navigation with `FlatNavigation`
- Sample carousel view
- Sample alert with text input
- Helper run scripts for macOS, Linux, and Windows
- Helper build scripts for macOS, Linux, and Windows
- GitHub Actions workflow with cross-platform runner matrix

## Project structure

```text
AparokshaStarter/
├── .github/
│   └── workflows/
│       └── ci.yml
├── Package.swift
├── README.md
├── .gitignore
├── scripts/
│   ├── build-linux.sh
│   ├── build-macos.sh
│   ├── build-windows.ps1
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

### Windows requirements

Install the Swift toolchain and Visual Studio components required by Swift on Windows.

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

### Run scripts

#### macOS

```bash
chmod +x scripts/run-macos.sh
./scripts/run-macos.sh
```

#### Linux

```bash
chmod +x scripts/run-linux.sh
./scripts/run-linux.sh
```

#### Windows PowerShell

```powershell
./scripts/run-windows.ps1
```

### Build scripts

#### macOS universal binary

```bash
chmod +x scripts/build-macos.sh
./scripts/build-macos.sh
```

This script uses `xcodebuild` and asks Xcode to build a universal macOS binary for `arm64` and `x86_64`.

#### Linux release build

```bash
chmod +x scripts/build-linux.sh
./scripts/build-linux.sh
```

The output is copied to `dist/linux/<arch>/AparokshaStarter`.

#### Windows release build

```powershell
./scripts/build-windows.ps1
```

The output is copied to `dist/windows/<arch>/AparokshaStarter.exe`.

## GitHub Actions workflow

The included workflow does two things:

1. native release builds on GitHub-hosted runners for the main architecture and OS combinations
2. an extra universal macOS build on `macos-latest`

Current runner matrix in the template:

- `ubuntu-latest`
- `ubuntu-24.04-arm`
- `windows-latest`
- `windows-11-arm`
- `macos-latest`
- `macos-15-intel`

You can trim this list if your repository does not need all architectures.

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
- The workflow uses a third-party Swift setup action so the same template can cover Linux, macOS, and Windows runners in one place.
- If you want stricter control, pin the action to a commit SHA and/or replace GitHub-hosted runners with self-hosted runners later.
