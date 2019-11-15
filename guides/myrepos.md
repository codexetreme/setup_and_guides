# Myrepos
### Install
`sudo apt install myrepos`

You have a lot of version control repositories. Sometimes you want to update them all at once. Or push out all your local changes. You use special command lines in some repositories to implement specific workflows. Myrepos provides a mr command, which is a tool to manage all your version control repositories.

#### getting started
All you need to get started is some already checked out repos. These could be using git, or bzr, mercurial or darcs, or many other version control systems. Doesn't matter, they're all supported!

Inside each of your repositories, run `mr register`. That sets up a `~/.mrconfig` file listing your repositories.

Now you can run `mr update` in your home directory, and it'll update every one of your repositories that you've registered with myrepos.

Want to update repositories in parallel? `mr -j5` update will run 5 concurrent jobs!

If you run `mr update` inside a repository, it'll only act on that repository. In general, any mr command runs recursively over any repository located somewhere in or under the current directory.

You can also run `mr commit`, `mr push`, `mr status`, `mr diff`, and a lot of other commands. These work no matter which version control system is used for a repository. Of course, you can still use the native version control commands too.

Oh, and you can abbreviate any command to any unambiguous abbreviation. mr up, mr pu, etc.

Now, maybe you find that you always want to update one repository using git pull --rebase, instead of the default git pull that mr update runs. No problem: The `~/.mrconfig` file makes it easy to override the command run for any repository. It's like a Makefile for repositories.