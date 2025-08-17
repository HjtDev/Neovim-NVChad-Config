**Professional Full-Stack Development Environment**  
Python • React • TypeScript • TailwindCSS • Django

## ✨ Features

### Core NvChad Features
- **Beautiful UI**: 50+ themes with base46 theme toggler
- **Lightning Fast**: Optimized for performance (startup < 50ms)
- **Essential Plugins**:
  - File navigation: `nvim-tree.lua`
  - Git integration: `gitsigns.nvim`
  - LSP management: `mason.nvim` + `nvim-lspconfig`
  - Autocompletion: `nvim-cmp`
  - Fuzzy Search: `telescope.nvim`
  - Syntax Highlighting: `nvim-treesitter`
  - Auto Pairs: `nvim-autopairs`
  - Snippets: `LuaSnip` + `friendly-snippets`
  - Keymaps Cheatsheet: `which-key.nvim`

### Enhanced Python/React Support
| Feature                  | Tools/Packages                              | Benefits                                   |
|--------------------------|---------------------------------------------|--------------------------------------------|
| **Code Completion**      | Pyright, TSServer, TailwindLSP             | Intelligent context-aware suggestions      |
| **Static Analysis**      | Ruff, ESLint, PyLance                      | Real-time error detection                  |
| **Auto Formatting**      | Black, Prettier, Conform.nvim              | Consistent code style on save              |
| **Virtual Env Support**  | Automatic venv detection                   | Project-specific package completion        |
| **Django Snippets**      | Custom snippet library                     | `view` → Full function-based view template |
| **Component Navigation** | TSX/JSX tag jumping                        | Rapid React component traversal            |

### Key Additions
- **VSCode-like Tabout**: `tabout.nvim` for efficient pair escaping
- **Project-Aware LSP**: Automatic venv detection for Python
- **React Tooling**: 
  - Tailwind CSS IntelliSense
  - React/TypeScript snippet library
- **Django Templates**:
  - HTML auto-closing tags with Django syntax
- **Auto-Save**: Buffer persistence on focus change

## 🚀 Installation

```bash
# 1. Backup existing config
mv ~/.config/nvim ~/.config/nvim.bak

# 2. Clone this config
git clone https://github.com/yourusername/enhanced-nvchad ~/.config/nvim

# 3. Install dependencies
npm install -g prettier pyright
pip install black ruff

# 4. Start Neovim
nvim
```

## 🐍 Python Workflow Demo
```python
# 1. Create virtual environment
<leader>cv → Select "venv"

# 2. Install packages
:MasonInstall debugpy ruff black

# 3. Write code with LSP support
def test():|
# <Tab> → Jumps out of parentheses

# 4. Format on save
# Conform.nvim automatically formats with Black
```
## 🛠️ Customization
Edit these files to personalize:
- `lua/chadrc.lua` → UI customization
- `lua/mappings.lua` → Key bindings
- `lua/plugins/init.lua` → Plugin management

## Credits
- **[NvChad](https://nvchad.com)**: Base configuration framework

---

**Tip**: Use `:Telescope keymaps` or `:WhichKey` to discover all available bindings!

