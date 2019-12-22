class Pack < Formula
  version 'v0.2.5'
  desc "Package manager for vim8."
  homepage "https://github.com/maralla/pack"

  if OS.mac?
    url "https://github.com/maralla/pack/releases/download/#{version}/pack-#{version}-x86_64-apple-darwin.tar.gz"
    sha256 "0b8e3c53d1b1ce5a5a6bc7aee7a60f37bcf5d2c623d505c7eb9f4f872a5f345f" # mac
  elsif OS.linux?
    url "https://github.com/maralla/pack/releases/download/#{version}/pack-#{version}-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "ecdd18495cddb3e671016e7df41766715edbc8eaa8a2d30c3446cd70898e19ee" # linux
  end

  conflicts_with "pack"

  def install
    bin.install "pack"

    bash_completion.install "contrib/pack.bash"
    fish_completion.install "contrib/pack.fish"
    zsh_completion.install "contrib/_pack"
  end
end
