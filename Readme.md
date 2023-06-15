# zellij-sessionizer


* Inspired by https://github.com/ThePrimeagen/.dotfiles/blob/602019e902634188ab06ea31251c01c1a43d1621/bin/.local/scripts/tmux-sessionizer - just for zellij

* Allows you to use `fzf` to navigate into a desired folder and either start or attach into a zellij session

* If you run it from inside zellij, it will open the newly selected folder in a new pane

### Demo of the original: 
 https://youtu.be/bdumjiHabhQ?t=269


## Installation / Usage

 1. Place the script in your path
 2. Create an alias to call this script in your shells .rc config: 
    bindkey -s ^f "zellij-sessionizer\n"
 3. Update where you want to search:
    I'm using `fd` to perform the search inside a specific dir, you can use that or `find`
