# SeaShell 🐚

SeaShell is a lightweight, platform-agnostic installer and builder for C++ applications, designed to simplify cross-platform development and deployment. By leveraging platform-native scripts, SeaShell ensures compatibility by compiling source code directly on the user's system. Additionally, SeaShell acts as the installation and build mechanism for related projects, such as [Hermes 🦀](https://github.com/JustinPhillipsPDX/Hermes) and [Proteus 🐍](https://github.com/JustinPhillipsPDX/Proteus).

## Features
- **Platform Detection**: Automatically detects the operating system and hardware architecture.
- **Dependency Management**: Installs required tools like compilers and build systems.
- **Source-Based Installation**: Compiles applications locally for guaranteed compatibility.
- **Cross-Platform Support**: Works on Windows, macOS, and Linux.
- **Project Integration**: Provides a seamless installation and build framework for Hermes 🦀 and Proteus 🐍.

## Getting Started

### Requirements
- **Windows**: PowerShell, CMake, and a C++ compiler (e.g., MSVC, MinGW).
- **Linux/macOS**: Bash, CMake, and a C++ compiler (e.g., GCC, Clang).

### Installation

1. Clone the repository:
   ```bash
   git clone https://github.com/JustinPhillipsPDX/SeaShell.git
   cd SeaShell
   ```

2. Run the installer:
   - **Linux/macOS**:
     ```bash
     ./install.sh
     ```
   - **Windows** (run in PowerShell):
     ```powershell
     ./install.ps1
     ```

3. Follow the prompts to complete the installation.

## Example Project
The repository includes an example C++ project in the `src/` directory, which demonstrates the build process using SeaShell. Future releases will also showcase the integration with Hermes and Proteus.

## Roadmap
- [x] Core functionality: platform detection, dependency management, source-based installation.
- [ ] Advanced configuration for custom projects.
- [ ] Expanded support for additional build tools and compilers.
- [ ] Integration examples for Hermes and Proteus.

## License
[MIT License](LICENSE)

