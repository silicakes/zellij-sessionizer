# zellij-sessionizer

* Inspired by the [`tmux-sessionizer`] of @ThePrimeagen - just for [Zellij]

* Allows you to use [`fzf`] to navigate into a desired folder and either start or attach into a [Zellij] session

* If you run it from inside [Zellij], it will open the newly selected folder in a new pane

* Will use [`fd`] if installed, otherwise - will defer to using `find`

### Demo of the original:
[My Developer Workflow - How I use i3, tmux, and vim](https://youtu.be/bdumjiHabhQ?t=269) from @ThePrimeagen

## Installation / Usage
### POSIX shells
 1. Place the [`zellij-sessionizer`](zellij-sessionizer) script in your `PATH`
 2. Create an alias to call this script in your shells `.rc` config, e.g. in `zsh`
    ```sh
    bindkey -s ^f "zellij-sessionizer path1 path2 etc..\n"
    ```
 3. Update which paths you'd like to search in

### Nushell
The `zellij-sessionizer` now support [Nushell] :partying_face:
1. Place the [`zellij-sessionizer.nu`](zellij-sessionizer.nu) script in your `PATH`
  - manualy with `cp zellij-sessionizer.nu /some/path/in/your/PATH`
  - with the Nushell package manager (**COMING SOON**)
2. Call `zellij-sessionizer.nu --help` from anywhere to get the help of the command

#### advanced (?) usage
in my `config.nu` file, i've added the following binding under `$env.config.keybindings`:
```nu
 {
     name: zellij_sessionizer
     modifier: control
     keycode: char_f
     mode: [emacs, vi_insert, vi_normal]
     event: {
         send: executehostcommand
         cmd: "zellij-sessionizer.nu $env.GIT_REPOS_HOME"
     }
 }
```
given that
- `zellij-sessionizer.nu` is in your `$env.PATH`,
- `$env.GIT_REPOS_HOME` is some variable defined in `env.nu` that points to a
place with lots of projects,

this binding will run the sessionizer simply by pressing `<C-f>` :ok_hand:


[`tmux-sessionizer`]: https://github.com/ThePrimeagen/.dotfiles/blob/602019e902634188ab06ea31251c01c1a43d1621/bin/.local/scripts/tmux-sessionizer
[Zellij]: https://zellij.dev/
[`fzf`]: https://github.com/junegunn/fzf
[`fd`]: https://github.com/sharkdp/fd
[Nushell]: https://www.nushell.sh
