
![Lua](https://img.shields.io/badge/lua-%232C2D72.svg?style=for-the-badge&logo=lua&logoColor=white)
![Rust](https://img.shields.io/badge/rust-%23000000.svg?style=for-the-badge&logo=rust&logoColor=white)
<br/>
<a href="https://dotfyle.com/PandeCode/nvim-config"><img src="https://dotfyle.com/PandeCode/nvim-config/badges/plugins?style=flat" /></a>
<a href="https://dotfyle.com/PandeCode/nvim-config"><img src="https://dotfyle.com/PandeCode/nvim-config/badges/leaderkey?style=flat" /></a>
<a href="https://dotfyle.com/PandeCode/nvim-config"><img src="https://dotfyle.com/PandeCode/nvim-config/badges/plugin-manager?style=flat" /></a>

# Neovim Configuration

This is the **final** iteration of my Neovim configuration, refined for performance, functionality, and extensibility. Below is an overview of why this rework was necessary and the goals it achieves.

> currently only works on nixos.

## Why This Configuration?

1. **Performance Optimization**: Ensuring a faster and smoother experience with Neovim.
2. **C and Rust FFI Integration**: Utilizing foreign function interfaces (FFI) to enhance extensibility and performance.
3. **Better Plugin Alternatives**: Migrating to modern plugins that align with my workflow.
4. **Obsidian Replacement/Enchancement**: Adopting a Neovim-based equivalent for note-taking and knowledge management.
5. **Custom Plugin Development**: Starting to create and maintain my own plugins for tailored functionality.
6. **Code Ownership**: Understanding every single line of code in this repository.
7. **Debugging Support**: Adding fully functional debugging tools.
8. **Cross-Platform Considerations**:
   - Windows compatibility.
   - NixOS integration.
   - VS Code interoperability.

## Features

- **Blazing Fast**: Lightweight configuration optimized for speed. No useless plugins and dumb configurations. (my last version was bloated)
- **Extensible**: Built to scale with custom plugins and tools.
- **Developer-Friendly**: Ideal for working with C, Rust, and other languages.
- **Unified Workflow**: Combines coding, note-taking, and debugging within Neovim.
- **Cross-Platform**: Tailored to work seamlessly on different operating systems.

## Getting Started

1. Clone the repository:
   ```bash
   git clone <repo-url> ~/.config/nvim
   ```

2. Install dependencies:
   - Ensure you have Neovim 0.10+ installed.
   - Follow instructions for language servers, FFI tools, and required plugins.
  
   - FII
       - Run make (currently only nixos) 

3. Launch Neovim:
   ```bash
   nvim
   ```

## Roadmap

- [ ] Develop and document custom plugins.
- [ ] Expand debugging support for more languages.
- [ ] Create detailed guides for Windows, NixOS, and VS Code workflows.

---

### Feedback & Contributions
Feel free to fork, contribute, or share feedback! This repository is a work of passion and continues to evolve.
