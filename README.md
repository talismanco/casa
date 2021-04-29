<h1 align="center" style="border-bottom: none;">🏠  Casa</h1>
<br />
<h3 align="center">Reproducible set of dotfiles and packages for Linux and macOS via <code>home-manager</code></h3>
<p align="center">
  <a href="#badge">
    <img alt="semantic-release" src="https://img.shields.io/badge/%20%20%F0%9F%93%A6%F0%9F%9A%80-semantic--release-e10079.svg">
  </a>
</p>

---

This is the setup that the [Talisman](https://github.com/talismanco) team uses to maintain identical build / development environments. The installation process is very
simple and allows for anyone to bootstrap a new development environment on any new machine in a matter of
seconds. The following is run on a pristine Ubuntu machine with `git`, `curl` and `make`
available:

```shell
  # clone the latest from master
  git clone git@github.com:talismanco/casa.git
  # run the initialization script
  make init
```

This will bootstrap `Nix` and `home-manager`, and install the respective profile for your operating system. **_Casa_** will be available in all subsequent shells, including the
customizations (vim with my favorite plugins, tmux with my customized
configuration, etc).

## How-To

Updating local instance after making a change:

```shell
$ home-manager switch
```

Listing the currently installed packages:

```shell
$ home-manager packages
```

Listing the previous and current configurations:

```shell
$ home-manager generations
```

Deleting old configurations by ID:

```shell
$ home-manager remove-generations [3 | 3 4 9]
```

Deleting old configurations by timestamps:

```shell
$ home-manager expire-generations [-30 days | 2018-01-01]
```

## Acknowledgements

Jean-Philippe Cugnet's [confkit](https://github.com/ejpcmac/confkit)

Nicolas Mattia's [homies](https://github.com/nmattia/homies)
