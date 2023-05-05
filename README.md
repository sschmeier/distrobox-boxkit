# distrobox-boxkit

---

**This is a personal distrobox container image. I used the [https://github.com/ublue-os/boxkit](https://github.com/ublue-os/boxkit) template to build it.**

---

A base image and action for Toolbx and Distrobox.
Sure, you can use the distro you're used to, but what if ... 

This image is going to experiment with what a "born from cloud native" UNIX terminal experience would look like. 
It is used in conjuction with a [dotfile manager](https://dotfiles.github.io/utilities/) and designed to be the companion terminal experience for cloud-native desktops. 
We're starting small but have big aspirations.

- Starts with the latest Alpine image from the [Toolbx Community Images](https://github.com/toolbx-images/images)
- Adds some quality of life
  - `starship` prompt for that <3
  - `just` for task execution
  - `chezmoi` for dotfile management
  - `btop` for process management
  - `micro` and `helix` text editors
  - [clipboard](https://github.com/Slackadays/Clipboard) to cut, copy, and paste anything, anywhere, all from the terminal! 
  - `python3` 
  - Some common power tools: `plocate`, `fzf`, `cosign`, `ripgrep`, `github-cli`, and `ffmpeg`
  - CLI tools recommended by [rawkode](https://www.youtube.com/watch?v=TNlDSG1iDW8)
    - [direnv](https://direnv.net/) - environment variable extension for your shell 
    - [atuin](https://github.com/ellie/atuin) - magical shell history
- Host Management QoL
  - These are meant for occasional one off commands, not complex workflows
    - Auto symlink the flatpak, podman, and docker commands
    - Auto symlink rpm-ostree for Fedora
    - Auto symlink transactional-update for openSUSE MicroOS


## How to use


### Create Box

If you use distrobox:

    distrobox create -i ghcr.io/sschmeier/boxkit -n boxkit --pull
    distrobox enter boxkit
    
If you use toolbx:

    toolbox create -i ghcr.io/sschmeier/boxkit -c boxkit
    toolbox enter boxkit


### Pull down your config

Use `chezmoi` to pull down your dotfiles and set up git sync.


### Make your own

**I recommend using the origianl template at [https://github.com/ublue-os/boxkit](https://github.com/ublue-os/boxkit)**

Fork and add programs to this this image - over time you'll end up with the perfect CLI for you.
Keeping it as a pet works, though the author recommends leaving all your config in git and routinely pulling a new image.

The user experience is much nicer if you [set your terminal open right in the container](https://distrobox.privatedns.org/useful_tips.html#using-distrobox-as-main-cli) and is the intended experience. 


## Verification

These images are signed with sisgstore's [cosign](https://docs.sigstore.dev/cosign/overview/). You can verify the signature by downloading the `cosign.pub` key from this repo and running the following command:

    cosign verify --key cosign.pub ghcr.io/sschmeier/boxkit
    
If you're forking this repo you should [read the docs](https://docs.github.com/en/actions/security-guides/encrypted-secrets) on keeping secrets in github. You need to [generate a new keypair](https://docs.sigstore.dev/cosign/overview/) with cosign. The public key can be in your public repo (your users need it to check the signatures), and you can paste the private key in Settings -> Secrets -> Actions. Create a repository key names SIGINING_KEY
