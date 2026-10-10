class Pack < Formula
  version 'v0.2.13'
  desc "Package manager for vim8."
  homepage "https://github.com/maralla/pack"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/maralla/pack/releases/download/#{version}/pack-#{version}-aarch64-apple-darwin.tar.gz"
      sha256 "834a2674995c3d366b404cc3f09d1824bcf2582815dced1dbce0e51bae1d04a5" # mac-aarch64
    else
      url "https://github.com/maralla/pack/releases/download/#{version}/pack-#{version}-x86_64-apple-darwin.tar.gz"
      sha256 "7072106a8e8aaf865f2dd1c7af73c0d7dcd77c0df64662e0deb24bc2ce7f303b" # mac-x86
    end
  elsif OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/maralla/pack/releases/download/#{version}/pack-#{version}-aarch64-unknown-linux-musl.tar.gz"
      sha256 "a299cc9d8404587af4558dccfed48012352a83f60e794ad51a7627cc891417a7" # linux-aarch64
    else
      url "https://github.com/maralla/pack/releases/download/#{version}/pack-#{version}-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "85a6392e61bc36a2721200e2a7685628db7737bf68a2a2141c745df5b3880936" # linux-x86
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
