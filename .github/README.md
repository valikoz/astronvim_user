<h1 align="center">AstroNvim User Configuration</h1>


## Installation

- Install AstroNvim

```powershell
git clone --depth 1 https://github.com/AstroNvim/AstroNvim $env:LOCALAPPDATA\nvim
```

- Install User Settings

```powershell
git clone https://github.com/Valikoz/astonvim_user.git $env:LOCALAPPDATA\nvim\lua\user
```

- Initialize AstroNvim

```powershell
nvim --headless -c 'autocmd User PackerComplete quitall' -c 'PackerSync'
```
