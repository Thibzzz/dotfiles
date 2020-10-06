# grab vim
cp ~/.vimrc ~/.dotfiles/
cp ~/.config/nvim/init.vim ~/.dotfiles/
cp ~/.config/nvim/coc-settings.json ~/.dotfiles/
git add .
T=$(date)
git commit -m "backup $T"
git push origin master
