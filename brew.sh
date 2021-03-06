#!/usr/bin/env bash

# Install command-line tools using Homebrew.

which -s brew
if [[ $? != 0 ]] ; then
  echo "installing homebrew"
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)" </dev/null
else
  echo "homebrew installation found, updating+upgrading formulae"
  # Make sure we’re using the latest Homebrew.
  brew update
  # Upgrade any already-installed formulae.
  brew upgrade
fi

# Install GNU core utilities (those that come with macOS are outdated).
# Don’t forget to add `$(brew --prefix coreutils)/libexec/gnubin` to `$PATH`.
brew install coreutils

# Install some other useful utilities like `sponge`.
brew install moreutils
# Install GNU `find`, `locate`, `updatedb`, and `xargs`, `g`-prefixed.
brew install findutils
# Install GNU `sed`, overwriting the built-in `sed`.
brew install gnu-sed --with-default-names
# Install Bash 4.
# Note: don’t forget to add `/usr/local/bin/bash` to `/etc/shells` before
# running `chsh`. To do so, run `sudo chsh -s /usr/local/bin/bash`.
brew install bash
brew tap homebrew/versions
brew install bash-completion

# Switch to using brew-installed bash as default shell
if ! fgrep -q '/usr/local/bin/bash' /etc/shells; then
  echo '/usr/local/bin/bash' | sudo tee -a /etc/shells;
  chsh -s /usr/local/bin/bash;
fi;

# required by some of the modules installed
brew cask install java
brew cask install xquartz

# Install `wget` with IRI support.
brew install wget --with-iri

# Install RingoJS and Narwhal.
# Note that the order in which these are installed is important;
# see http://git.io/brew-narwhal-ringo.
brew install ringojs
brew install narwhal

# Install more recent versions of some macOS tools.
brew install vim --with-override-system-vi
brew install homebrew/dupes/grep
brew install homebrew/dupes/openssh
brew install homebrew/dupes/screen

# Install font tools.
brew tap bramstein/webfonttools
brew install sfnt2woff
brew install sfnt2woff-zopfli
brew install woff2

# Install some CTF tools; see https://github.com/ctfs/write-ups.
brew install aircrack-ng
brew install bfg
brew install binutils
brew install binwalk
brew install cifer
brew install dex2jar
brew install dns2tcp
brew install fcrackzip
brew install foremost
brew install hashpump
brew install hydra
brew install john
brew install knock
brew install netpbm
brew install nmap
brew install pngcheck
brew install socat
brew install sqlmap
brew install tcpflow
brew install tcpreplay
brew install tcptrace
brew install ucspi-tcp # `tcpserver` etc.
brew install xpdf
brew install xz

# Install other useful binaries.
brew install ack
brew install dark-mode
brew install git
brew install git-lfs
brew install imagemagick --with-webp
brew install lua
brew install lynx
brew install p7zip
brew install pigz
brew install pv
brew install rename
brew install rhino
brew install speedtest_cli
brew install ssh-copy-id
brew install task
brew install testssl
brew install tree
brew install vbindiff
brew install webkit2png
brew install youtube-dl
brew install zopfli

# Install some development tools
brew install ant
brew install awscli
brew install mvnvm
brew install watchman
brew install yarn

#python
brew install python3
brew unlink python && brew link python
sudo pip install localstack

# Install cask software https://caskroom.github.io/
brew cask install calibre
brew cask install docker
brew cask install google-chrome
brew cask install firefox
brew cask install hyper
brew cask install scummvm
brew cask install skype
brew cask install slack
brew cask install sourcetree
brew cask install iterm2
brew cask install transmission
brew cask install visual-studio-code
brew cask install vlc

# Remove outdated versions from the cellar.
brew cleanup

echo "The following software is not available in Homebrew:";
echo "   -- Google Drive https://www.google.com/drive/download/";
echo "   -- NodeJS https://nodejs.org/en/download/";
