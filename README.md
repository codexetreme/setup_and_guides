# dotfiles
## start a new system

### basic tools

- `sudo apt install git curl zsh python3-venv`

- `sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"`

- (if the shell is not changed automatically, run ) `sudo chsh -s /usr/bin/zsh`

- clone the dotfile repo
  - `git clone https://github.com/codexetreme/setup_and_guides.git /home/${USER}/my_setup`

- Shell Setup
  - ZSH
  - `SETUP_PATH=/home/${USER}/my_setup; $SETUP_PATH/./shell/setup/setup_zsh.sh`
  - BASH
  - `SETUP_PATH=/home/${USER}/my_setup; $SETUP_PATH/./setup/setup_bash.sh`

# init code-server
curl https://raw.githubusercontent.com/codexetreme/setup_and_guides/master/init.sh | bash