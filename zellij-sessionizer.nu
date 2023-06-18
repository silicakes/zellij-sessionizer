#!/usr/bin/env nu

def is-inside-zellij [] {
    $env.ZELLIJ? != null
}

# attach to a Zellij session by fuzzy finding projects
#
# # Examples
#     opening a session by listing `nu-git-manager` repositories
#     > zellij-sessionizer.nu (gm list --full-path)
#
#     open a session in local repos and documents
#     > zellij-sessionizer.nu (
#     >     [~/.local/share/repos/ ~/documents/] | each { ls $in | where type == dir | get name } | flatten
#     > )
def main [
    ...paths: path  # the list of paths to fuzzy find
] {
    if ($paths | is-empty) {
        error make --unspanned {msg: "no path given"}
    }

    let choices = (
        $paths | each {
            let tokens = ($in | path split)

            {
                project: ($tokens | last)
                path: ($tokens | drop 1 | path join)
            }
        }
    )

    let choice = (
        $choices.project | input list --fuzzy
            $"Please (ansi red)choose a directory(ansi reset) to (ansi cyan)attach to(ansi reset): "
    )
    if ($choice | is-empty) {
        return
    }

    let choice = ($choices | where project == $choice | get 0)
    let directory = ($choice.path | path join $choice.project)

    let session = ($directory | path basename)

    if not (is-inside-zellij) {
        cd $directory
        zellij attach --create $session options --default-shell nu
        return
    }

    zellij action new-pane

    # Hopefully they'll someday support specifying a directory and this won't be
    # as laggy thanks to @msirringhaus for getting this from the community some
    # time ago!
    zellij action write-chars $"cd ($directory)"
    zellij action write 10
}
