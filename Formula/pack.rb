class Pack < Formula
  version ''
  desc "Package manager for vim8."
  homepage "https://github.com/maralla/pack"

  if OS.mac?
    url "https://github.com/maralla/pack/releases/download/#{version}/pack-#{version}-x86_64-apple-darwin.tar.gz"
    sha256 "" # mac
  elsif OS.linux?
    url "https://github.com/maralla/pack/releases/download/#{version}/pack-#{version}-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "" # linux
  end

  conflicts_with "pack"

  def install
    bin.install "pack"

    bash_completion.install "contrib/pack.bash"
    fish_completion.install "contrib/pack.fish"
    zsh_completion.install "contrib/_pack"
  end
end
