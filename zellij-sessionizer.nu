#!/usr/bin/env nu

def is-inside-zellij [] {
    $env.ZELLIJ? != null
}

# attach to a Zellij session by fuzzy finding projects
#
# the projects are computed by listing all the directories at depth between 1
# and 2 recursively under the `path` argument.
def main [
    ...paths: path
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
