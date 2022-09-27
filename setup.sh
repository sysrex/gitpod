# ZSH
if [ "$NO_ZSH" != "true" ]; then
  # switch to zsh
  sudo apt install zsh -y
  sudo chsh gitpod -s "$(which zsh)"
  
  # Install Hack font to be used in terminal
  sudo apt install fonts-hack-ttf

  # Fix GP alias
  echo "alias pod=/usr/bin/gp" >>~/.zshrc

  # install ohmyzsh
  CHSH=no
  export CHSH # fix broken chsh check
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended

  # install plugins
  git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
  echo "plugins+=zsh-autosuggestions" >>~/.zshrc
  git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
  echo "plugins+=zsh-syntax-highlighting" >>~/.zshrc
  git clone https://github.com/zsh-users/zsh-completions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-completions
  echo "fpath+=${ZSH_CUSTOM:-${ZSH:-~/.oh-my-zsh}/custom}/plugins/zsh-completions/src" >>~/.zshrc

  echo ZSH_THEME="apple" >>~/.zshrc

  # reload oh-my-zsh instructions again
  echo "source \$ZSH/oh-my-zsh.sh" >>~/.zshrc
fi
