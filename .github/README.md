<h1 align="center">AstroNvim User Configuration</h1>


## 🛠️ Installation

### Linux/Mac OS (Unix)

#### Make a backup of your current nvim and shared folder

```bash
mv ~/.config/nvim ~/.config/nvim.bak
mv ~/.local/share/nvim ~/.local/share/nvim.bak
```

#### Clone the [repository](https://github.com/AstroNvim/AstroNvim)

```bash
git clone --depth 1 https://github.com/AstroNvim/AstroNvim ~/.config/nvim
nvim
```

#### Install User Settings

```bash
git clone https://github.com/Valikoz/astronvim_user.git ~/.config/nvim/lua/user
```

### Windows (Powershell)

#### Make a backup of your current nvim and nvim-data folder

```powershell
Rename-Item -Path $env:LOCALAPPDATA\nvim -NewName $env:LOCALAPPDATA\nvim.bak
Rename-Item -Path $env:LOCALAPPDATA\nvim-data -NewName $env:LOCALAPPDATA\nvim-data.bak
```

#### Clone the [repository](https://github.com/AstroNvim/AstroNvim)

```pwsh
git clone --depth 1 https://github.com/AstroNvim/AstroNvim $env:LOCALAPPDATA\nvim
nvim
```

#### Install User Settings

```powershell
git clone https://github.com/Valikoz/astonvim_user.git $env:LOCALAPPDATA\nvim\lua\user
```
