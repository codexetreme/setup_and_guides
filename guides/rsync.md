# Rsync 

Use it sync between local and remote environments

`rsync -azP source destination`

## -a option 
The -a option is a combination flag. It stands for “archive” and syncs recursively and preserves symbolic links, special and device files, modification times, group, owner, and permissions. It is more commonly used than -r and is usually what you want to use. 

## -n, -dry-run

Always double-check your arguments before executing an rsync command. Rsync provides a method for doing this by passing the -n or –dry-run options. The -v flag (for verbose) is also necessary to get the appropriate output

## -z option

If you are transferring files that have not already been compressed, like text files, you can reduce the network transfer by adding compression with the -z flag


## -P option

The -P flag is very helpful. It combines the flags –progress and –partial. The first of these gives you a progress bar for the transfers and the second allows you to resume interrupted transfers

# running rsync on remote destinations via SSH

`rsync -a ~/dir1 username@remote_host:destination_directory`


