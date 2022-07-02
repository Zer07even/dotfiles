# dotfiles for Ubuntu 22.04

My preferred starting configuration.

The installation script (`install.sh`) will install the neccessary software in order to run the ansible playbooks for [my prefered software](https://github.com/Zer07even/ansible-laptop)

Add or delete programs in `install.sh` and `scripts/programs/` to modify your installation.

## Usage

```sh
./install.sh
```

## Random Helpful Stuff (TM)

### Saving and loading configuration settings

Where `SETTINGS_BACKUP` is wherever you backed up/want to back up your settings (aptly named, isn't it?), load `settings.dconf` with:

```sh
dconf load /org/gnome/ < $(SETTINGS_BACKUP)/.config/dconf/settings.dconf
```

Back up new settings with:

```sh
dconf dump /org/gnome/ > $(SETTINGS_BACKUP)/.config/dconf/settings.dconf
```

## Your personal CLI tool Makefile

See the Makefile in this repository for some helpful command aliases. Read about [self-documenting Makefiles on victoria.dev](https://victoria.dev/blog/how-to-create-a-self-documenting-makefile/).
