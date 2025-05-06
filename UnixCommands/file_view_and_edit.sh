cat – Concatenate and display file content
Displays the content of a file.
Example:
cat file1.txt

tac – Concatenate and display file content in reverse
Displays the content of a file in reverse order (opposite of cat).
Example:
tac file1.txt

more – View file content interactively (page by page)
Views file content interactively, one page at a time.
Example:
more file1.txt

less – View file content interactively (scrollable)
Similar to more, but allows both forward and backward scrolling.
Example:
less file1.txt


head – Output the first part of a file
Displays the first few lines of a file (default is 10 lines).
Example:
head file1.txt
head -n 20 file1.txt  # Show first 20 lines

tail – Output the last part of a file
Displays the last few lines of a file (default is 10 lines).
Example:
tail file1.txt
tail -n 20 file1.txt  # Show last 20 lines

nano – Text editor (terminal-based)
A simple, user-friendly text editor that runs in the terminal.
Example:
nano file1.txt

vim / vi – Advanced text editors
Vim and vi are powerful text editors used for editing files in the terminal.
Example:
vim file1.txt
vi file1.txt

emacs – Text editor
A highly customizable text editor used for editing files.
Example:
emacs file1.txt

grep – Search text using patterns
Searches for a specific pattern within a file.
Example:
grep "search_term" file1.txt

sed – Stream editor for filtering and transforming text
Used for performing basic text transformations on an input stream.
Example:
sed 's/old/new/g' file1.txt  # Replace all occurrences of 'old' with 'new'

awk – Pattern scanning and processing language
A versatile tool used for pattern scanning and processing text.
Example:
awk '{print $1}' file1.txt  # Print the first column of each line
cut – Remove sections from each line of files
Used to extract sections (columns) from each line of a file.
Example:
cut -d ' ' -f 1 file1.txt  # Extract the first column (space-separated)