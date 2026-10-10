class Pack < Formula
  version 'v0.2.14'
  desc "Package manager for vim8."
  homepage "https://github.com/maralla/pack"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/maralla/pack/releases/download/#{version}/pack-#{version}-aarch64-apple-darwin.tar.gz"
      sha256 "4978979fba28e5ef5fcecede7f6e9a53d5dd5096388a3daee6e8107d52bd6971" # mac-aarch64
    else
      url "https://github.com/maralla/pack/releases/download/#{version}/pack-#{version}-x86_64-apple-darwin.tar.gz"
      sha256 "fb82c99fd45fea944127673fe17d0adcebec1a1e32d114bed40790c9f55c3af4" # mac-x86
    end
  elsif OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/maralla/pack/releases/download/#{version}/pack-#{version}-aarch64-unknown-linux-musl.tar.gz"
      sha256 "2c80642992454ce92f98dc5695a6cc0dad2a911644e2f66e6e66e4f7dbdc6245" # linux-aarch64
    else
      url "https://github.com/maralla/pack/releases/download/#{version}/pack-#{version}-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "4791e88c52cafccb2e69285d52fb0ae19000c32cdac879526fe368d79c5b20d4" # linux-x86
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
