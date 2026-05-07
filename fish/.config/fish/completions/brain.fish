# Disable default file completion
complete -c brain -f 

# Define subcommands
complete -c brain -n "not __fish_seen_subcommand_from search new mkdir todo cap sync random triage archive move" \
    -a "search new mkdir todo cap sync random triage archive move" -d 'Seiri Command'

# Specifically for 'mkdir', suggest the PARA types
complete -c brain -n "__fish_seen_subcommand_from mkdir" -a "p a r" -d 'Type: Project, Area, or Resource'

# Specifically for 'search' and 'move', re-enable file completions so you can pick .md files
complete -c brain -n "__fish_seen_subcommand_from search move" -F
