function git-commit-per-file
    # Define arguments and options
    argparse 'p/commit_subject_format=' 'm/commit_message=' d/dry_run -- $argv
    or return # Exit if argument parsing fails

    # Default commit subject format if not provided via -p or --commit_subject_format
    if not set -q commit_subject_format
        set commit_subject_format "%p: %f"
    end

    # Default commit message if not provided via -m or --commit_message
    if not set -q commit_message
        set commit_message ""
    end

    # Set dry_run flag based on argument parsing
    set -q dry_run

    for line in (git status --porcelain)
        set file_status (echo $line | awk '{print $1}')
        set file (echo $line | awk '{print $2}')

        # Split the file path by /
        set path_parts (string split / $file)

        # Get the last part of the path (filename)
        set filename $path_parts[-1]

        # Remove the extension from the filename
        set filename_no_ext (string replace -r '\.[^.]*$' '' $filename)

        # Construct the commit subject using the provided format
        set -l commit_subject (
            string replace -a "%p" (string join / $path_parts[1..-2]) (string replace -a "%f" $filename_no_ext $commit_subject_format)
        )

        if test (string length $commit_subject) -gt 72
            echo "The commit subject is longer than 72 characters."
            break
        end

        # Assume wrap_string is defined elsewhere in your fish config or as a separate function
        set -l wrapped_commit_message (wrap_string $commit_message 72)

        switch $file_status
            case M A D
                if set -q dry_run
                    echo "======================"
                    echo "Would commit file: $filename"
                    echo "With subject: $commit_subject"
                    echo -e "With message: $wrapped_commit_message"
                    echo "======================"
                else
                    git add $file
                    git commit -m "$commit_subject

$wrapped_commit_message"
                end
            case '*'
                echo "Untracked file: $file"
        end
    end
end

function wrap_string --argument str --argument width
    set -l output ""
    set -l words (string split ' ' $str)

    set -l line ""
    for word in $words
        if test (string length "$line $word") -gt $width
            set output "$output\n$line"
            set line $word
        else
            set line "$line $word"
        end
    end

    set -l line (string trim (string sub -s 3 "$output\n$line"))
    echo "$line"
end
