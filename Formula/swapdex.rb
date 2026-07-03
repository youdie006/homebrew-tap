class Swapdex < Formula
  desc "Switch between multiple Claude Code and Codex login accounts, locally and safely"
  homepage "https://github.com/youdie006/swapdex"
  version "0.1.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/youdie006/swapdex/releases/download/v0.1.0/swapdex-aarch64-apple-darwin.tar.gz"
      sha256 "f541c8da8b4da3932928fc03a0ed6baceab65acf963eceebe13bfd0079227e35"
    else
      url "https://github.com/youdie006/swapdex/releases/download/v0.1.0/swapdex-x86_64-apple-darwin.tar.gz"
      sha256 "4d8ca2a5082217aedcc44a9727425d6cc1edd8fb88b2ce3e22a504c48c98bea7"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/youdie006/swapdex/releases/download/v0.1.0/swapdex-aarch64-unknown-linux-musl.tar.gz"
      sha256 "e2a1d1c09be876fd9570032b90ce5d106f71e58c92903df18e506cd162424d8e"
    else
      url "https://github.com/youdie006/swapdex/releases/download/v0.1.0/swapdex-x86_64-unknown-linux-musl.tar.gz"
      sha256 "b219a5fb45eb88299bc1e5debc112d556c64215125b429768c6d5903c1bdc0d2"
    end
  end

  def install
    bin.install "swapdex"
  end

  test do
    assert_match "swapdex 0.1.0", shell_output("#{bin}/swapdex --version")
  end
end
