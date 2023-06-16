#!/usr/bin/env nu

def is-inside-zellij [] {
    $env.ZELLIJ? != null
}

def main [
    path: path
] {
    let project = (if (which fd | is-empty) {
        ^find $path -mindepth 1 -maxdepth 2 -type d
    } else {
        ^fd . $path --min-depth 1 --max-depth 2 --type d
    } | fzf)

    let session = ($project | path basename)

    if not (is-inside-zellij) {
        cd $project
        zellij attach --create $session options --default-shell nu
        return
    }

    zellij action new-pane

    # Hopefully they'll someday support specifying a directory and this won't be
    # as laggy thanks to @msirringhaus for getting this from the community some
    # time ago!
    zellij action write-chars $"cd ($project)"
    zellij action write 10
}
