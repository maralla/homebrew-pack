class Pack < Formula
  version 'v0.2.12'
  desc "Package manager for vim8."
  homepage "https://github.com/maralla/pack"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/maralla/pack/releases/download/#{version}/pack-#{version}-aarch64-apple-darwin.tar.gz"
      sha256 "5f19e855cd931c40a970bd1ce2b73cedd24611211159783f93b1fed143014885" # mac-aarch64
    else
      url "https://github.com/maralla/pack/releases/download/#{version}/pack-#{version}-x86_64-apple-darwin.tar.gz"
      sha256 "b2759fd79af01eff3b5161610c45dd29498f81a06d98093009f78276b58f3e1a" # mac-x86
    end
  elsif OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/maralla/pack/releases/download/#{version}/pack-#{version}-aarch64-unknown-linux-musl.tar.gz"
      sha256 "8b9941c6ac980a7a353beecdaa897a3ec2b8f59b585f475bf466035747e9bef3" # linux-aarch64
    else
      url "https://github.com/maralla/pack/releases/download/#{version}/pack-#{version}-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "661e77d313f9cf6a37b39fecb309bcdff443d101c5a05b72613fcc35c7499b0d" # linux-x86
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
