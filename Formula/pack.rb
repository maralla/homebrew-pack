class Pack < Formula
  version 'v0.2.15'
  desc "Package manager for vim8."
  homepage "https://github.com/maralla/pack"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/maralla/pack/releases/download/#{version}/pack-#{version}-aarch64-apple-darwin.tar.gz"
      sha256 "f4e7de7afc1a5f954d247988ba4aca4678a32149bdd488a0a1fc9914cfed7ebf" # mac-aarch64
    else
      url "https://github.com/maralla/pack/releases/download/#{version}/pack-#{version}-x86_64-apple-darwin.tar.gz"
      sha256 "2030089d3d52fd3aa6ff652081b0946b6d8e92c9ebe2011dea9cc1b74a93b1f0" # mac-x86
    end
  elsif OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/maralla/pack/releases/download/#{version}/pack-#{version}-aarch64-unknown-linux-musl.tar.gz"
      sha256 "0d833b63d05bb466ae99be0c7cae651532fb121b41f6e806418190f5f0435031" # linux-aarch64
    else
      url "https://github.com/maralla/pack/releases/download/#{version}/pack-#{version}-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "58f517f4c36ece8c7f45ea0e270a909f5b8200e4bab5683514657847dba61d3d" # linux-x86
    end
  end

  conflicts_with "pack"

  def install
    bin.install "pack"

    bash_completion.install "contrib/pack.bash"
    fish_completion.install "contrib/pack.fish"
    zsh_completion.install "contrib/_pack"
  end
end
