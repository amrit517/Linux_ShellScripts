ls – List directory contents
Displays the files and directories in the current directory.

Example:
ls

cd – Change directory
Changes the current directory to the specified one.
Example:
cd /path/to/directory


pwd – Print working directory
Displays the current directory you are working in.
Example:
pwd

cp – Copy files and directories
Copies files or directories to another location.
Example:
cp file1.txt /path/to/destination/


mv – Move or rename files and directories
Moves or renames files and directories.
Example:
mv old_name.txt new_name.txt  # Rename a file
mv file.txt /path/to/destination/  # Move a file


rm – Remove files or directories
Deletes files or directories (use with caution).
Example:
rm file1.txt
rm -r directory/  # Remove a directory and its contents

mkdir – Make directories
Creates a new directory.
Example:
mkdir new_directory

rmdir – Remove empty directories
Deletes an empty directory.
Example:
rmdir empty_directory

touch – Change file timestamps or create empty files
Updates the access and modification times of a file, or creates an empty file if it doesn't exist.
Example:
touch newfile.txt  # Create an empty file


find – Search for files in a directory hierarchy
Searches for files or directories based on conditions like name, type, size, etc.
Example:

find /path/to/search -name "*.txt"  # Find all .txt files

locate – Find files by name
Quickly locates files by their names using a pre-built database (faster than find).
Example:
locate file1.txt

tree – Display directories in a tree-like format
Shows a directory and its subdirectories in a tree structure.
Example:
tree /path/to/directory

chmod – Change file permissions
Modifies the permissions of a file or directory.
Example:
chmod 755 file1.sh  # Set read, write, and execute for the owner; read and execute for others

chown – Change file owner and group
Changes the ownership of a file or directory.
Example:
chown user:group file1.txt

chgrp – Change group ownership
Changes the group ownership of a file or directory.
Example:
chgrp groupname file1.txt

stat – Display file or file system status
Shows detailed information about a file or file system.
Example:
stat file1.txt


