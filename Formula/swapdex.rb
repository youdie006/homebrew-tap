class Swapdex < Formula
  desc "Switch between multiple Claude Code, Codex, Gemini, and Antigravity login accounts, locally and safely"
  homepage "https://github.com/youdie006/swapdex"
  version "0.167.11"
  license "MIT"
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/youdie006/swapdex/releases/download/v0.167.11/swapdex-aarch64-apple-darwin.tar.gz"
      sha256 "e3664b674560a42c2bb5346a8bbd5baf64835d7ffa5fb23c711c1f5c80824614"
    else
      url "https://github.com/youdie006/swapdex/releases/download/v0.167.11/swapdex-x86_64-apple-darwin.tar.gz"
      sha256 "0b354fc1edc338057ebd9e347f27addeb3e294f343387e645ffe78ef6d80c66d"
    end
  end
  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/youdie006/swapdex/releases/download/v0.167.11/swapdex-aarch64-unknown-linux-musl.tar.gz"
      sha256 "8ec98a4fe79545b8cd177450aad203bf659d37dde991067c92a049c20c5964bf"
    else
      url "https://github.com/youdie006/swapdex/releases/download/v0.167.11/swapdex-x86_64-unknown-linux-musl.tar.gz"
      sha256 "7b8a727d0da3de9c2c67b4799c38a592e9f9f728d1998b224165732b2fde30d1"
    end
  end
  def install
    bin.install "swapdex"
    generate_completions_from_executable(bin/"swapdex", "completions")
    (buildpath/"swapdex.1").write Utils.safe_popen_read(bin/"swapdex", "manpage")
    man1.install "swapdex.1"
  end
  test do
    assert_match "swapdex 0.167.11", shell_output("#{bin}/swapdex --version")
  end
end
