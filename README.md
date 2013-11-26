# Andrea's dotfiles

This repository is actually almost a copy of [Paul Irish's](https://github.com/paulirish/dotfiles) one, which is in turn a fork of [this](https://github.com/mathiasbynens/dotfiles/) one. Still, I'm not so keen on forking and I like to keep my own stuff neat and organized. Sorry Paul!

These are my (and Paul's and Mathias's) dotfiles, but you're free (and encouraged) to steal them and do whatever you want to them.
Anyway, this whole repository makes the smallest possible number of assunctions, so it should work pretty well on any OS X machine (and on Linux paying a little more attention).

## `install-deps.sh`

This installs some stuff (like rvm, brew, z, Pygments) and I run it on every fresh OS X install or new machine.

## `synclinks.sh`

As you can see, I like to keep all of my dotfiles inside `~/.dotfiles` so that I don't have to version control `~`, which is a horrible and very unwise thing to do.
In order to use all the dotfiles in this repo, just run

```bash
./synclinks.sh
```

It will symlink all the necessary stuff inside `~` so you don't have to.

### That big and super-modular `.bash_profile`

`.bashrc` calls `.bash_profile`, which does little by itself: everything is modular (thank you again, Paul) and so it loads a bunch of files (`.aliases`, `.functions` etc.).

I'm keeping Paul's strategy alive by letting you use `.extra` for all your personal stuff you don't want to commit (it's loaded by default but ignored by git).

Actually, there's a neat little "bug" inside `.exports`, which uses a custom path in order to store git snaps-after-commit in GDrive, but either remove it or re-export your `GITSHOTS` variable inside `.extra`.




### Sensible OS X defaults

When setting up a new Mac, you may want to set some sensible OS X defaults:

```bash
./.osx
```

### Contents

#### shell environment
* `.aliases`
* `.bash_profile`
* `.bash_prompt`
* `.bashrc`
* `.exports`
* `.functions`
* `.path`
* `.inputrc` - config for bash readline
* `.extra` - not included, explained above

#### manual run
* `install-deps.sh`
* `.osx`
* `.brew` - homebrew initial setup

#### A note on git

This is another tip I stole from Paul (he showed this at a talk sometimes ago): taking a picture of yourself everytime you commit on a repo.

The idea comes from [this](https://coderwall.com/p/xlatfq), and here's the reason on the directory `git/git-template-dir`: it already contains the proper hook in order to snap after commit, and the `GIT_TEMPLATE_DIR` variable is exported so that everytime you `git init` a repo you have the snap feature.

(Note: easily do a `git init` again on every existing repo if you want: it will use the template directory and therefore the snap feature but without you losing any data).
