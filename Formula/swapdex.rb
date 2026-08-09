class Swapdex < Formula
  desc "Switch between multiple Claude Code, Codex, Gemini, and Antigravity login accounts, locally and safely"
  homepage "https://github.com/youdie006/swapdex"
  version "0.44.0"
  license "MIT"
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/youdie006/swapdex/releases/download/v0.44.0/swapdex-aarch64-apple-darwin.tar.gz"
      sha256 "f8ae865d5492854c24d4aee9e9df063af0a340ce2fcd5814e28016c3ff9dd0c7"
    else
      url "https://github.com/youdie006/swapdex/releases/download/v0.44.0/swapdex-x86_64-apple-darwin.tar.gz"
      sha256 "91c60a24a2952acc4c0c8ed74141bbbfb98753183dea15c4877928888ff9ad3c"
    end
  end
  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/youdie006/swapdex/releases/download/v0.44.0/swapdex-aarch64-unknown-linux-musl.tar.gz"
      sha256 "2dc1169d6ae72941985746c0666a15e46130edfeea5afb0e6f8746ba11bf9250"
    else
      url "https://github.com/youdie006/swapdex/releases/download/v0.44.0/swapdex-x86_64-unknown-linux-musl.tar.gz"
      sha256 "1bf05c7b35ec7de26548e8ef36dcdb8479e63c13f7c86a1fb1fea9fb87d56517"
    end
  end
  def install
    bin.install "swapdex"
    generate_completions_from_executable(bin/"swapdex", "completions")
    (buildpath/"swapdex.1").write Utils.safe_popen_read(bin/"swapdex", "manpage")
    man1.install "swapdex.1"
  end
  test do
    assert_match "swapdex 0.44.0", shell_output("#{bin}/swapdex --version")
  end
end
