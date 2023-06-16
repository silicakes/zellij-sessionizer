# zellij-sessionizer

* Inspired by the [`tmux-sessionizer`] of @ThePrimeagen - just for [Zellij]

* Allows you to use [`fzf`] to navigate into a desired folder and either start or attach into a [Zellij] session

* If you run it from inside [Zellij], it will open the newly selected folder in a new pane

* Will use [`fd`] if installed, otherwise - will defer to using `find`

### Demo of the original:
[My Developer Workflow - How I use i3, tmux, and vim](https://youtu.be/bdumjiHabhQ?t=269) from @ThePrimeagen

## Installation / Usage

 1. Place the script in your path
 2. Create an alias to call this script in your shells .rc config: 
    bindkey -s ^f "zellij-sessionizer\n"
 3. Update which paths you'd like to search in


[`tmux-sessionizer`]: https://github.com/ThePrimeagen/.dotfiles/blob/602019e902634188ab06ea31251c01c1a43d1621/bin/.local/scripts/tmux-sessionizer
[Zellij]: https://zellij.dev/
[`fzf`]: https://github.com/junegunn/fzf
[`fd`]: https://github.com/sharkdp/fd
