Using tar (for archiving multiple files/directories)
Create compressed archive:
Example: tar -czf archive.tar.gz /path/to/directory
-c – create archive
-z – compress with gzip
-f – file name for archive
Explanation: Creates a .tar.gz file from a directory.

Extract compressed archive:
Example: tar -xzf archive.tar.gz
-x – extract
-z – decompress with gzip
-f – specify file
Explanation: Extracts contents from a gzipped tarball.

Create uncompressed tarball:
Example: tar -cf archive.tar /path/to/directory
Explanation: Archives files without compression.

Extract uncompressed tarball:
Example: tar -xf archive.tar
Explanation: Extracts files from an uncompressed .tar archive.

Other Compression Tools

zip
Example: zip -r archive.zip folder/
-r – recursively include directories
Explanation: Creates a ZIP archive of a directory or file.

unzip
Example: unzip archive.zip
Explanation: Extracts contents of a .zip file.

gzip
Example: gzip file.txt
Explanation: Compresses a single file into file.txt.gz.

gunzip
Example: gunzip file.txt.gz
Explanation: Decompresses a .gz file.

bzip2
Example: bzip2 file.txt
Explanation: Compresses using bzip2 algorithm (higher compression than gzip).

bunzip2
Example: bunzip2 file.txt.bz2
Explanation: Decompresses bzip2-compressed files.

xz
Example: xz file.txt
Explanation: Compresses using xz for high compression ratio.

unxz
Example: unxz file.txt.xz
Explanation: Decompresses .xz files.