# For my second-brain
function brain
  set -l notes_dir ~/Documents/Notes
  
  switch "$argv[1]"
    case "search"
      set -l note (fd . $notes_dir --type f --extension md | fzf --preview 'bat --color=always --style=numbers {}')
      test -n "$note"; and nvim $note

    case "new"
      if test (count $argv) -lt 2
        echo "Usage: brain new <title>"; return 1
      end
      set -l title_parts $argv[2..-1]
      set -l date (date +%Y-%m-%d)
      set -l clean_title (string join '-' $title_parts | string lower)
      set -l filename "$notes_dir/00_Inbox/[$date]$clean_title.md"
      echo "# "(string join ' ' $title_parts) > $filename
      nvim $filename

    case "mkdir"
        # Usage: brain mkdir <p|a|r> <folder-name>
      set -l type $argv[2]
      set -l folder_name (string join '-' $argv[3..-1] | string lower)
      
      if test -z "$type"; or test -z "$folder_name"
        echo "Usage: brain mkdir [p|a|r] <name>"
        echo "  p = Projects, a = Areas, r = Resources"
        return 1
      end

      switch $type
        case "p"; set target "10_Projects"
        case "a"; set target "20_Areas"
        case "r"; set target "30_Resources"
        case "*"; echo "Invalid type. Use p, a, or r."; return 1
      end

      set -l full_path "$notes_dir/$target/$folder_name"
      mkdir -p $full_path
      touch $full_path/.gitkeep
      echo "Created directory: $target/$folder_name"

    case "todo"
      set -l todo (rg --column --line-number --no-heading --color=always --smart-case "- \[ \]" $notes_dir | fzf --ansi --delimiter : --preview 'bat --color=always --highlight-line {2} {1}')
      if test -n "$todo"
        set -l file (echo $todo | cut -d: -f1)
        set -l line (echo $todo | cut -d: -f2)
        nvim +$line $file
      end

    case "cap"
      if test (count $argv) -lt 2
          echo "Usage: brain cap <message>"; return 1
      end
      set -l date (date +%Y-%m-%d)
      echo "- [$date] $argv[2..-1]" >> "$notes_dir/capture.md"
      echo "Thought captured to $notes_dir/capture.md"

    case "sync"
      cd $notes_dir
      git add .
      set -l current_date (date +%Y-%m-%d)
      git commit -m "Brain update: $current_date"
      git push
      cd -

    case "random"
      set -l note (fd . $notes_dir --type f --extension md | shuf -n 1)
      test -n "$note"; and nvim $note

    case "dir" "tree"
      ezatree --level=2 --ignore-glob=".git|.gitignore|.gitkeep" $notes_dir

    case "triage"
      set -l inbox_files (fd . "$notes_dir/00_Inbox" --type f --extension md)
      
      if test -z "$inbox_files"
        echo "Inbox is clean! ✨"
        return
      end

      for file in $inbox_files
        set -l filename (basename $file)
        echo "--- Triaging: $filename ---"
        bat --color=always --style=plain --line-range :10 $file 
        
        set -l target_dir (fd . $notes_dir --type d --max-depth 2 | fzf --header "Move '$filename' to..." --height 40%)
        
        if test -n "$target_dir"
          mv $file "$target_dir/"
          echo "Moved to $target_dir"
        else
          echo "Skipped."
        end
      end

    case "archive"
      set -l source (fd . "$notes_dir/10_Projects" "$notes_dir/20_Areas" --max-depth 1 --type d | fzf --header "Select item to ARCHIVE")
      
      if test -n "$source"
        set -l folder_name (basename $source)
        mv $source "$notes_dir/40_Archive/"
        echo "Archived: $folder_name"
      end

    case "move"
      set -l file (fd . $notes_dir --type f | fzf --header "Select file to move")
      if test -n "$file"
        set -l target (fd . $notes_dir --type d | fzf --header "Select destination")
        if test -n "$target"
          mv $file $target/
          echo "Moved "(basename $file)" to "(basename $target)
        end
      end
    
    case "-h" "--help"
      echo "Seiri: Terminal Second Brain CLI"
      echo "--------------------------------"
      echo "Usage: brain [command] [arguments]"
      echo ""
      echo "PARA Lifecycle:"
      echo "  new <title>      Create timestamped note in 00_Inbox"
      echo "  cap <msg>        Quickly append to capture.md"
      echo "  triage           Sort through 00_Inbox and move files to PARA"
      echo "  archive          Move a Project or Area to 40_Archive"
      echo "  move             Fuzzy-move any file to a new destination"
      echo ""
      echo "Navigation & Search:"
      echo "  search           Global fuzzy search through all notes (fzf + bat)"
      echo "  todo             Find all active markdown tasks (- [ ])"
      echo "  random           Open a random note for review"
      echo "  dir/tree         Show PARA directory structure"
      echo ""
      echo "System:"
      echo "  mkdir <t> <name> Create folder in (p)rojects, (a)reas, or (r)esources"
      echo "  sync             Git add, commit, and push changes"
      echo "  * (default)      Open Yazi file manager in notes directory"

    case "*"
      cd $notes_dir && yazi
  end
end

