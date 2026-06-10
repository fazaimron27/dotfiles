  function __fish_bmark_mix_is_subcommand
    set -l words (commandline -opc)

    if test (count $words) -lt 3
        return 1
    end

    if test "$words[1]" != "mix"
        return 1
    end

    if test "$words[2]" != "bmark"
        return 1
    end

    contains -- "$words[3]" $argv
end

function __fish_bmark_mix_needs_subcommand
    set -l words (commandline -opc)

    if test (count $words) -lt 2
        return 1
    end

    if test "$words[1]" != "mix"
        return 1
    end

    if test "$words[2]" != "bmark"
        return 1
    end

    if test (count $words) -eq 2
        return 0
    end

    set -l commands add edit get open rm list export import backup help completion a e g o r del delete ls ex im bk c

    if contains -- "$words[3]" $commands
        return 1
    end

    return 0
end

function __fish_bmark_direct_is_subcommand
    set -l words (commandline -opc)

    if test (count $words) -lt 2
        return 1
    end

    if test "$words[1]" != "bmark"
        return 1
    end

    contains -- "$words[2]" $argv
end

function __fish_bmark_direct_needs_subcommand
    set -l words (commandline -opc)

    if test (count $words) -lt 1
        return 1
    end

    if test "$words[1]" != "bmark"
        return 1
    end

    if test (count $words) -eq 1
        return 0
    end

    set -l commands add edit get open rm list export import backup help completion a e g o r del delete ls ex im bk c

    if contains -- "$words[2]" $commands
        return 1
    end

    return 0
end

function __fish_bmark_aliases
    set -l lines

    if functions -q bmark
        set lines (bmark list 2>/dev/null)
    else
        set lines (mix bmark list 2>/dev/null)
    end

    printf '%s
' $lines     | string match -r '^\| [^|]+ \|'     | string replace -r '^\| ([^|]+) \|.*' '$1'     | string trim     | string match -v 'ALIAS'
end

  complete -c mix -n '__fish_bmark_mix_needs_subcommand' -f
  complete -c mix -n '__fish_bmark_mix_needs_subcommand' -a 'add' -d 'Add a bookmark'
complete -c mix -n '__fish_bmark_mix_needs_subcommand' -a 'edit' -d 'Edit a bookmark'
complete -c mix -n '__fish_bmark_mix_needs_subcommand' -a 'get' -d 'Print bookmark URL'
complete -c mix -n '__fish_bmark_mix_needs_subcommand' -a 'open' -d 'Open bookmark in browser'
complete -c mix -n '__fish_bmark_mix_needs_subcommand' -a 'rm' -d 'Remove a bookmark'
complete -c mix -n '__fish_bmark_mix_needs_subcommand' -a 'list' -d 'List bookmarks'
complete -c mix -n '__fish_bmark_mix_needs_subcommand' -a 'export' -d 'Export bookmarks to JSON'
complete -c mix -n '__fish_bmark_mix_needs_subcommand' -a 'import' -d 'Import bookmarks from JSON'
complete -c mix -n '__fish_bmark_mix_needs_subcommand' -a 'backup' -d 'Create timestamped backup'
complete -c mix -n '__fish_bmark_mix_needs_subcommand' -a 'help' -d 'Show help'
complete -c mix -n '__fish_bmark_mix_needs_subcommand' -a 'completion' -d 'Generate shell completion script'

complete -c mix -n '__fish_bmark_mix_needs_subcommand' -a 'a' -d 'Alias for add'
complete -c mix -n '__fish_bmark_mix_needs_subcommand' -a 'e' -d 'Alias for edit'
complete -c mix -n '__fish_bmark_mix_needs_subcommand' -a 'g' -d 'Alias for get'
complete -c mix -n '__fish_bmark_mix_needs_subcommand' -a 'o' -d 'Alias for open'
complete -c mix -n '__fish_bmark_mix_needs_subcommand' -a 'r' -d 'Alias for rm'
complete -c mix -n '__fish_bmark_mix_needs_subcommand' -a 'del' -d 'Alias for rm'
complete -c mix -n '__fish_bmark_mix_needs_subcommand' -a 'delete' -d 'Alias for rm'
complete -c mix -n '__fish_bmark_mix_needs_subcommand' -a 'ls' -d 'Alias for list'
complete -c mix -n '__fish_bmark_mix_needs_subcommand' -a 'ex' -d 'Alias for export'
complete -c mix -n '__fish_bmark_mix_needs_subcommand' -a 'im' -d 'Alias for import'
complete -c mix -n '__fish_bmark_mix_needs_subcommand' -a 'bk' -d 'Alias for backup'
complete -c mix -n '__fish_bmark_mix_needs_subcommand' -a 'c' -d 'Alias for completion'

complete -c mix -n '__fish_bmark_mix_is_subcommand add a' -l tags -s T -r -d 'Comma-separated tags'

complete -c mix -n '__fish_bmark_mix_is_subcommand edit e' -l url -s u -r -d 'New URL'
complete -c mix -n '__fish_bmark_mix_is_subcommand edit e' -l tags -s T -r -d 'Comma-separated tags'
complete -c mix -n '__fish_bmark_mix_is_subcommand edit e' -l rename -s r -r -d 'New alias'

complete -c mix -n '__fish_bmark_mix_is_subcommand open o' -l incognito -s i -d 'Open in incognito mode'
complete -c mix -n '__fish_bmark_mix_is_subcommand open o' -l search -s s -r -d 'Search text'

complete -c mix -n '__fish_bmark_mix_is_subcommand list ls' -l prefix -s p -r -d 'Alias prefix filter'
complete -c mix -n '__fish_bmark_mix_is_subcommand list ls' -l top -s t -r -d 'Show top N by visits'
complete -c mix -n '__fish_bmark_mix_is_subcommand list ls' -l tag -s T -r -d 'Filter by tag'
complete -c mix -n '__fish_bmark_mix_is_subcommand list ls' -l search -s s -r -d 'Search alias, URL, tags'

complete -c mix -n '__fish_bmark_mix_is_subcommand import im' -l mode -s m -r -a 'skip upsert' -d 'Import mode'
complete -c mix -n '__fish_bmark_mix_is_subcommand import im' -l dry-run -s n -d 'Preview only, do not write'

complete -c mix -n '__fish_bmark_mix_is_subcommand backup bk' -l dir -s d -r -d 'Backup directory'

complete -c mix -n '__fish_bmark_mix_is_subcommand get g open o edit e rm r del delete' -f
complete -c mix -n '__fish_bmark_mix_is_subcommand get g open o edit e rm r del delete' -a '(__fish_bmark_aliases)' -d 'Saved alias'

complete -c mix -n '__fish_bmark_mix_is_subcommand completion c' -a 'fish' -d 'Generate fish completions'

  complete -c bmark -n '__fish_bmark_direct_needs_subcommand' -f
  complete -c bmark -n '__fish_bmark_direct_needs_subcommand' -a 'add' -d 'Add a bookmark'
complete -c bmark -n '__fish_bmark_direct_needs_subcommand' -a 'edit' -d 'Edit a bookmark'
complete -c bmark -n '__fish_bmark_direct_needs_subcommand' -a 'get' -d 'Print bookmark URL'
complete -c bmark -n '__fish_bmark_direct_needs_subcommand' -a 'open' -d 'Open bookmark in browser'
complete -c bmark -n '__fish_bmark_direct_needs_subcommand' -a 'rm' -d 'Remove a bookmark'
complete -c bmark -n '__fish_bmark_direct_needs_subcommand' -a 'list' -d 'List bookmarks'
complete -c bmark -n '__fish_bmark_direct_needs_subcommand' -a 'export' -d 'Export bookmarks to JSON'
complete -c bmark -n '__fish_bmark_direct_needs_subcommand' -a 'import' -d 'Import bookmarks from JSON'
complete -c bmark -n '__fish_bmark_direct_needs_subcommand' -a 'backup' -d 'Create timestamped backup'
complete -c bmark -n '__fish_bmark_direct_needs_subcommand' -a 'help' -d 'Show help'
complete -c bmark -n '__fish_bmark_direct_needs_subcommand' -a 'completion' -d 'Generate shell completion script'

complete -c bmark -n '__fish_bmark_direct_needs_subcommand' -a 'a' -d 'Alias for add'
complete -c bmark -n '__fish_bmark_direct_needs_subcommand' -a 'e' -d 'Alias for edit'
complete -c bmark -n '__fish_bmark_direct_needs_subcommand' -a 'g' -d 'Alias for get'
complete -c bmark -n '__fish_bmark_direct_needs_subcommand' -a 'o' -d 'Alias for open'
complete -c bmark -n '__fish_bmark_direct_needs_subcommand' -a 'r' -d 'Alias for rm'
complete -c bmark -n '__fish_bmark_direct_needs_subcommand' -a 'del' -d 'Alias for rm'
complete -c bmark -n '__fish_bmark_direct_needs_subcommand' -a 'delete' -d 'Alias for rm'
complete -c bmark -n '__fish_bmark_direct_needs_subcommand' -a 'ls' -d 'Alias for list'
complete -c bmark -n '__fish_bmark_direct_needs_subcommand' -a 'ex' -d 'Alias for export'
complete -c bmark -n '__fish_bmark_direct_needs_subcommand' -a 'im' -d 'Alias for import'
complete -c bmark -n '__fish_bmark_direct_needs_subcommand' -a 'bk' -d 'Alias for backup'
complete -c bmark -n '__fish_bmark_direct_needs_subcommand' -a 'c' -d 'Alias for completion'

complete -c bmark -n '__fish_bmark_direct_is_subcommand add a' -l tags -s T -r -d 'Comma-separated tags'

complete -c bmark -n '__fish_bmark_direct_is_subcommand edit e' -l url -s u -r -d 'New URL'
complete -c bmark -n '__fish_bmark_direct_is_subcommand edit e' -l tags -s T -r -d 'Comma-separated tags'
complete -c bmark -n '__fish_bmark_direct_is_subcommand edit e' -l rename -s r -r -d 'New alias'

complete -c bmark -n '__fish_bmark_direct_is_subcommand open o' -l incognito -s i -d 'Open in incognito mode'
complete -c bmark -n '__fish_bmark_direct_is_subcommand open o' -l search -s s -r -d 'Search text'

complete -c bmark -n '__fish_bmark_direct_is_subcommand list ls' -l prefix -s p -r -d 'Alias prefix filter'
complete -c bmark -n '__fish_bmark_direct_is_subcommand list ls' -l top -s t -r -d 'Show top N by visits'
complete -c bmark -n '__fish_bmark_direct_is_subcommand list ls' -l tag -s T -r -d 'Filter by tag'
complete -c bmark -n '__fish_bmark_direct_is_subcommand list ls' -l search -s s -r -d 'Search alias, URL, tags'

complete -c bmark -n '__fish_bmark_direct_is_subcommand import im' -l mode -s m -r -a 'skip upsert' -d 'Import mode'
complete -c bmark -n '__fish_bmark_direct_is_subcommand import im' -l dry-run -s n -d 'Preview only, do not write'

complete -c bmark -n '__fish_bmark_direct_is_subcommand backup bk' -l dir -s d -r -d 'Backup directory'

complete -c bmark -n '__fish_bmark_direct_is_subcommand get g open o edit e rm r del delete' -f
complete -c bmark -n '__fish_bmark_direct_is_subcommand get g open o edit e rm r del delete' -a '(__fish_bmark_aliases)' -d 'Saved alias'

complete -c bmark -n '__fish_bmark_direct_is_subcommand completion c' -a 'fish' -d 'Generate fish completions'
