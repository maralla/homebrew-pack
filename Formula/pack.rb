class Pack < Formula
  version 'v0.2.5'
  desc "Package manager for vim8."
  homepage "https://github.com/maralla/pack"

  if OS.mac?
    url "https://github.com/maralla/pack/releases/download/#{version}/pack-#{version}-x86_64-apple-darwin.tar.gz"
    sha256 "011349f1754cc4116fe2fce16638d688fd93e4ea55de5267177b0ad60cf84033" # mac
  elsif OS.linux?
    url "https://github.com/maralla/pack/releases/download/#{version}/pack-#{version}-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "bbf4f81fb0ac87ca8761a71c9b55277cc561bbe7ae68f980252281e006f15a5d" # linux
  end

  conflicts_with "pack"

  def install
    bin.install "pack"

    bash_completion.install "contrib/pack.bash"
    fish_completion.install "contrib/pack.fish"
    zsh_completion.install "contrib/_pack"
  end
end
