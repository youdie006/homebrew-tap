class Swapdex < Formula
  desc "Switch between multiple Claude Code and Codex login accounts, locally and safely"
  homepage "https://github.com/youdie006/swapdex"
  version "0.2.0"
  license "MIT"
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/youdie006/swapdex/releases/download/v0.2.0/swapdex-aarch64-apple-darwin.tar.gz"
      sha256 "8feb49aea1b48f254bcc68beb93128413048e45c1db686ca0b2894b1d3fbc801"
    else
      url "https://github.com/youdie006/swapdex/releases/download/v0.2.0/swapdex-x86_64-apple-darwin.tar.gz"
      sha256 "3ea0cb3b6ced83366f58b22ba0a8dd88dba49ec6ca203e03dedd0c6e6ad56c52"
    end
  end
  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/youdie006/swapdex/releases/download/v0.2.0/swapdex-aarch64-unknown-linux-musl.tar.gz"
      sha256 "fa7c2d5f696ee9448f2ffd9c3a14000b755ec786e1cd7f348c4283a999158178"
    else
      url "https://github.com/youdie006/swapdex/releases/download/v0.2.0/swapdex-x86_64-unknown-linux-musl.tar.gz"
      sha256 "1f3a45988f2c4c4d5530503974971c6779849f6db7eb11147be3348e0cac46f1"
    end
  end
  def install
    bin.install "swapdex"
    generate_completions_from_executable(bin/"swapdex", "completions")
    (buildpath/"swapdex.1").write Utils.safe_popen_read(bin/"swapdex", "manpage")
    man1.install "swapdex.1"
  end
  test do
    assert_match "swapdex 0.2.0", shell_output("#{bin}/swapdex --version")
  end
end
