# vimconfig
A repository for my vimrc

Vim 7.4 introduced a new, very useful, scheme: it looks for the usual `~/.vimrc` and also for `~/.vim/vimrc`. So to install `vimrc` from this repository

1. Go to `~/.vim` and clone the contents of this repository:

   ```
   git init
   git remote add origin https://github.com/wojciechowskid/vimconfig.git
   git pull origin master
   ```

2. Install `Vundle` according to its documentation and run `:PluginInstall` in VIM (https://github.com/VundleVim/Vundle.vim)

3. Install `YouCompleteMe` according to its documentation (go to bundles/YouCompleteMe and run ./install.sh -- https://github.com/Valloric/YouCompleteMe)

4. Install `Tern for Vim` (https://github.com/marijnh/tern_for_vim)
