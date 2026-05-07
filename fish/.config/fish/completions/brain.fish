# Disable default file completion to keep suggestions clean
complete -c brain -f 

# --- PARA Lifecycle Commands ---
complete -c brain -n "not __fish_seen_subcommand_from search new mkdir todo cap sync random triage archive move dir tree" \
    -a "new" -d 'Create timestamped note in 00_Inbox'
complete -c brain -n "not __fish_seen_subcommand_from search new mkdir todo cap sync random triage archive move dir tree" \
    -a "cap" -d 'Quickly append to capture.md'
complete -c brain -n "not __fish_seen_subcommand_from search new mkdir todo cap sync random triage archive move dir tree" \
    -a "triage" -d 'Sort through 00_Inbox and move files to PARA'
complete -c brain -n "not __fish_seen_subcommand_from search new mkdir todo cap sync random triage archive move dir tree" \
    -a "archive" -d 'Move a Project or Area to 40_Archive'
complete -c brain -n "not __fish_seen_subcommand_from search new mkdir todo cap sync random triage archive move dir tree" \
    -a "move" -d 'Fuzzy-move any file to a new destination'

# --- Navigation & Search Commands ---
complete -c brain -n "not __fish_seen_subcommand_from search new mkdir todo cap sync random triage archive move dir tree" \
    -a "search" -d 'Global fuzzy search through all notes (fzf + bat)'
complete -c brain -n "not __fish_seen_subcommand_from search new mkdir todo cap sync random triage archive move dir tree" \
    -a "todo" -d 'Find all active markdown tasks (- [ ])'
complete -c brain -n "not __fish_seen_subcommand_from search new mkdir todo cap sync random triage archive move dir tree" \
    -a "random" -d 'Open a random note for review'
complete -c brain -n "not __fish_seen_subcommand_from search new mkdir todo cap sync random triage archive move dir tree" \
    -a "dir tree" -d 'Show PARA directory structure'

# --- System Commands ---
complete -c brain -n "not __fish_seen_subcommand_from search new mkdir todo cap sync random triage archive move dir tree" \
    -a "mkdir" -d 'Create folder in (p)rojects, (a)reas, or (r)esources'
complete -c brain -n "not __fish_seen_subcommand_from search new mkdir todo cap sync random triage archive move dir tree" \
    -a "sync" -d 'Git add, commit, and push changes'

# --- Sub-argument Suggestions ---
# For 'mkdir', suggest the specific PARA types with descriptions
complete -c brain -n "__fish_seen_subcommand_from mkdir" -a "p" -d 'Project'
complete -c brain -n "__fish_seen_subcommand_from mkdir" -a "a" -d 'Area'
complete -c brain -n "__fish_seen_subcommand_from mkdir" -a "r" -d 'Resource'

# Re-enable file completion for commands that need a file path
complete -c brain -n "__fish_seen_subcommand_from search move" -F
