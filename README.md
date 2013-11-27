# Andrea's dotfiles

This repository is actually almost a copy of [Paul Irish's](https://github.com/paulirish/dotfiles) one, which is in turn a fork of [this](https://github.com/mathiasbynens/dotfiles/) one. Still, I'm not so keen on forking and I like to keep my own stuff neat and organized. Thanks to both of them anyways.

These are my (and Paul's and Mathias') dotfiles, but you're free (and encouraged) to steal them and do whatever you want to them.
This whole repository makes the smallest possible number of assumptions, so it should work pretty well on any OS X machine (and on Linux paying some more attention).

#### A note on git

This is another tip I stole from Paul (he showed this at a talk sometimes ago): taking a picture of yourself every time you commit on a repo.

The idea comes from [this](https://coderwall.com/p/xlatfq), and here's the reason on the directory `git/git-template-dir`: it already contains the proper hook in order to snap after commit, and the `GIT_TEMPLATE_DIR` variable is exported so that every time you `git init` a repo you have the snap feature.

(**Note** easily do a `git init` again on every existing repo if you want: it will use the template directory and therefore the snap feature but without you losing any data).
